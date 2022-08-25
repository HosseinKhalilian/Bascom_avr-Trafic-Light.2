'======================================================================='

' Title: 3-Digit LED Trafic Light
' Last Updated :  03.2022
' Author : A.Hossein.Khalilian
' Program code  : BASCOM-AVR 2.0.8.5
' Hardware req. : Atmega16 + 3-Digit LED

'======================================================================='

$regfile = "m16def.dat"
$crystal = 1000000

Config Portb = Input
Config Portd = Output

Dim A As Byte

'-----------------------------------------------------------

Do

Debounce Pinb.0 , 1 , Main1
Debounce Pinb.1 , 1 , Main2

Loop

'-----------------------------------------------------------

Main1:

Do

Portd = &B00000001
Debounce Pinb.1 , 1 , Main2
Waitms 600
Portd = &B00010000
Debounce Pinb.1 , 1 , Main2
Waitms 600

Loop

''''''''''''''''''''''''''''''

Main2:

Do

For A = 7 To 0 Step -1
Portd = &B00001100
Debounce Pinb.0 , 1 , Main1
Wait 1
Next A

For A = 2 To 0 Step -1
Portd = &B00001010
Debounce Pinb.0 , 1 , Main1
Wait 1
Next A

For A = 7 To 0 Step -1
Portd = &B00100001
Debounce Pinb.0 , 1 , Main1
Wait 1
Next A

For A = 2 To 0 Step -1
Portd = &B00010001
Debounce Pinb.0 , 1 , Main1
Wait 1
Next A

Loop

'-----------------------------------------------------------