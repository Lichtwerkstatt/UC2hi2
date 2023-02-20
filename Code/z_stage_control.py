import RPi.GPIO as GPIO
import time

# set GPIO mode
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# define GPIO pins for each coil of the z-stepper
coil_A_1_pin = 18 # gray (GPIO1)
coil_A_2_pin = 22 # blue (GPIO3)
coil_B_1_pin = 17 # white (GPIO0)
coil_B_2_pin = 27 # purple (GPIO2)

# define the sequence of commands to move the stepper
StepCount = 8
Seq = list(range(0, StepCount))
Seq[0] = [0,1,0,0]
Seq[1] = [0,1,0,1]
Seq[2] = [0,0,0,1]
Seq[3] = [1,0,0,1]
Seq[4] = [1,0,0,0]
Seq[5] = [1,0,1,0]
Seq[6] = [0,0,1,0]
Seq[7] = [0,1,1,0]

# setup the GPIO pins as output
GPIO.setup(coil_A_1_pin, GPIO.OUT)
GPIO.setup(coil_A_2_pin, GPIO.OUT)
GPIO.setup(coil_B_1_pin, GPIO.OUT)
GPIO.setup(coil_B_2_pin, GPIO.OUT)

# function to set 1 step based on the coil value
def setStep(w1, w2, w3, w4):
    GPIO.output(coil_A_1_pin, w1)
    GPIO.output(coil_A_2_pin, w2)
    GPIO.output(coil_B_1_pin, w3)
    GPIO.output(coil_B_2_pin, w4)

# sequence to move forward x steps
def forward(delay, steps):
    for i in range(steps):
        for j in range(StepCount):
            setStep(Seq[j][0], Seq[j][1], Seq[j][2], Seq[j][3])
            time.sleep(delay)

# sequence to move backward x steps
def backwards(delay, steps):
    for i in range(steps):
        for j in reversed(range(StepCount)):
            setStep(Seq[j][0], Seq[j][1], Seq[j][2], Seq[j][3])
            time.sleep(delay)

while True:
    # get user input for direction
    direction = input("Enter 'f' for forward or 'b' for backward (enter 's' to end): ").lower()
    
    if direction == 's':
        print("Ending the program.")
        break
    
    # ask user for number of steps
    steps = input("Enter number of steps (512 = 1 rev): ")

    delay = 2

    if direction == 'f':
        forward(int(delay) / 1000.0, int(steps))
    elif direction == 'b':
        backwards(int(delay) / 1000.0, int(steps))
    else:
        print("Invalid direction input.")
