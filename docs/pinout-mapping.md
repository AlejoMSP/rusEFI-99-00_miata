# ECU Pin Configuration (source: TunerStudio All IO, confirmed on hardware)

This replaces the earlier migrated doc. Everything below is read directly from
the ECU's own TunerStudio All IO 1/3, 2/3, 3/3 screens.

## Assigned pins

| Function | Board Pin | Notes |
| --- | --- | --- |
| Tachometer output | B13 (labeled Coil 5) | moved off B11 to resolve conflict |
| Fuel Pump output | B16 | Low Side output 4, has flyback diode D5 |
| Fan output | B8 | Weak Low Side output 2, no flyback |
| A/C Relay | B1 | Injector output 6 |
| Injection Output 1 | B6 | Injector output 1 |
| Injection Output 2 | B5 | Injector output 2 |
| Injection Output 3 | B4 | Injector output 3 |
| Injection Output 4 | B3 | Injector output 4 |
| Ignition Output 1 | B15 | Coil 1 |
| Ignition Output 2 | B14 | Coil 2 |
| Ignition Output 3 | B12 | Coil 3, sequential cyl 4 |
| Ignition Output 4 | B11 | Coil 4, sequential cyl 2 (moved here from Tachometer) |
| Primary trigger input (crank) | C18 | VR1+, discrete, low count wheel |
| Cam Sync / VVT input | C5 | CAM1 / HALL1 |
| CLT ADC input | D16 | Coolant temp |
| IAT ADC input | D15 | Intake air temp |
| vBatt ADC input | A7 | Voltage from key |
| TPS1 ADC input | D13 | |
| MAP ADC input | On-board MAP | Internal sensor, no external pin |
| Vehicle Speed input | C7 | HALL3 |
| O2 Sensor 1 Input channel | D1 (AUX1) | wideband, from harness pin 2C |
| Oil Pressure Transducer input | C3 (AUX2) | |
| Fuel Low Pressure Sensor Analog input | C15 (AUX3) | scaling TBD later |
| Oil Temp Input channel | D6 (PPS1) | |
| SD CS Pin | PB6 | |
| CAN RX pin | PD0 | |
| CAN TX pin | PD1 | |

All four ignition outputs are now burned. No pending sequential ignition items.

## Not configured (NONE in TunerStudio)

Everything below is currently unassigned on the ECU. Confirm which of these
you actually need for this build before wiring:

- Narrowband O2 heater output
- Idle Solenoid Primary / Secondary output
- Idle Stepper Dir / Step / Enable
- ETB#1 and ETB#2 (Dir, Control, Disable) - not used, no electronic throttle
- Main Relay Pin
- Starter Relay Pin
- Aux ADC - free options seen: C3 AUX2, C15 Fuel Pressure/AUX3, others TBD from dropdown
- Injection Output 5-12
- Ignition Output 5-12
- Throttle Pedal Position Channel / #2
- Secondary trigger channel
- TPS2 ADC input
- MAF / MAF2 ADC input
- AFR ADC input / AFR2 ADC input - wideband O2 is NOT wired yet
- Baro ADC input
- Fuel Level input
- Clutch Down input
- Clutch Up input
- Brake pedal input
- A/C Switch input
- Aux Temperature #1 / #2 - free for Oil Temp, Rear Diff Temp
- Aux Fast Analog
- VVT solenoid bank 1/2 intake/exhaust
- Aux Valve #1 / #2
- Start/Stop Button
- Upshift / Downshift Pin

## Fields that need real values before this ECU matches the wiring plan

These are required by the harness but currently NONE on the ECU:

- Clutch Down or Clutch Up input - clutch switch, not connected yet
- A/C Switch input - A/C request signal, not connected yet
- Aux ADC (any free) - Brake Pressure Transducer, if used
- Aux Temperature #1 - Oil Temperature
- Aux Temperature #2 - Rear Differential Temperature, if used
