# Master Harness & ECU Pinout Mapping

## Vehicle & ECU

- Vehicle: 1999-2000 Mazda Miata NB1, 1.8L, 64-pin, 3-plug factory harness
- ECU: rusEFI Hellen / uaEFI adapter board
- Firmware config: `set engine_type 9` (NB1 4/2 trigger decoder, crank and cam)
- Status: bench testing with ECU simulator board, before vehicle install

## Harness to ECU pin map

| Car Harness Pin | Circuit / Function | rusEFI Board Pin | Board Label / Type | Simulator Pin |
| --- | --- | --- | --- | --- |
| 1A | Battery Constant +12V | Permanent +12V | Constant Battery Voltage | 12V Rail |
| 1B | Switched Ignition +12V | A8 | Switched Power Input | 12V Rail |
| 1E | Check Engine Light (MIL) | B10 | Low-Side Output | LS10 |
| 1I | A/C Condenser Fan Relay | B9 | Low-Side Output (OUT_LS_HOT1) | LS9 |
| 1O | Alternator Field Control | B18 | Low-Side Output 2 | LS2 |
| 1P | A/C Request Input | D10 | Digital Input with Pull-Up (IN_BUTTON2) | Digital Input #2 |
| 1R | Radiator Cooling Fan | B8 | Low-Side Output (OUT_LS_HOT2) | LS8 |
| 1S | A/C Compressor Clutch | B1 | Low-Side Output 6 (OUT_INJ6) | LS6 |
| 1V | Neutral Switch | D2 | Digital Input with Pull-Up (IN_BUTTON1) | Digital Input #3 |
| 2A | Wideband O2 (0-5V Signal) | D11 | Analog Input (IN_O2S) | AV11 |
| 2B | Intake Air Temp (IAT) | D15 | Thermistor Input (IN_IAT) | AT4 / AV12 |
| 2D | Vehicle Speed Sensor (VSS) | C6 | Digital Input (IN_VSS) | Dgt2 / UR2+ |
| 2E | Engine Coolant Temp (CLT) | D16 | Thermistor Input (IN_CLT) | AT3 / AV10 |
| 2F | Knock Sensor | D14 | Knock Input (IN_KNOCK) | knc1 |
| 2H | Camshaft Position (CMP) | C5 | Digital 0-5V Hall Input (IN_CAM) | Dgt1 / UR1- |
| 2I | Sensor +5V Power Supply | C1 | Regulated +5V Reference (+5VA) | 5V Ref |
| 2J | Crankshaft Position (CKP) | C18 | Trigger Input (VR1+ / IN_CRANK) | VR1+ |
| 2K | Tachometer Output | B7 | Low-Side Output (OUT_LS1) | LS1 |
| 3A / 3B / 3C | ECU Power Grounds | A3 / A4 / C8 | Power Ground Plane | GND |
| 3E | Throttle Position (TPS) | D13 | Analog Input (IN_TPS1) | AT1 / AV1 |
| 3F | Sensor Signal Ground | C11 | Isolated Sensor Ground (GNDA) | GND |
| 3G | Coil 1 (Cyl 1 & 4 Wasted) | B15 | 5V Logic Ignition (OUT_IGN1) | Ign1 |
| 3H | Coil 2 (Cyl 2 & 3 Wasted) | B14 | 5V Logic Ignition (OUT_IGN2) | Ign2 |
| 3I | Clutch Pedal Switch | C4 | Digital Input (IN_PPS2) | Digital Input #1 |
| 3N | Fuel Pump Relay | B16 | Low-Side Output 4 | LS4 |
| 3O | Idle Air Control (IAC) | B17 | Low-Side PWM Output 3 | LS3 |
| 3Q | VICS Solenoid Output | B18 | Low-Side PWM Output | LS18 / LS2 |
| 3W-3Z | Fuel Injectors 1-4 | B6, B5, B4, B3 | Injector Low-Side Outputs (OUT_INJ1-4) | Ign6-Ign9 / LS |

Note: 1O and 3Q both list board pin B18 in the source data - needs a hardware recheck, only one function can live on that pin.

## Reserved pins for future sequential ignition

- Coil 3 (Cyl 4 Seq.): unassigned on harness, mapped to B12 (OUT_IGN3, 5V Logic Output)
- Coil 4 (Cyl 2 Seq.): unassigned on harness, mapped to B11 (OUT_IGN4, 5V Logic Output)

## Auxiliary sensor expansion matrix

| Aux Sensor | Sensor Signal Type | rusEFI Board Pin | Board Label / Function | Wiring Requirement |
| --- | --- | --- | --- | --- |
| Flex Fuel Sensor | Digital / Frequency | D5 | IN_FLEX | 10k Pull-Up to +5V Ref |
| Brake Pressure Transducer | 0.5-4.5V Analog | C3 | IN_AUX2 | +5V Ref (C1), GND (C11) |
| Oil Pressure Transducer | 0.5-4.5V Analog | C1 | IN_AUX1 | +5V Ref (C1), GND (C11) |
| Oil Temperature | NTC Thermistor | C4 | IN_AUX3 | Sensor GND (C11) |
| Rear Differential Temp | NTC Thermistor | D6 | IN_AUX4 | Sensor GND (C11) |
| Exhaust Gas Temp (EGT) | 0-5V Analog | D1 | IN_AUX1 | External K-Type Amp (0-5V) |

Note: C1 and C4 each appear twice above (once as a core signal, once as an aux input) - also needs a hardware recheck.

## Critical hardware rules

- Ground isolation: keep Power Ground (GND_POWER on 3A/3B/3C) isolated from Sensor Ground (GND_SENSOR on 3F/C11) in the harness schematic.

## Next steps

- KiCad schematic (`rusEFI-99-00_miata`) mapping the 3 factory plugs to the rusEFI adapter header.
