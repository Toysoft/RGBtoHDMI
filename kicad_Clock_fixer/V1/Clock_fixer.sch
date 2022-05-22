EESchema Schematic File Version 4
LIBS:Clock_fixer-cache
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
Connection ~ 3650 2150
Wire Wire Line
	3850 2150 3650 2150
Wire Wire Line
	3650 1250 4350 1250
Connection ~ 3650 1250
Wire Wire Line
	3650 2250 3650 2150
Wire Wire Line
	3850 2250 3650 2250
Wire Wire Line
	3450 1550 3850 1550
Wire Wire Line
	3450 2850 4350 2850
Connection ~ 3450 2850
Wire Wire Line
	3550 1250 3650 1250
Wire Wire Line
	2700 2850 3450 2850
Wire Wire Line
	3750 7650 4200 7650
Wire Wire Line
	3750 6650 4200 6650
Wire Wire Line
	3550 2350 3550 3550
Wire Wire Line
	3850 2350 3550 2350
Wire Wire Line
	3150 900  5050 900 
Text GLabel 2700 2850 0    50   Input ~ 0
GND
Text GLabel 3550 1250 0    50   Input ~ 0
5V
Text Notes 2750 800  0    118  ~ 0
Synchronous divide by 3
Wire Wire Line
	8150 3650 10200 3650
Text GLabel 8150 3100 0    50   Input ~ 0
16Mhz
Text GLabel 8000 4200 0    50   Input ~ 0
6Mhz
Text GLabel 7400 3500 0    50   Input ~ 0
HSYNC
Wire Wire Line
	1600 3850 1200 3850
Text GLabel 1200 3250 0    50   Input ~ 0
5V
Text GLabel 1200 3850 0    50   Input ~ 0
GND
Text Notes 3150 6450 0    118  ~ 0
Synchronous divide by 8 with hsync reset
$Comp
L Memory_EPROM:27C128 U6
U 1 1 62875686
P 1800 5950
F 0 "U6" H 1800 7231 50  0000 C CNN
F 1 "27C128" H 1800 7140 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 1800 5950 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/11003L.pdf" H 1800 5950 50  0001 C CNN
	1    1800 5950
	1    0    0    -1  
$EndComp
Text GLabel 1150 4850 0    50   Input ~ 0
5V
Text GLabel 1150 7050 0    50   Input ~ 0
GND
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 628AC6FF
P 10400 3750
F 0 "J1" H 10480 3792 50  0000 L CNN
F 1 "Conn_01x03" H 10480 3701 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 10400 3750 50  0001 C CNN
F 3 "~" H 10400 3750 50  0001 C CNN
	1    10400 3750
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:IQXO-70 X1
U 1 1 628CAE0E
P 1600 3550
F 0 "X1" H 1944 3596 50  0000 L CNN
F 1 "IQXO-70" H 1944 3505 50  0000 L CNN
F 2 "Oscillator:Oscillator_SMD_SeikoEpson_SG8002CE-4Pin_3.2x2.5mm" H 2275 3225 50  0001 C CNN
F 3 "http://www.iqdfrequencyproducts.com/products/details/iqxo-70-11-30.pdf" H 1500 3550 50  0001 C CNN
	1    1600 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 7050 6250 6650
Wire Wire Line
	6250 7250 6250 7650
Connection ~ 4900 7650
Wire Wire Line
	4900 7250 4900 7650
Connection ~ 4900 6650
Wire Wire Line
	4900 7050 4900 6650
$Comp
L Device:C_Small C2
U 1 1 628F5899
P 6250 7150
F 0 "C2" H 6342 7196 50  0000 L CNN
F 1 "10n" H 6342 7105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6250 7150 50  0001 C CNN
F 3 "~" H 6250 7150 50  0001 C CNN
	1    6250 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 628F4DF4
P 4900 7150
F 0 "C1" H 4992 7196 50  0000 L CNN
F 1 "10n" H 4992 7105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4900 7150 50  0001 C CNN
F 3 "~" H 4900 7150 50  0001 C CNN
	1    4900 7150
	1    0    0    -1  
$EndComp
Text GLabel 3750 7650 0    50   Input ~ 0
GND
Text GLabel 3750 6650 0    50   Input ~ 0
5V
Wire Wire Line
	3650 1250 3650 1650
Wire Wire Line
	3850 2550 3650 2550
Wire Wire Line
	3650 2550 3650 2250
Connection ~ 3650 2250
Wire Wire Line
	3850 1650 3650 1650
Connection ~ 3650 1650
$Comp
L 74xx:74HC00 U2
U 5 1 62870E12
P 4200 7150
F 0 "U2" H 4430 7196 50  0000 L CNN
F 1 "74AHC00" H 4430 7105 50  0000 L CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 4200 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4200 7150 50  0001 C CNN
	5    4200 7150
	1    0    0    -1  
