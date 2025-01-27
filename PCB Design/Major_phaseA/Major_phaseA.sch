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
L Amplifier_Instrumentation:AD620 U1
U 1 1 5E47C174
P 4456 3225
F 0 "U1" H 4900 3271 50  0000 L CNN
F 1 "AD620" H 4900 3180 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 4456 3225 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD620.pdf" H 4456 3225 50  0001 C CNN
	1    4456 3225
	1    0    0    -1  
$EndComp
$Comp
L oppo:op37G U2
U 1 1 5E47D3F8
P 6096 3182
F 0 "U2" H 6121 3613 50  0000 C CNN
F 1 "op37G" H 6121 3522 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 6096 3182 50  0001 C CNN
F 3 "" H 6096 3182 50  0001 C CNN
	1    6096 3182
	1    0    0    -1  
$EndComp
$Comp
L oppo:op37G U3
U 1 1 5E47DACF
P 7782 3167
F 0 "U3" H 7807 3598 50  0000 C CNN
F 1 "op37G" H 7807 3507 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 7782 3167 50  0001 C CNN
F 3 "" H 7782 3167 50  0001 C CNN
	1    7782 3167
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R1
U 1 1 5E47E754
P 3785 3227
F 0 "R1" H 3853 3273 50  0000 L CNN
F 1 "100 Ohm" H 3853 3182 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3785 3227 50  0001 C CNN
F 3 "~" H 3785 3227 50  0001 C CNN
	1    3785 3227
	1    0    0    -1  
$EndComp
Wire Wire Line
	3785 3327 4056 3327
Wire Wire Line
	4056 3327 4056 3325
Wire Wire Line
	3785 3127 4057 3127
Wire Wire Line
	4057 3127 4057 3125
Wire Wire Line
	4057 3125 4056 3125
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5E47FB19
P 4471 2419
F 0 "J2" V 4533 2563 50  0000 L CNN
F 1 "Conn_01x03_Male" V 4624 2563 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4471 2419 50  0001 C CNN
F 3 "~" H 4471 2419 50  0001 C CNN
	1    4471 2419
	0    1    1    0   
$EndComp
Wire Wire Line
	4371 2619 4371 2647
Wire Wire Line
	4371 2925 4356 2925
Wire Wire Line
	4556 3525 4506 3525
Wire Wire Line
	4471 3525 4471 2742
Wire Wire Line
	4356 3525 4356 3554
Wire Wire Line
	4356 3554 4623 3554
Wire Wire Line
	4623 2673 4571 2673
Wire Wire Line
	4571 2673 4571 2619
$Comp
L power:GND #PWR02
U 1 1 5E482B6D
P 4086 2710
F 0 "#PWR02" H 4086 2460 50  0001 C CNN
F 1 "GND" V 4091 2582 50  0000 R CNN
F 2 "" H 4086 2710 50  0001 C CNN
F 3 "" H 4086 2710 50  0001 C CNN
	1    4086 2710
	0    1    1    0   
$EndComp
$Comp
L power:+9V #PWR03
U 1 1 5E483466
P 4090 2607
F 0 "#PWR03" H 4090 2457 50  0001 C CNN
F 1 "+9V" V 4105 2735 50  0000 L CNN
F 2 "" H 4090 2607 50  0001 C CNN
F 3 "" H 4090 2607 50  0001 C CNN
	1    4090 2607
	0    -1   -1   0   
$EndComp
$Comp
L power:-9V #PWR01
U 1 1 5E483BA9
P 4082 2809
F 0 "#PWR01" H 4082 2684 50  0001 C CNN
F 1 "-9V" V 4097 2937 50  0000 L CNN
F 2 "" H 4082 2809 50  0001 C CNN
F 3 "" H 4082 2809 50  0001 C CNN
	1    4082 2809
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4090 2607 4090 2647
Wire Wire Line
	4090 2647 4371 2647
Connection ~ 4371 2647
Wire Wire Line
	4371 2647 4371 2891
