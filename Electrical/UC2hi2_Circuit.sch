EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 63F3F2EE
P 10550 5950
F 0 "#PWR?" H 10550 5700 50  0001 C CNN
F 1 "GND" H 10555 5777 50  0000 C CNN
F 2 "" H 10550 5950 50  0001 C CNN
F 3 "" H 10550 5950 50  0001 C CNN
	1    10550 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R1
U 1 1 63F3FEAD
P 10000 5000
F 0 "R1" V 10205 5000 50  0000 C CNN
F 1 "1k" V 10114 5000 50  0000 C CNN
F 2 "" V 10040 4990 50  0001 C CNN
F 3 "~" H 10000 5000 50  0001 C CNN
	1    10000 5000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R2
U 1 1 63F40C71
P 10000 5500
F 0 "R2" V 10205 5500 50  0000 C CNN
F 1 "1k" V 10114 5500 50  0000 C CNN
F 2 "" V 10040 5490 50  0001 C CNN
F 3 "~" H 10000 5500 50  0001 C CNN
	1    10000 5500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9600 5500 9850 5500
Wire Wire Line
	9600 5000 9850 5000
Wire Wire Line
	10150 5000 10550 5000
Wire Wire Line
	10550 5000 10550 5500
Wire Wire Line
	10150 5500 10550 5500
Text GLabel 8900 5400 0    50   Output ~ 0
GPIO26
Text GLabel 8900 4900 0    50   Output ~ 0
GPIO19
Wire Wire Line
	8900 4900 9200 4900
Wire Wire Line
	8900 5400 9200 5400
Wire Wire Line
	10550 5500 10550 5950
Connection ~ 10550 5500
$Comp
L power:GNDREF #PWR?
U 1 1 63F4BDC2
P 2350 7100
F 0 "#PWR?" H 2350 6850 50  0001 C CNN
F 1 "GNDREF" H 2355 6927 50  0000 C CNN
F 2 "" H 2350 7100 50  0001 C CNN
F 3 "" H 2350 7100 50  0001 C CNN
	1    2350 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 63F4C4B7
P 1050 6550
F 0 "#PWR?" H 1050 6400 50  0001 C CNN
F 1 "+12V" V 1065 6678 50  0000 L CNN
F 2 "" H 1050 6550 50  0001 C CNN
F 3 "" H 1050 6550 50  0001 C CNN
	1    1050 6550
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP1 C2
U 1 1 63F4D0AF
P 1750 6800
F 0 "C2" H 1865 6846 50  0000 L CNN
F 1 "10 uF" H 1865 6755 50  0000 L CNN
F 2 "" H 1750 6800 50  0001 C CNN
F 3 "~" H 1750 6800 50  0001 C CNN
	1    1750 6800
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM7805_TO220 U1
U 1 1 63F45BC0
P 2350 6550
F 0 "U1" H 2350 6792 50  0000 C CNN
F 1 "LM7805_TO220" H 2350 6701 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2350 6775 50  0001 C CIN
F 3 "https://www.onsemi.cn/PowerSolutions/document/MC7800-D.PDF" H 2350 6500 50  0001 C CNN
	1    2350 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 7100 2350 7000
Text GLabel 3750 6550 2    50   Output ~ 0
5V_Regulated
$Comp
L Device:CP1 C3
U 1 1 63F4E8E0
P 3000 6800
F 0 "C3" H 3115 6846 50  0000 L CNN
F 1 "1 uF" H 3115 6755 50  0000 L CNN
F 2 "" H 3000 6800 50  0001 C CNN
F 3 "~" H 3000 6800 50  0001 C CNN
	1    3000 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 6550 3000 6550
Wire Wire Line
	1750 6950 1750 7000
Wire Wire Line
	1750 7000 2350 7000
Connection ~ 2350 7000
Wire Wire Line
	2350 7000 2350 6850
Wire Wire Line
	3000 6950 3000 7000
Wire Wire Line
	1750 6650 1750 6550
Connection ~ 1750 6550
Wire Wire Line
	1750 6550 2050 6550
Wire Wire Line
	3000 6650 3000 6550
Connection ~ 3000 6550
Wire Wire Line
	3000 6550 3750 6550
$Comp
L Device:CP1 C1
U 1 1 63F559B0
P 1200 6800
F 0 "C1" H 1315 6846 50  0000 L CNN
F 1 "100 uF" H 1315 6755 50  0000 L CNN
F 2 "" H 1200 6800 50  0001 C CNN
F 3 "~" H 1200 6800 50  0001 C CNN
	1    1200 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 6550 1200 6550
Wire Wire Line
	1200 6650 1200 6550
Connection ~ 1200 6550
Wire Wire Line
	1200 6550 1750 6550