$EndComp
Connection ~ 4200 6650
Wire Wire Line
	4200 6650 4900 6650
Connection ~ 4200 7650
Wire Wire Line
	4200 7650 4900 7650
Wire Wire Line
	4900 6650 5400 6650
Wire Wire Line
	4900 7650 5400 7650
Wire Wire Line
	8000 3850 10200 3850
Wire Wire Line
	3850 2050 3150 2050
Wire Wire Line
	3150 2050 3150 900 
$Comp
L 74xx:74HC00 U2
U 3 1 629A062A
P 7400 1550
F 0 "U2" H 7400 1233 50  0000 C CNN
F 1 "74AHC00" H 7400 1324 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 7400 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 7400 1550 50  0001 C CNN
	3    7400 1550
	1    0    0    1   
$EndComp
$Comp
L 74xx:74HC00 U2
U 4 1 629A2B4D
P 5750 3800
F 0 "U2" V 5700 3350 50  0000 L CNN
F 1 "74AHC00" V 5800 3250 50  0000 L CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 5750 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5750 3800 50  0001 C CNN
	4    5750 3800
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC00 U2
U 1 1 629A438A
P 5900 1650
F 0 "U2" H 5900 1975 50  0000 C CNN
F 1 "74AHC00" H 5900 1884 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 5900 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5900 1650 50  0001 C CNN
	1    5900 1650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U2
U 2 1 629BAE60
P 6500 1650
F 0 "U2" H 6500 1975 50  0000 C CNN
F 1 "74AHC00" H 6500 1884 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 6500 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 6500 1650 50  0001 C CNN
	2    6500 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1550 6200 1650
Connection ~ 6200 1650
Wire Wire Line
	6200 1650 6200 1750
Wire Wire Line
	5600 1550 5600 1650
Connection ~ 5600 1650
Wire Wire Line
	5600 1650 5600 1750
Wire Wire Line
	6800 1650 7100 1650
Wire Wire Line
	5600 1550 5600 1150
Wire Wire Line
	5600 1150 6900 1150
Wire Wire Line
	6900 1150 6900 1450
Wire Wire Line
	6900 1450 7100 1450
Connection ~ 5600 1550
Wire Wire Line
	8000 3850 8000 4700
$Comp
L 74xx:74LS163 U1
U 1 1 628120EC
P 6650 5000
F 0 "U1" H 6650 5981 50  0000 C CNN
F 1 "74VHC163" H 6650 5890 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 6650 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 6650 5000 50  0001 C CNN
	1    6650 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4700 8000 4700
Connection ~ 5550 5200
Wire Wire Line
	5550 5500 5550 5200
Wire Wire Line
	6150 5500 5550 5500
Wire Wire Line
	5550 4200 5550 5100
Text GLabel 3900 5800 0    50   Input ~ 0
GND
Wire Wire Line
	6650 5800 5950 5800
Text GLabel 3750 4200 0    50   Input ~ 0
5V
Connection ~ 5550 4200
Wire Wire Line
	5550 4200 6650 4200
Connection ~ 5550 5100
Wire Wire Line
	5550 5200 5550 5100
Wire Wire Line
	6150 5200 5550 5200
Wire Wire Line
	6150 5100 5550 5100
Wire Wire Line
	6150 4800 5950 4800
Wire Wire Line
	5950 4800 5950 5800
Connection ~ 5950 5800
$Comp
L Jumper:SolderJumper_3_Bridged12 JP3
U 1 1 6298700D
P 5050 5000
F 0 "JP3" V 5096 5068 50  0000 L CNN
F 1 "6Phase2" V 5000 5050 50  0000 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 5050 5000 50  0001 C CNN
F 3 "~" H 5050 5000 50  0001 C CNN
	1    5050 5000
	0    -1   -1   0   
$EndComp
$Comp
L Jumper:SolderJumper_3_Bridged12 JP4
U 1 1 629FECBC
P 5750 3250
F 0 "JP4" H 5650 3400 50  0000 L CNN
F 1 "HsyncPhase1" H 5500 3600 50  0000 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 5750 3250 50  0001 C CNN
F 3 "~" H 5750 3250 50  0001 C CNN
	1    5750 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 5300 6150 5300
Wire Wire Line
	1800 4850 1150 4850
Wire Wire Line
	1800 7050 1150 7050
Wire Wire Line
	3450 1550 3450 1750
$Comp
L Jumper:SolderJumper_3_Bridged12 JP2
U 1 1 62A5C40F
P 4650 4700
F 0 "JP2" V 4696 4768 50  0000 L CNN
F 1 "6Phase1" V 4600 4750 50  0000 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 4650 4700 50  0001 C CNN
F 3 "~" H 4650 4700 50  0001 C CNN
	1    4650 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6150 4700 5350 4700
Wire Wire Line
	5350 4700 5350 5000
Wire Wire Line
	5350 5000 5200 5000
