# ECU Pin Configuration (source: TunerStudio All IO, confirmed on hardware)

Everything below is read directly from the ECU's own TunerStudio All IO
1/3, 2/3, 3/3 screens, cross-referenced against the Miata factory wiring
diagram (Mazda B-1a/B-1b/B-1c).

## Miata Harness to rusEFI Pin Map

"Wire Color" is the factory wire color at that pin, so added sensors can
reuse existing wires without repinning the factory connector.

### Plug 1

| Miata Harness Pin | Function | rusEFI Pin | Wire Color |
| --- | --- | --- | --- |
| 1A | Battery Constant +12V | Permanent +12V | -- |
| 1B | Switched Ignition +12V | A8 | -- |
| 1E | Check Engine Light (MIL) - NOT YET CONFIGURED on ECU | B10 (proposed) | -- |
| 1F | Brake Light Switch | C9 (BUTTON3) | -- |
| 1I | A/C Condenser Fan Relay | B9 | -- |
| 1J | Rear Differential Temp | C14 (TPS2) | -- |
| 1O | Alternator Field Control | B18 | GRY/RED |
| 1P | A/C Request Input | D10 (A/C Request / BUTTON2) | -- |
| 1R | Radiator Cooling Fan | B8 | -- |
| 1S | A/C Compressor Clutch | B1 | -- |
| 1V | Neutral Switch | C6 (HALL2) | -- |

Alternator Settings: Enabled, smart PID control, control output B18, target
14.0V, PID defaults.

### Plug 2

| Miata Harness Pin | Function | rusEFI Pin | Wire Color |
| --- | --- | --- | --- |
| 2A | Not used for wideband - free, reassign if needed | -- | R/G |
| 2B | Intake Air Temp (IAT) | D15 | -- |
| 2C | Wideband O2 signal | D1 (AUX1) | -- |
| 2D | Vehicle Speed Sensor (VSS) | C7 | -- |
| 2E | Engine Coolant Temp (CLT) | D16 | -- |
| 2F | Knock Sensor | D14 | -- |
| 2G | Brake Pressure Transducer | C4 (PPS2) | -- |
| 2H | Camshaft Position (CMP) | C5 | -- |
| 2I | Sensor +5V Power Supply | C1 | -- |
| 2J | Crankshaft Position (CKP) | C18 | -- |
| 2K | Tachometer Output | B13 (Coil 5 label) | -- |
| 2L | EGT | PA15 (SPI3) | LG/B |
| 2M | Flex Fuel Sensor | D5 (FLEX) | V |
| 2N | Fuel Low Pressure Sensor | C15 (AUX3) | W/G |
| 2O | Oil Pressure Transducer | C3 (AUX2) | P/B |
| 2P | Oil Temperature | D6 (PPS1) | P |

### Plug 3

| Miata Harness Pin | Function | rusEFI Pin | Wire Color |
| --- | --- | --- | --- |
| 3A / 3B / 3C | ECU Power Grounds | A3 / A4 / C8 | -- |
| 3E | Throttle Position (TPS) | D13 | -- |
| 3F | Sensor Signal Ground | C11 | -- |
| 3G | Coil 1 (Cyl 1 & 4 Wasted) | B15 | BR/Y |
| 3H | Coil 2 (Cyl 2 & 3 Wasted) | B14 | BR |
| 3I | Clutch Pedal Switch / Launch Control Activate | D2 (BUTTON1) | BR/W |
| 3N | Fuel Pump Relay | B16 | -- |
| 3S | Coil 3 (Cyl 4 Seq) | B12 | GY |
| 3T | Coil 4 (Cyl 2 Seq) | B11 | GY/B |
| 3W-3Z | Fuel Injectors 1-4 | B6, B5, B4, B3 | -- |

### Free spare pins not yet used

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
freed emissions pin. Confirm before using it. 1M is taken, do not reuse.

### Open questions - not yet answered

- Check Engine Light (MIL, harness pin 1E) is NOT configured on the ECU.
  Confirmed by checking all 3 All IO screens - no MIL/CEL field exists there.
  rusEFI calls this setting `malfunctionIndicatorPin`, found elsewhere in
  TunerStudio (not All IO). B10 is free and coil-capable if you want to use
  it, but needs to be set deliberately.

### Grounding rule

Keep Power Ground (3A/3B/3C) isolated from Sensor Ground (3F/C11) in the
schematic. Do not tie them on the same net.

## Non-harness rusEFI internal pins

These are board-only settings with no corresponding Miata harness pin.

| Function | rusEFI Pin | Notes |
| --- | --- | --- |
| MAP ADC input | On-board MAP | Internal sensor, no external pin |
| SD CS Pin | PB6 | |
| CAN RX pin | PD0 | |
| CAN TX pin | PD1 | |

## Confirmed free pins on the rusEFI board (not yet used)

Confirmed against the board's own connector CSVs (connector_B/C/D):

| Pin | Label | Notes |
| --- | --- | --- |
| D9 | MAP | External MAP input, unused since on-board MAP is selected |
| B7 | VVT1 / Low Side 1 | Low side output, has flyback diode |
| B17 | Low Side 3 / Injector 7 | Low side output, has flyback diode |

## Oil Temp Sensor Calibration

Sensor: GM / Delphi 25036751 (AC Delco 213-190) thermistor. Input channel
D6 (PPS1), harness pin 2P.

- Pullup resistor: 2490 ohm
- Lowest temperature: -20 C, Resistance @ LT: 28146 ohm
- Middle temperature: 25 C, Resistance @ MT: 2752 ohm
- Highest temperature: 100 C, Resistance @ HT: 175.3 ohm

Note: these values were provided by the user from a third-party source, not
independently verified against the GM datasheet. Confirm against the official
datasheet if oil temp readings look off.

## Hardware notes

- Rear Differential Temp (C14 TPS2, harness pin 1J) needs an external
  pull-up resistor - this pin has no onboard pullup.
- Fuel Low Pressure Sensor (C15 AUX3, harness pin 2N) scaling not yet set,
  deferred until sensor voltage/pressure spec is confirmed.

## Not configured (NONE in TunerStudio)

Everything below is currently unassigned on the ECU. Confirm which of these
you actually need before wiring:

- Narrowband O2 heater output
- Idle Solenoid Primary / Secondary output
- Idle Stepper Dir / Step / Enable
- ETB#1 and ETB#2 (Dir, Control, Disable) - not used, no electronic throttle
- Main Relay Pin (Main relay output, confirmed NONE via Outputs screen)
- Starter Relay Pin
- Speedometer output (confirmed NONE via Outputs screen)
- Injection Output 5-12
- Ignition Output 5-12
- Throttle Pedal Position Channel / #2
- Secondary trigger channel
- TPS2 ADC input
- MAF / MAF2 ADC input
- AFR2 ADC input
- Baro ADC input
- Fuel Level input
- Aux Fast Analog
- VVT solenoid bank 1/2 intake/exhaust
- Aux Valve #1 / #2
- Start/Stop Button
- Upshift / Downshift Pin
