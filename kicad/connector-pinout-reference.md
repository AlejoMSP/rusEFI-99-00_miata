# KiCad Connector Pinout Reference

Use this while placing connector symbols and wiring the schematic. One table
per physical connector. "rusEFI Pin" is the rusEFI adapter board pin to wire
to that Miata harness pin. "Wire Color" is the factory wire color at that
pin, from the Mazda B-1a/B-1b/B-1c wiring diagram, so added sensors can reuse
existing wires without repinning the factory connector.

Confirmed against actual TunerStudio All IO config - see docs/pinout-mapping.md
for the full source list and notes.

## Miata Factory Harness - Plug 1

| Miata Harness Pin | Function | rusEFI Pin | Wire Color |
| --- | --- | --- | --- |
| 1A | Battery Constant +12V | Permanent +12V | -- |
| 1B | Switched Ignition +12V | A8 | -- |
| 1E | Check Engine Light (MIL) | B10 | -- |
| 1F | Brake Light Switch | C9 | -- |
| 1I | A/C Condenser Fan Relay | B9 | -- |
| 1J | Rear Differential Temp | C14 (TPS2) | -- |
| 1O | Alternator Field Control | B18 | GRY/RED |
| 1P | A/C Request Input | D10 | -- |
| 1R | Radiator Cooling Fan | B8 | -- |
| 1S | A/C Compressor Clutch | B1 | -- |
| 1V | Neutral Switch | D2 | -- |

Alternator Settings: Enabled, smart PID control, control output B18, target
14.0V, PID defaults.

## Miata Factory Harness - Plug 2

| Miata Harness Pin | Function | rusEFI Pin | Wire Color |
| --- | --- | --- | --- |
| 2A | Not used for wideband - reassign if needed | -- | R/G |
| 2B | Intake Air Temp (IAT) | D15 | -- |
| 2C | Wideband O2 signal | D1 | -- |
| 2D | Vehicle Speed Sensor (VSS) | C7 | -- |
| 2E | Engine Coolant Temp (CLT) | D16 | -- |
| 2F | Knock Sensor | D14 | -- |
| 2G | Brake Pressure Transducer | C4 (PPS2) | -- |
| 2H | Camshaft Position (CMP) | C5 | -- |
| 2I | Sensor +5V Power Supply | C1 | -- |
| 2J | Crankshaft Position (CKP) | C18 | -- |
| 2K | Tachometer Output | B13 | -- |
| 2L | EGT | PA15 (SPI3) | LG/B |
| 2M | Flex Fuel Sensor | D5 (FLEX) | V |
| 2N | Fuel Low Pressure Sensor | C15 (AUX3) | W/G |
| 2O | Oil Pressure Transducer | C3 (AUX2) | P/B |
| 2P | Oil Temperature | D6 (PPS1) | P |

## Miata Factory Harness - Plug 3

| Miata Harness Pin | Function | rusEFI Pin | Wire Color |
| --- | --- | --- | --- |
| 3A / 3B / 3C | ECU Power Grounds | A3 / A4 / C8 | -- |
| 3E | Throttle Position (TPS) | D13 | -- |
| 3F | Sensor Signal Ground | C11 | -- |
| 3G | Coil 1 (Cyl 1 & 4 Wasted) | B15 | BR/Y |
| 3H | Coil 2 (Cyl 2 & 3 Wasted) | B14 | BR |
| 3I | Clutch Pedal Switch | D2 | BR/W |
| 3N | Fuel Pump Relay | B16 | -- |
| 3S | Coil 3 (Cyl 4 Seq) | B12 | GY |
| 3T | Coil 4 (Cyl 2 Seq) | B11 | GY/B |
| 3W-3Z | Fuel Injectors 1-4 | B6, B5, B4, B3 | -- |

## Free spare pins not yet used

Confirmed free from the factory diagram (marked with * / unused) or from
now-deleted emissions equipment (EGR, purge canister, etc):

| Pin | Wire Color |
| --- | --- |
| 3V | R/Y |
| 3J | R |
| 1U | V/Y |
| 3Q | W/L |
| 2A | R/G |
| 1D | G/W |
| 1L | BR/Y |
| 3U | L/O |
| 1K | L/W |
| 3R | -- (marked spare on diagram) |
| 3P | -- (marked spare on diagram) |
| 3D | -- (marked spare on diagram) |

1N status is unclear - user first said it's taken, then listed it as a
freed emissions pin. Confirm before using it.

1M is taken (per user), do not reuse.

## Open questions - not yet answered

- 3I (Clutch Pedal Switch, BR/W) - user wants to repurpose for launch
  control input (currently used for clutch pedal switch, D2).
- 1V (Neutral Switch, D2) - user asked if this can be used for anything
  tune-related. Not yet answered.

## Grounding rule

Keep Power Ground (3A/3B/3C) isolated from Sensor Ground (3F/C11) in the
schematic. Do not tie them on the same net.

## Hardware notes

- Rear Differential Temp (C14 TPS2, harness pin 1J) needs an external
  pull-up resistor - this pin has no onboard pullup.
- Oil Temp (D6 PPS1) calibrated for GM 25036751 thermistor - see
  docs/pinout-mapping.md for the resistance curve.