Wire Wire Line
	1200 6950 1200 7000
Wire Wire Line
	1200 7000 1750 7000
Connection ~ 1750 7000
$Comp
L Driver_Motor:Pololu_Breakout_A4988 A2
U 1 1 63F5A379
P 1950 4700
F 0 "A2" H 1356 5581 50  0000 C CNN
F 1 "A4988 Motor Driver - Y" H 1356 5490 50  0000 C CNN
F 2 "Module:Pololu_Breakout-16_15.2x20.3mm" H 2225 3950 50  0001 L CNN
F 3 "https://www.pololu.com/product/2980/pictures" H 2050 4400 50  0001 C CNN
	1    1950 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4300 1450 4300
Wire Wire Line
	1450 4300 1450 4400
Wire Wire Line
	1450 4400 1550 4400
Wire Wire Line
	1550 1650 1450 1650
Wire Wire Line
	1450 1650 1450 1750
Wire Wire Line
	1450 1750 1550 1750
$Comp
L Motor:Stepper_Motor_bipolar M1
U 1 1 63F5F969
P 3400 2450
F 0 "M1" H 3588 2574 50  0000 L CNN
F 1 "X Stepper Motor" H 3588 2483 50  0000 L CNN
F 2 "" H 3410 2440 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 3410 2440 50  0001 C CNN
	1    3400 2450
	1    0    0    -1  
$EndComp
$Comp
L Motor:Stepper_Motor_bipolar M2
U 1 1 63F60BCE
P 3400 5100
F 0 "M2" H 3588 5224 50  0000 L CNN
F 1 "Y Stepper Motor" H 3588 5133 50  0000 L CNN
F 2 "" H 3410 5090 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 3410 5090 50  0001 C CNN
	1    3400 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1950 3500 1950
Wire Wire Line
	3500 1950 3500 2150
Wire Wire Line
	3300 2150 3300 2050
Wire Wire Line
	3300 2050 2450 2050
Wire Wire Line
	2450 2150 3100 2150
Wire Wire Line
	3100 2150 3100 2350
Wire Wire Line
	2450 2250 2450 2550
Wire Wire Line
	2450 2550 3100 2550
$Comp
L power:GND #PWR?
U 1 1 63F6D65A
P 1950 5650
F 0 "#PWR?" H 1950 5400 50  0001 C CNN
F 1 "GND" H 1955 5477 50  0000 C CNN
F 2 "" H 1950 5650 50  0001 C CNN
F 3 "" H 1950 5650 50  0001 C CNN
	1    1950 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63F6E057
P 1950 3050
F 0 "#PWR?" H 1950 2800 50  0001 C CNN
F 1 "GND" H 1955 2877 50  0000 C CNN
F 2 "" H 1950 3050 50  0001 C CNN
F 3 "" H 1950 3050 50  0001 C CNN
	1    1950 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 63F6EE82
P 2150 3150
F 0 "#PWR?" H 2150 2900 50  0001 C CNN
F 1 "GNDREF" H 2155 2977 50  0000 C CNN
F 2 "" H 2150 3150 50  0001 C CNN
F 3 "" H 2150 3150 50  0001 C CNN
	1    2150 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 63F6F913
P 2150 5750
F 0 "#PWR?" H 2150 5500 50  0001 C CNN
F 1 "GNDREF" H 2155 5577 50  0000 C CNN
F 2 "" H 2150 5750 50  0001 C CNN
F 3 "" H 2150 5750 50  0001 C CNN
	1    2150 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 5500 1950 5650
Wire Wire Line
	2150 5500 2150 5750
Wire Wire Line
	2150 3150 2150 2850
Wire Wire Line
	1950 2850 1950 3050
NoConn ~ 1450 2350
NoConn ~ 1450 2450
NoConn ~ 1450 2550
NoConn ~ 1450 5000
NoConn ~ 1450 5100
NoConn ~ 1450 5200
Wire Wire Line
	1450 5000 1550 5000
Wire Wire Line
	1450 5100 1550 5100
Wire Wire Line
	1450 5200 1550 5200
Wire Wire Line
	1450 2350 1550 2350
Wire Wire Line
	1450 2450 1550 2450
Wire Wire Line
	1450 2550 1550 2550
$Comp
L power:+12V #PWR?
U 1 1 63F84FCA
P 2150 1050
F 0 "#PWR?" H 2150 900 50  0001 C CNN
F 1 "+12V" H 2087 1223 50  0000 L CNN
F 2 "" H 2150 1050 50  0001 C CNN
F 3 "" H 2150 1050 50  0001 C CNN
	1    2150 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1050 2150 1350