Wire Wire Line
	4085 2710 4086 2710
Connection ~ 4471 2710
Wire Wire Line
	4471 2710 4471 2619
Connection ~ 4086 2710
Wire Wire Line
	4086 2710 4471 2710
Wire Wire Line
	4082 2809 4623 2809
Wire Wire Line
	4623 2673 4623 2809
Connection ~ 4623 2809
Wire Wire Line
	4623 2809 4623 2996
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 5E485FB5
P 3090 3203
F 0 "J1" H 3198 3484 50  0000 C CNN
F 1 "Conn_01x03_Male" H 3198 3393 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3090 3203 50  0001 C CNN
F 3 "~" H 3090 3203 50  0001 C CNN
	1    3090 3203
	1    0    0    -1  
$EndComp
Wire Wire Line
	3290 3103 3344 3103
Wire Wire Line
	3697 3103 3697 3049
Wire Wire Line
	3697 3049 4056 3049
Wire Wire Line
	4056 3049 4056 3025
Wire Wire Line
	3290 3203 3372 3203
Wire Wire Line
	3696 3203 3696 3442
Wire Wire Line
	3696 3442 4056 3442
Wire Wire Line
	4056 3442 4056 3425
Wire Wire Line
	3290 3303 3397 3303
Wire Wire Line
	3640 3303 3640 3636
Wire Wire Line
	3640 3636 4506 3636
Wire Wire Line
	4506 3636 4506 3525
Connection ~ 4506 3525
Wire Wire Line
	4506 3525 4471 3525
Text GLabel 3080 3446 0    50   Input ~ 0
Electrode1
Text GLabel 3075 3592 0    50   Input ~ 0
Electrode2
Text GLabel 3070 3753 0    50   Input ~ 0
Electrode_GND
Wire Wire Line
	3080 3446 3344 3446
Wire Wire Line
	3344 3446 3344 3103
Connection ~ 3344 3103
Wire Wire Line
	3344 3103 3697 3103
Wire Wire Line
	3075 3592 3372 3592
Wire Wire Line
	3372 3592 3372 3203
Connection ~ 3372 3203
Wire Wire Line
	3372 3203 3696 3203
Wire Wire Line
	3070 3753 3397 3753
Wire Wire Line
	3397 3753 3397 3303
Connection ~ 3397 3303
Wire Wire Line
	3397 3303 3640 3303
