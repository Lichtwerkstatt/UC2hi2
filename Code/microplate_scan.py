import RPi.GPIO as GPIO
from RpiMotorLib import RpiMotorLib
from picamera import PiCamera
from time import sleep

# set GPIO mode
GPIO.setmode(GPIO.BCM)

# define constants
steps_per_mm = 5
mm_between_wells = 9
step_delay = 0.02   # [sec] delay between steps
initial_delay = 0.05 # [sec] delay before initial step
verbose_output = False # True = print verbose output
step_type = "Full" # Full, Half, 1/4, 1/8, 1/16, 1/32 # also must connect appropriate microstepping pins, and set the variable appropriately below
y_direction = False # y dir always moves the same way when scanning
x_wells = 12 # number of wells in the x direction
y_wells = 8 # number of wells in the y direction
initial_x_steps = 227   # steps to move after hitting x switch
initial_y_steps = 348   # steps to move after hitting y switch
switch_searching_steps = 10 # steps to move in one command when searching for a switch

# RPi and Motor Pre-allocations of GPIO pins
y_dir_pin = 21 # Direction (DIR) GPIO Pin
y_step_pin = 20 # Step GPIO Pin
x_dir_pin = 23
x_step_pin = 24
microstep_pins = (29,29,29) # dummy variable since not using microstepping (yet)
y_en_pin = 5 # enable pin (LOW to enable)
x_en_pin = 6
y_switch_pin = 26   # y limit switch pin
x_switch_pin = 19   # x limit switch pin

# set up the camera variable
camera = PiCamera()

# Declare instances of the stepper class, pass GPIO pin numbers and the motor driver type
x_motor = RpiMotorLib.A4988Nema(x_dir_pin, x_step_pin, microstep_pins, "A4988")
y_motor = RpiMotorLib.A4988Nema(y_dir_pin, y_step_pin, microstep_pins, "A4988")

# set up the switches
GPIO.setup(x_switch_pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(y_switch_pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)

# set the enable pins for each motor as output
GPIO.setup(y_en_pin,GPIO.OUT)
GPIO.setup(x_en_pin,GPIO.OUT)

# pull enable pins high to start with motors disabled - only enable when scanning
GPIO.output(y_en_pin,GPIO.HIGH)
GPIO.output(x_en_pin,GPIO.HIGH)

# main scanning loop
while True:
    # get user input for scanning the wells, or ending the program
    user_input = input("To scan, stay clear of the microplate stage and press 's'. Input 'f' to end program: ").lower()
    
    # check whether to end the program or perform a scan
    if user_input == 'f':
        print("Ending program.")
        #GPIO.cleanup() # clear GPIO allocations once the program is done
        break

    elif user_input == 's':
        print("Beginning the scan. Moving to starting position")
        camera.start_preview()  # turn the camera on to see what is happening
        sleep(1) #delay a moment to let camera turn on

        # move in -x (False) direction until switch is hit, then move to x location
        GPIO.output(x_en_pin,GPIO.LOW)  # enable x motor
        while GPIO.input(x_switch_pin) == 1:   # while it is not pressed, move to switch
            # move in -x direction until switch is pressed
            x_motor.motor_go(False,
                             step_type,
                             switch_searching_steps,
                             step_delay,
                             verbose_output,
                             initial_delay*0.1)

        # move set amount in +x direction to start point
        x_motor.motor_go(True,
                         step_type,
                         initial_x_steps,
                         step_delay,
                         verbose_output,
                         initial_delay)
        GPIO.output(x_en_pin,GPIO.HIGH) # disable x motor

        # move in -y (False) direction until switch is hit, then move to y location
        GPIO.output(y_en_pin,GPIO.LOW)  # enable y motor

        while GPIO.input(y_switch_pin) == 1:   # while it is not pressed, move to switch
            # move in -y direction until switch is pressed
            y_motor.motor_go(False,
                             step_type,
                             switch_searching_steps,
                             step_delay,
                             verbose_output,
                             initial_delay*0.1)
            
        # move set amount in +y direction to start point
        y_motor.motor_go(True,
                         step_type,
                         initial_y_steps,
                         step_delay,
                         verbose_output,
                         initial_delay)
        GPIO.output(y_en_pin,GPIO.HIGH) # disable y motor
        
        # start the scan
        for y in range(y_wells): # 8 wells but only move 7 times, range from 0-7 (last one will be cancelled)
            #print("y well: {}".format(y+1))
            if y % 2 == 0: # even numbers of y have x moving positively, opposite for odd
                x_direction = True
                x_well_range = range(x_wells-1)
                photo_offset = 2
            else:
                x_direction = False
                x_well_range = reversed(range(1,x_wells))
                photo_offset = 0

            # set x-motor driver enable pin to low to enable the driver
            GPIO.output(x_en_pin,GPIO.LOW)

            for x in x_well_range: # only need to move x_wells-1 times through each set
                #print("x well: {}".format(x+1))

                # take an image of the well
                camera.capture('scan_images/well_x_{}_y_{}.jpg'.format(x+1,y+1))

                x_motor.motor_go(x_direction, # True=CW, False=CCW
                                 step_type, # Step type (Full,Half,1/4,1/8,1/16,1/32)
                                 mm_between_wells*steps_per_mm, # number of steps
                                 step_delay, # step delay [sec]
                                 verbose_output, # True = print verbose output
                                 initial_delay) # initial delay [sec]

            # take one more picture after moving to the last well in a column
            camera.capture('scan_images/well_x_{}_y_{}.jpg'.format(x+photo_offset,y+1))

            # once again disable the x-motor driver
            GPIO.output(x_en_pin,GPIO.HIGH)

            # after moving x through all the wells, move y to the next row
            if y < y_wells-1:   # move 1 less in y direction as we are already at the end, so don't move it anymore
                
                # set y-motor driver enable pin low to enable the driver
                GPIO.output(y_en_pin,GPIO.LOW)

                y_motor.motor_go(y_direction, # y direction is always the same
                                 step_type,
                                 mm_between_wells*steps_per_mm,
                                 step_delay,
                                 verbose_output,
                                 initial_delay)

                # once again disable the y-motor driver
                GPIO.output(y_en_pin,GPIO.HIGH)
        
        camera.stop_preview()   # turn camera off at end of scan

    else:
        print("Invalid input. Please try again.")
