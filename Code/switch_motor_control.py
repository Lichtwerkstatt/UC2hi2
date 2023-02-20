import RPi.GPIO as GPIO
from RpiMotorLib import RpiMotorLib
from picamera import PiCamera
import time

# set GPIO mode
GPIO.setmode(GPIO.BCM)

camera = PiCamera()

# define number of stepper steps to move 1 mm
steps_per_mm = 5

#define GPIO pins
y_direction= 21 # Direction (DIR) GPIO Pin
y_step = 20 # Step GPIO Pin
x_direction = 23
x_step = 24
microstep_pins = (29,29,29) # dummy variable since not using microstepping (yet)
x_en_pin = 6 # enable pins (set low to enable)
y_en_pin = 5
x_switch_pin = 19   # pin that is connected to the limit switch
y_switch_pin = 26

# Declare an instance of class pass GPIO pins numbers and the motor type
x_motor = RpiMotorLib.A4988Nema(x_direction, x_step, microstep_pins, "A4988")
y_motor = RpiMotorLib.A4988Nema(y_direction, y_step, microstep_pins, "A4988")
GPIO.setup(x_en_pin,GPIO.OUT) # set enable pin as output
GPIO.setup(y_en_pin,GPIO.OUT)

# Set up switches
GPIO.setup(x_switch_pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(y_switch_pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)

# Disable stepper motors to start
GPIO.output(x_en_pin,GPIO.HIGH) # disable to start
GPIO.output(y_en_pin,GPIO.HIGH)

# Ask user for program mode: test motors or test switches
program_mode = input("Input 's' to test switch implementation, or 'm' to test motors: ").lower()

if program_mode == 'm':
    while True:
        # get user input for motor to move and how much to move the motor
        motor_type = input("Input 'x' or 'y' to select that motor. Input 'c' or 'o' to turn on/off the a pi camera if using. Input 'f' to end program: ").lower()
    
        # check whether to end the program
        if motor_type == 'f':
            print("Ending program.")
            #GPIO.cleanup() #free the GPIO pins
            break
        elif motor_type == 'c':
            camera.start_preview()
            continue
        elif motor_type == 'o':
            camera.stop_preview()
            continue

        # Ask the user for the distance to move in mm, then convert to number of steps
        number_of_steps = int(input("Input distance to move in mm (negative moves opposite direction): "))*steps_per_mm 

        # set motor direction based on user input
        if number_of_steps < 0:
            direction = False
            number_of_steps = -1*number_of_steps
        else:
            direction = True

        # move x motor
        if motor_type == 'x':
        
            # set enable pin to low to enable
            GPIO.output(x_en_pin,GPIO.LOW)

            print("Moving x-motor {} mm".format(number_of_steps/steps_per_mm))
            x_motor.motor_go(direction, # True=Clockwise, False=Counter-Clockwise
                         "Full", # Step type (Full,Half,1/4,1/8,1/16,1/32
                         number_of_steps, # number of steps
                         0.005, # step delay [sec]
                         False, # True = print verbose output
                         0.05) # initial delay [sec]
            # disable driver again
            GPIO.output(x_en_pin,GPIO.HIGH)

        # move y motor
        elif motor_type == 'y':

            GPIO.output(y_en_pin,GPIO.LOW)

            print("Moving y-motor {} mm".format(number_of_steps/steps_per_mm))
            y_motor.motor_go(direction,
                         "Full",
                         number_of_steps,
                         0.005,
                         False,
                         0.05)

            GPIO.output(y_en_pin,GPIO.HIGH)

        else:
            print("Invalid motor selection.")

# test switches if user input 's'
elif program_mode == 's':
    print("Press a switch to test connection. Press both to end program.")
    #print("Camera starting in 5 seconds...")
    time.sleep(5)
    #camera.start_preview()
    while True:
        if GPIO.input(x_switch_pin) == 0 and GPIO.input(y_switch_pin) == 0:
            #camera.stop_preview()
            print("Both switches pressed: ending program.")
            time.sleep(1)
            break
        elif GPIO.input(x_switch_pin) == 0:
            print("X limit switch is pressed.")
            # move to start in x-dir
            """
            GPIO.output(x_en_pin,GPIO.LOW)

            x_motor.motor_go(True,
                            "Full",
                            225,
                            0.005,
                            False,
                            0.05)
            GPIO.output(x_en_pin,GPIO.HIGH)
            time.sleep(0.5)
            """
        elif GPIO.input(y_switch_pin) == 0:
            print("Y limit switch is pressed.")
            # move to start in y-dir
            """
            GPIO.output(y_en_pin,GPIO.LOW)

            y_motor.motor_go(True,
                            "Full",
                            348,
                            0.005,
                            False,
                            0.05)

            GPIO.output(y_en_pin,GPIO.HIGH)
            time.sleep(0.5)
            """
else:
    print("Invalid input. Ending program.")