$Comp
L Driver_Motor:Pololu_Breakout_A4988 A1
U 1 1 63F58048
P 1950 2050
F 0 "A1" H 1409 2931 50  0000 C CNN
F 1 "A4988 Motor Driver - X" H 1409 2840 50  0000 C CNN
F 2 "Module:Pololu_Breakout-16_15.2x20.3mm" H 2225 1300 50  0001 L CNN
F 3 "https://www.pololu.com/product/2980/pictures" H 2050 1750 50  0001 C CNN
	1    1950 2050
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 63F8B0A3
P 2150 3700
F 0 "#PWR?" H 2150 3550 50  0001 C CNN
F 1 "+12V" H 2087 3873 50  0000 L CNN
F 2 "" H 2150 3700 50  0001 C CNN
F 3 "" H 2150 3700 50  0001 C CNN
	1    2150 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3700 2150 4000
Wire Wire Line
	2350 7000 3000 7000
$Comp
L Connector:Raspberry_Pi_2_3 J1
U 1 1 63FA5475
P 6400 4200
F 0 "J1" H 5574 5681 50  0000 C CNN
F 1 "Raspberry Pi Header" H 5574 5590 50  0000 C CNN
F 2 "" H 6400 4200 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 6400 4200 50  0001 C CNN
	1    6400 4200
	1    0    0    -1  
$EndComp
Text Notes 8500 4450 0    50   ~ 10
Limit Switches\n
Text Notes 750  6100 0    50   ~ 10
Power Supply\n
Text Notes 600  800  0    50   ~ 10
X-Y Motor Drivers\n
Text Notes 5100 1950 0    50   ~ 10
Raspberry Pi\n
Text Notes 7700 1000 0    50   ~ 10
Z Motor Driver\n
$Comp
L power:+5V #PWR?
U 1 1 63FCC9D8
P 6200 2650
F 0 "#PWR?" H 6200 2500 50  0001 C CNN
F 1 "+5V" H 6215 2823 50  0000 C CNN
F 2 "" H 6200 2650 50  0001 C CNN
F 3 "" H 6200 2650 50  0001 C CNN
	1    6200 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63FCD1E4
P 1950 1050
F 0 "#PWR?" H 1950 900 50  0001 C CNN
F 1 "+5V" H 1965 1223 50  0000 C CNN
F 2 "" H 1950 1050 50  0001 C CNN
F 3 "" H 1950 1050 50  0001 C CNN
	1    1950 1050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63FCDAAB
P 1950 3700
F 0 "#PWR?" H 1950 3550 50  0001 C CNN
F 1 "+5V" H 1965 3873 50  0000 C CNN
F 2 "" H 1950 3700 50  0001 C CNN
F 3 "" H 1950 3700 50  0001 C CNN
	1    1950 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 1050 1950 1350
Wire Wire Line
	1950 3700 1950 4000
Wire Wire Line
	6200 2650 6200 2900
Wire Wire Line
	2450 4600 3500 4600
Wire Wire Line
	3500 4600 3500 4800
Wire Wire Line
	3300 4800 3300 4700
Wire Wire Line
	3300 4700 2450 4700
Wire Wire Line
	2450 4800 3100 4800
Wire Wire Line
	3100 4800 3100 5000
Wire Wire Line
	3100 5200 2450 5200
Wire Wire Line
	2450 5200 2450 4900
Text GLabel 6300 2300 1    50   Output ~ 10
Touchscreen_5V_Supply
Wire Wire Line
	6300 2300 6300 2900
Text GLabel 5650 5650 0    50   Output ~ 10
Touchscreen_GND
Wire Wire Line
	5650 5650 6000 5650
Wire Wire Line
	6000 5650 6000 5500
$Comp
L power:GND #PWR?
U 1 1 63FE69FF
P 6200 5950
F 0 "#PWR?" H 6200 5700 50  0001 C CNN
F 1 "GND" H 6205 5777 50  0000 C CNN
F 2 "" H 6200 5950 50  0001 C CNN
F 3 "" H 6200 5950 50  0001 C CNN
	1    6200 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 5500 6200 5950
Text GLabel 5300 4000 0    50   Input ~ 0
GPIO19
Wire Wire Line
	5300 4000 5600 4000
Text GLabel 5300 4800 0    50   Input ~ 0
GPIO26
Wire Wire Line
	5300 4800 5600 4800
Text GLabel 1300 1950 0    50   Input ~ 0
GPIO6
Text GLabel 1300 2050 0    50   Input ~ 0
GPIO24
Text GLabel 1300 2150 0    50   Input ~ 0
GPIO23
Wire Wire Line
	1300 2050 1550 2050
Wire Wire Line
	1550 1950 1300 1950
Wire Wire Line
	1550 2150 1300 2150
