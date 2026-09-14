# KiCad Connector Pinout Reference

Use this while placing connector symbols and wiring the schematic. One table
per physical connector. "Board Pin" is the rusEFI adapter board pin to wire
to that harness pin.

Confirmed against actual TunerStudio All IO config - see docs/pinout-mapping.md
for the full source list and notes.

## Miata Factory Harness - Plug 1

| Harness Pin | Function | Board Pin |
| --- | --- | --- |
| 1A | Battery Constant +12V | Permanent +12V |
| 1B | Switched Ignition +12V | A8 |
| 1E | Check Engine Light (MIL) | B10 |
| 1I | A/C Condenser Fan Relay | B9 |
| 1O | Alternator Field Control | B18 |
| Alternator Settings | Enabled, smart PID control | B18 (control output), target 14.0V, PID defaults |
| 1P | A/C Request Input | D10 |
| 1R | Radiator Cooling Fan | B8 |
| 1S | A/C Compressor Clutch | B1 |
| 1V | Neutral Switch | D2 |

## Miata Factory Harness - Plug 2

| Harness Pin | Function | Board Pin |
| --- | --- | --- |
| 2A | Not used for wideband - reassign if needed | -- |
| 2B | Intake Air Temp (IAT) | D15 |
| 2C | Wideband O2 signal | D1 |
| 2D | Vehicle Speed Sensor (VSS) | C7 |
| 2E | Engine Coolant Temp (CLT) | D16 |
| 2F | Knock Sensor | D14 |
| 2H | Camshaft Position (CMP) | C5 |
| 2I | Sensor +5V Power Supply | C1 |
| 2J | Crankshaft Position (CKP) | C18 |
| 2K | Tachometer Output | B13 |

## Miata Factory Harness - Plug 3

| Harness Pin | Function | Board Pin |
| --- | --- | --- |
| 3A / 3B / 3C | ECU Power Grounds | A3 / A4 / C8 |
| 3E | Throttle Position (TPS) | D13 |
| 3F | Sensor Signal Ground | C11 |
| 3G | Coil 1 (Cyl 1 & 4 Wasted) | B15 |
| 3H | Coil 2 (Cyl 2 & 3 Wasted) | B14 |
| 3I | Clutch Pedal Switch | D2 |
| 3N | Fuel Pump Relay | B16 |
| 3W-3Z | Fuel Injectors 1-4 | B6, B5, B4, B3 |

## Sequential Ignition (added, not on factory harness)

| Function | Board Pin |
| --- | --- |
| Coil 3 (Cyl 4 Seq) | B12 |
| Coil 4 (Cyl 2 Seq) | B11 |

## Auxiliary Sensors (added, not on factory harness)

| Sensor | Board Pin |
| --- | --- |
| Oil Pressure Transducer | C3 (AUX2) |
| Oil Temperature | D6 (PPS1) |
| Fuel Low Pressure Sensor | C15 (AUX3) |
| Flex Fuel Sensor | D5 (FLEX) |
| EGT (1 channel) | PA15 (SPI3) |

## Grounding rule

Keep Power Ground (3A/3B/3C) isolated from Sensor Ground (3F/C11) in the
schematic. Do not tie them on the same net.

## Open items before schematic is final

None remaining. 1O (Alternator Field Control, GRY/RED wire) confirmed
against factory wiring diagram, stays on B18.