$Comp
L Device:CP_Small C1
U 1 1 5E48F57C
P 5037 3224
F 0 "C1" V 5262 3224 50  0000 C CNN
F 1 "0.1 uF" V 5171 3224 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 5037 3224 50  0001 C CNN
F 3 "~" H 5037 3224 50  0001 C CNN
	1    5037 3224
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP_Small C2
U 1 1 5E49018B
P 5395 3225
F 0 "C2" V 5620 3225 50  0000 C CNN
F 1 "01 uF" V 5529 3225 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 5395 3225 50  0001 C CNN
F 3 "~" H 5395 3225 50  0001 C CNN
	1    5395 3225
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small_US R2
U 1 1 5E490CED
P 5219 3410
F 0 "R2" H 5287 3456 50  0000 L CNN
F 1 "1.5 MOhm" H 5287 3365 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" H 5219 3410 50  0001 C CNN
F 3 "~" H 5219 3410 50  0001 C CNN
	1    5219 3410
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R3
U 1 1 5E49138A
P 5645 3378
F 0 "R3" H 5713 3424 50  0000 L CNN
F 1 "1.5 MOhm" H 5713 3333 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" H 5645 3378 50  0001 C CNN
F 3 "~" H 5645 3378 50  0001 C CNN
	1    5645 3378
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R5
U 1 1 5E491B38
P 5856 2780
F 0 "R5" V 5651 2780 50  0000 C CNN
F 1 "3.3 KOhm" V 5742 2780 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 5856 2780 50  0001 C CNN
F 3 "~" H 5856 2780 50  0001 C CNN
	1    5856 2780
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R9
U 1 1 5E496A1B
P 7745 2643
F 0 "R9" V 7540 2643 50  0000 C CNN
F 1 "5 KOhm" V 7631 2643 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 7745 2643 50  0001 C CNN
F 3 "~" H 7745 2643 50  0001 C CNN
	1    7745 2643
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R8
U 1 1 5E496E2C
P 7371 2465
F 0 "R8" H 7439 2511 50  0000 L CNN
F 1 "10 KOhm" H 7439 2420 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 7371 2465 50  0001 C CNN
F 3 "~" H 7371 2465 50  0001 C CNN
	1    7371 2465
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C4
U 1 1 5E49A511
P 7707 3648
F 0 "C4" V 7932 3648 50  0000 C CNN
F 1 "0.1 uF" V 7841 3648 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7707 3648 50  0001 C CNN
F 3 "~" H 7707 3648 50  0001 C CNN
	1    7707 3648
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP_Small C3
U 1 1 5E49AE10
P 7451 3334
F 0 "C3" H 7363 3288 50  0000 R CNN
F 1 "0.1 uF" H 7363 3379 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7451 3334 50  0001 C CNN
F 3 "~" H 7451 3334 50  0001 C CNN
	1    7451 3334
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small_US R7
U 1 1 5E49B342
P 7254 3212
F 0 "R7" V 7049 3212 50  0000 C CNN
F 1 "16 KOhm" V 7140 3212 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 7254 3212 50  0001 C CNN
F 3 "~" H 7254 3212 50  0001 C CNN
	1    7254 3212
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R6
U 1 1 5E49B704
P 6779 3204
F 0 "R6" V 6574 3204 50  0000 C CNN
F 1 "16 KOhm" V 6665 3204 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 6779 3204 50  0001 C CNN
F 3 "~" H 6779 3204 50  0001 C CNN
	1    6779 3204
	0    1    1    0   
$EndComp
Wire Wire Line
	4856 3225 4937 3225
Wire Wire Line
	4937 3225 4937 3224
Wire Wire Line
	5295 3224 5295 3225
Wire Wire Line
	5219 3310 5219 3224
Wire Wire Line
	5137 3224 5219 3224
Connection ~ 5219 3224
Wire Wire Line
	5219 3224 5295 3224
Wire Wire Line
	5495 3225 5645 3225
Wire Wire Line
	5846 3225 5846 3232
Wire Wire Line
	5645 3278 5645 3225
Connection ~ 5645 3225
Wire Wire Line
	5645 3225 5846 3225
Wire Wire Line
	5661 2780 5756 2780
Wire Wire Line
	5956 2780 6438 2780
Wire Wire Line
	6438 2780 6438 3182
Wire Wire Line
	5846 3132 5661 3132
Wire Wire Line
	5661 2564 5661 2780
Connection ~ 5661 2780
Wire Wire Line
	5661 2780 5661 3132
Wire Wire Line
	6679 3182 6679 3204
Wire Wire Line
	6396 3182 6438 3182
Connection ~ 6438 3182
Wire Wire Line
	6438 3182 6679 3182
Wire Wire Line
	6879 3204 7027 3204
Wire Wire Line
	7154 3204 7154 3212
Wire Wire Line
	7354 3212 7451 3212
Wire Wire Line
	7451 3212 7451 3213
Wire Wire Line
	7451 3213 7532 3213
Wire Wire Line
	7532 3213 7532 3217
Connection ~ 7451 3213
Wire Wire Line
	7451 3213 7451 3234
Wire Wire Line
	7807 3648 8082 3648
Wire Wire Line
	5219 3510 5219 3636
Wire Wire Line
	5219 3636 4506 3636
Connection ~ 4506 3636
Wire Wire Line
	5645 3478 5645 3636
Wire Wire Line
	5645 3636 5219 3636