Text GLabel 1300 4600 0    50   Input ~ 0
GPIO5
Text GLabel 1300 4700 0    50   Input ~ 0
GPIO20
Text GLabel 1300 4800 0    50   Input ~ 0
GPIO21
Wire Wire Line
	1300 4700 1550 4700
Wire Wire Line
	1550 4600 1300 4600
Wire Wire Line
	1550 4800 1300 4800
Text GLabel 7650 4000 2    50   Output ~ 0
GPIO5
Text GLabel 5300 4100 0    50   Output ~ 0
GPIO20
Text GLabel 5300 4200 0    50   Output ~ 0
GPIO21
Wire Wire Line
	5300 4100 5600 4100
Wire Wire Line
	5300 4200 5600 4200
Text GLabel 7650 4100 2    50   Output ~ 0
GPIO6
Text GLabel 5300 4600 0    50   Output ~ 0
GPIO24
Text GLabel 5300 4500 0    50   Output ~ 0
GPIO23
Wire Wire Line
	7650 4000 7200 4000
Wire Wire Line
	7200 4100 7650 4100
Wire Wire Line
	5300 4500 5600 4500
Wire Wire Line
	5300 4600 5600 4600
$Comp
L Switch:SW_SPDT SW1
U 1 1 6402563D
P 9400 4900
F 0 "SW1" H 9400 5185 50  0000 C CNN
F 1 "X-Switch" H 9400 5094 50  0000 C CNN
F 2 "" H 9400 4900 50  0001 C CNN
F 3 "~" H 9400 4900 50  0001 C CNN
	1    9400 4900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPDT SW2
U 1 1 640338D3
P 9400 5400
F 0 "SW2" H 9400 5685 50  0000 C CNN
F 1 "Y-Switch" H 9400 5594 50  0000 C CNN
F 2 "" H 9400 5400 50  0001 C CNN
F 3 "~" H 9400 5400 50  0001 C CNN
	1    9400 5400
	1    0    0    -1  
$EndComp
NoConn ~ 9750 4800
NoConn ~ 9750 5300
Wire Wire Line
	9750 4800 9600 4800
Wire Wire Line
	9750 5300 9600 5300
Text Notes 9900 4550 0    50   ~ 0
Connect to normally open (NO)\non 3-pin limit switch
Text GLabel 5300 3700 0    50   Output ~ 0
GPIO17
Wire Wire Line
	5300 3700 5600 3700
Text GLabel 5300 4400 0    50   Output ~ 0
GPIO22
Wire Wire Line
	5300 4400 5600 4400
Text GLabel 5300 4900 0    50   Output ~ 0
GPIO27
Wire Wire Line
	5300 4900 5600 4900
Text GLabel 5300 3800 0    50   Output ~ 0
GPIO18
Wire Wire Line
	5300 3800 5600 3800
$Comp
L RB_Moto2:RB_Moto_2 A3
U 1 1 64054BA0
P 9100 1750
F 0 "A3" H 9449 2065 50  0000 C CNN
F 1 "RB_Moto_2" H 9449 1974 50  0000 C CNN
F 2 "" H 9450 2050 50  0001 C CNN
F 3 "" H 9450 2050 50  0001 C CNN
	1    9100 1750
	1    0    0    -1  
$EndComp
Text GLabel 8250 1850 0    50   Input ~ 0
5V_Regulated
Wire Wire Line
	8250 1850 8900 1850
Wire Wire Line
	8900 1750 8750 1750
NoConn ~ 8800 1950
Wire Wire Line
	8800 1950 8900 1950
Text GLabel 10650 1850 2    50   Input ~ 0
GPIO18
Text GLabel 10650 1700 2    50   Input ~ 0
GPIO17
Text GLabel 10650 2000 2    50   Input ~ 0
GPIO27
Text GLabel 10650 2150 2    50   Input ~ 0
GPIO22
Wire Wire Line
	10000 1700 10650 1700
Wire Wire Line
	10000 1850 10650 1850
Wire Wire Line
	10650 2000 10000 2000
Wire Wire Line
	10000 2150 10650 2150
$Comp
L power:GNDREF #PWR?
U 1 1 6409C758
P 8750 1700
F 0 "#PWR?" H 8750 1450 50  0001 C CNN
F 1 "GNDREF" H 8755 1527 50  0000 C CNN
F 2 "" H 8750 1700 50  0001 C CNN
F 3 "" H 8750 1700 50  0001 C CNN
	1    8750 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	8750 1750 8750 1700
Text GLabel 9400 2500 0    50   Output ~ 0
To_Z_Stepper
Wire Wire Line
	9550 2300 9550 2500
Wire Wire Line
	9550 2500 9400 2500
$EndSCHEMATC