Wire Wire Line
	6150 4600 4950 4600
Wire Wire Line
	4950 4600 4950 4700
Wire Wire Line
	4950 4700 4800 4700
Wire Wire Line
	6150 4500 4950 4500
Wire Wire Line
	4950 4500 4950 4400
Wire Wire Line
	4950 4400 4400 4400
Wire Wire Line
	4650 4900 4650 5800
Connection ~ 4650 5800
Wire Wire Line
	4650 5800 5050 5800
Wire Wire Line
	5050 5200 5050 5800
Connection ~ 5050 5800
Wire Wire Line
	5050 5800 5950 5800
Wire Wire Line
	5050 4800 5050 4200
Connection ~ 5050 4200
Wire Wire Line
	5050 4200 5550 4200
Wire Wire Line
	4650 4500 4650 4200
Connection ~ 4650 4200
Wire Wire Line
	4650 4200 5050 4200
Connection ~ 4250 5800
Wire Wire Line
	4250 5800 4650 5800
Wire Wire Line
	3900 5800 4250 5800
Wire Wire Line
	4250 4200 4650 4200
Wire Wire Line
	4250 4200 3750 4200
Connection ~ 4250 4200
Wire Wire Line
	4250 4600 4250 5800
$Comp
L Jumper:SolderJumper_3_Bridged12 JP1
U 1 1 62A582F6
P 4250 4400
F 0 "JP1" V 4296 4468 50  0000 L CNN
F 1 "6Phase0" V 4200 4450 50  0000 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 4250 4400 50  0001 C CNN
F 3 "~" H 4250 4400 50  0001 C CNN
	1    4250 4400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4850 1650 5050 1650
Wire Wire Line
	7700 1550 8150 1550
Wire Wire Line
	8150 1550 8150 3650
Text Notes 5600 2300 0    118  ~ 0
Approx 50:50 mark space\n ratio adjustment
Text Notes 7050 6800 0    118  ~ 0
74VHC161 can be used instead of 74VHC163
Wire Wire Line
	1200 3250 1600 3250
$Comp
L Device:C_Small C3
U 1 1 62893489
P 5400 7150
F 0 "C3" H 5492 7196 50  0000 L CNN
F 1 "10n" H 5492 7105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5400 7150 50  0001 C CNN
F 3 "~" H 5400 7150 50  0001 C CNN
	1    5400 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 62894018
P 5850 7150
F 0 "C4" H 5942 7196 50  0000 L CNN
F 1 "100n" H 5942 7105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5850 7150 50  0001 C CNN
F 3 "~" H 5850 7150 50  0001 C CNN
	1    5850 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 7050 5850 6650
Connection ~ 5850 6650
Wire Wire Line
	5850 6650 6250 6650
Wire Wire Line
	5400 7050 5400 6650
Connection ~ 5400 6650
Wire Wire Line
	5400 6650 5850 6650
Wire Wire Line
	5400 7250 5400 7650
Connection ~ 5400 7650
Wire Wire Line
	5400 7650 5850 7650
Wire Wire Line
	5850 7250 5850 7650
Connection ~ 5850 7650
Wire Wire Line
	5850 7650 6250 7650
Wire Wire Line
	5050 900  5050 1650
Connection ~ 5050 1650
Wire Wire Line
	5050 1650 5600 1650
$Comp
L 74xx:74LS163 U3
U 1 1 6281A10C
P 4350 2050
F 0 "U3" H 4350 3031 50  0000 C CNN
F 1 "74VHC163" H 4350 2940 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 4350 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 4350 2050 50  0001 C CNN
	1    4350 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1650 3650 2150
Wire Wire Line
	3850 1750 3450 1750
Connection ~ 3450 1750
Wire Wire Line
	3450 1750 3450 2850
Wire Wire Line
	3850 1850 3300 1850
Wire Wire Line
	6150 5000 5750 5000
Wire Wire Line
	5750 5000 5750 4100
Wire Wire Line
	10200 3750 7400 3750
Wire Wire Line
	7400 3750 7400 3250
Wire Wire Line
	7400 3250 5950 3250
Wire Wire Line
	3300 1850 3300 3000
Wire Wire Line
	3300 3000 7400 3000
Wire Wire Line
	7400 3000 7400 3250
Connection ~ 7400 3250
Wire Wire Line
	5550 3250 5150 3250
Wire Wire Line
	5150 3250 5150 1850
Wire Wire Line
	5150 1850 4850 1850
Wire Wire Line
	1900 3550 3250 3550
Wire Wire Line
	3250 5300 3250 3550
Connection ~ 3250 3550
Wire Wire Line
	3250 3550 3550 3550
Wire Wire Line
	5650 3500 5750 3500
Wire Wire Line
	5750 3500 5750 3400
Connection ~ 5750 3500
Wire Wire Line
	5750 3500 5850 3500
$EndSCHEMATC