Connection ~ 5219 3636
Wire Wire Line
	4471 2742 5509 2742
Wire Wire Line
	5509 2742 5509 2365
Connection ~ 4471 2742
Wire Wire Line
	4471 2742 4471 2710
$Comp
L Device:R_Small_US R4
U 1 1 5E491800
P 5661 2464
F 0 "R4" H 5729 2510 50  0000 L CNN
F 1 "1 KOhm" H 5729 2419 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 5661 2464 50  0001 C CNN
F 3 "~" H 5661 2464 50  0001 C CNN
	1    5661 2464
	1    0    0    -1  
$EndComp
Wire Wire Line
	5509 2365 5661 2365
Wire Wire Line
	5661 2365 5661 2364
Wire Wire Line
	8082 2643 7845 2643
Wire Wire Line
	7645 2643 7434 2643
Wire Wire Line
	7371 2643 7371 2565
Wire Wire Line
	7533 3117 7532 3117
Wire Wire Line
	7434 3117 7434 2643
Connection ~ 7532 3117
Wire Wire Line
	7532 3117 7434 3117
Connection ~ 7434 2643
Wire Wire Line
	7434 2643 7371 2643
Wire Wire Line
	5661 2365 7371 2365
Connection ~ 5661 2365
Wire Wire Line
	7608 3648 7607 3648
Wire Wire Line
	7027 3648 7027 3204
Connection ~ 7607 3648
Wire Wire Line
	7607 3648 7027 3648
Connection ~ 7027 3204
Wire Wire Line
	7027 3204 7154 3204
Wire Wire Line
	5645 3636 7451 3636
Wire Wire Line
	7451 3636 7451 3530
Connection ~ 5645 3636
Wire Wire Line
	7451 3530 8183 3530
Wire Wire Line
	8183 3530 8183 3199
Connection ~ 7451 3530
Wire Wire Line
	7451 3530 7451 3434
Wire Wire Line
	8302 3167 8302 3166
Wire Wire Line
	8302 3199 8302 3266
Wire Wire Line
	8183 3199 8302 3199
Wire Wire Line
	6096 2932 4412 2932
Wire Wire Line
	4412 2932 4412 2891
Wire Wire Line
	4412 2891 4371 2891
Connection ~ 4371 2891
Wire Wire Line
	4371 2891 4371 2925
Wire Wire Line
	6096 3432 5766 3432
Wire Wire Line
	5766 3432 5766 2996
Wire Wire Line
	5766 2996 4623 2996
Connection ~ 4623 2996
Wire Wire Line
	4623 2996 4623 3554
Wire Wire Line
	6096 2932 7746 2932
Wire Wire Line
	7746 2932 7746 2917
Wire Wire Line
	7746 2917 7782 2917
Connection ~ 6096 2932
Wire Wire Line
	6096 3432 7755 3432
Wire Wire Line
	7755 3432 7755 3417
Wire Wire Line
	7755 3417 7782 3417
Connection ~ 6096 3432
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5E4DB68D
P 8502 3266
F 0 "J3" H 8474 3148 50  0000 R CNN
F 1 "Conn_01x02_Male" H 8474 3239 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8502 3266 50  0001 C CNN
F 3 "~" H 8502 3266 50  0001 C CNN
	1    8502 3266
	-1   0    0    1   
$EndComp
Wire Wire Line
	8082 3167 8082 3191
Wire Wire Line
	8082 3191 8137 3191
Wire Wire Line
	8137 3191 8137 3160
Wire Wire Line
	8137 2658 8082 2658
Wire Wire Line
	8082 2658 8082 2643
Connection ~ 8082 3191
Wire Wire Line
	8082 3191 8082 3648
Wire Wire Line
	8137 3160 8302 3160
Wire Wire Line
	8302 3160 8302 3166
Connection ~ 8137 3160
Wire Wire Line
	8137 3160 8137 2658
Connection ~ 8302 3166
$EndSCHEMATC
