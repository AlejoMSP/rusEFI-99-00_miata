# ECU Pin Configuration (source: TunerStudio All IO, confirmed on hardware)

Everything below is read directly from the ECU's own TunerStudio All IO
1/3, 2/3, 3/3 screens, cross-referenced against the Miata factory wiring
diagram (Mazda B-1a/B-1b/B-1c).

See also [OEM Pinout Reference](oem-pinout-reference.md) for how this NB1
(1999-2000) pinout compares against other Miata model years.

## Miata Harness to rusEFI Pin Map

"Wire Color" is the factory wire color at that pin, so added sensors can
reuse existing wires without repinning the factory connector.

### Plug 1

| Miata Harness Pin | Function | rusEFI Pin | Wire Color |
| --- | --- | --- | --- |
| 1A | Battery Constant +12V | Permanent +12V | L/R |
| 1B | Switched Ignition +12V | A8 | W/R |
| 1D | CAN Bus High (repurposed Data Link Connector wire) | PD0 | G/W |
| 1E | Check Engine Light (MIL) - SKIPPED, not being used on this build | -- | W/L |
| 1F | Brake Light Switch | C9 (BUTTON3) | G |
| 1I | A/C Condenser Fan Relay | B9 | L/W |
| 1J | (free - was Rear Differential Temp, removed to free C14 for ETB TPS2) | -- | -- |
| 1L | CAN Bus Low (repurposed Data Link Connector wire) | PD1 | BR/Y |
| 1O | Alternator Field Control | B18 | GY/R |
| 1P | A/C Request Input | D10 (A/C Request / BUTTON2) | LG/B |
| 1R | Radiator Cooling Fan | B8 | R/G |
| 1S | A/C Compressor Clutch | B1 | L/B |
| 1V | Neutral Switch | C6 (HALL2) | V |

Alternator Settings: Enabled, smart PID control, control output B18, target
14.0V, PID defaults.

### Plug 2

| Miata Harness Pin | Function | rusEFI Pin | Wire Color |
| --- | --- | --- | --- |
| 2A | Not used for wideband - free, reassign if needed | -- | R/G |
| 2B | Intake Air Temp (IAT) | D15 | P/L |
| 2C | Wideband O2 signal | D1 (AUX1) | L |
| 2D | Vehicle Speed Sensor (VSS) | C7 | W/B |
| 2E | Engine Coolant Temp (CLT) | D16 | R/L |
| 2F | Knock Sensor | D14 | W |
| 2G | Brake Pressure Transducer | C4 (PPS2) | -- (empty cavity in stock harness) |
| 2H | Camshaft Position (CMP) | C5 | GY/L |
| 2I | Sensor +5V Power Supply | C1 | LG/R |
| 2J | Crankshaft Position (CKP) | C18 | GY/R |
| 2K | Tachometer Output | B13 (Coil 5 label) | G/O |
| 2L | EGT | PA15 (SPI3) | LG/B |
| 2M | Flex Fuel Sensor | D5 (FLEX) | V |
| 2N | Fuel Low Pressure Sensor | C15 (AUX3) | W/G |
| 2O | Oil Pressure Transducer | C3 (AUX2) | P/B |
| 2P | Oil Temperature | D6 (PPS1) | P |

### Plug 3

| Miata Harness Pin | Function | rusEFI Pin | Wire Color |
| --- | --- | --- | --- |
| 3A / 3B / 3C | ECU Power Grounds | A3 / A4 / C8 | B/Y / B/Y / B/L |
| 3E | Throttle Position - becomes ETB Primary TPS with DBW conversion (in progress) | D13 | G/B |
| 3F | Sensor Signal Ground | C11 | B/R |
| 3G | Coil 1 (Cyl 1 & 4 Wasted) | B15 | BR/Y |
| 3H | Coil 2 (Cyl 2 & 3 Wasted) | B14 | BR |
| 3I | Clutch Pedal Switch / Launch Control Activate | D2 (BUTTON1) | BR/W |
| 3J | Ambient Temperature | D9 (MAP label, repurposed) | R |
| 3N | Fuel Pump Relay | B16 | LG |
| 3O | Idle Air Control Solenoid | B17 | V/R |
| 3S | Coil 3 (Cyl 4 Seq) | B12 | GY |
| 3T | Coil 4 (Cyl 2 Seq) | B11 | GY/B |
| 3U | CAN Bus High tap - to ESP32 CAN display | PD0 (same bus as 1D) | L/O |
| 3V | CAN Bus Low tap - to ESP32 CAN display | PD1 (same bus as 1L) | R/Y |
| 3W-3Z | Fuel Injectors 1-4 | B6, B5, B4, B3 | Y/B, V/G, Y/R, Y/G |

### Free spare pins not yet used

Confirmed free from the factory diagram (marked with * / unused) or from
now-deleted emissions equipment (EGR, purge canister, etc):

| Pin | Wire Color |
| --- | --- |
| 1U | V/Y |
| 3Q | W/L |
| 2A | R/G |
| 1K | L/W |
| 3R | -- (marked spare on diagram) |
| 3P | -- (marked spare on diagram) |
| 3D | -- (marked spare on diagram) |
| 1C | -- (marked spare on diagram) |

1N status is unclear - user first said it's taken, then listed it as a
freed emissions pin. Confirm before using it. 1M is taken, do not reuse.

### Open questions - not yet answered

None.

### Grounding rule

Keep Power Ground (3A/3B/3C) isolated from Sensor Ground (3F/C11) in the
schematic. Do not tie them on the same net.

## Non-harness rusEFI internal pins

These are board-only settings with no corresponding Miata harness pin.

| Function | rusEFI Pin | Notes |
| --- | --- | --- |
| MAP ADC input | On-board MAP | Internal sensor, no external pin |
| SD CS Pin | PB6 | |

## Confirmed free pins on the rusEFI board (not yet used)

Confirmed against the board's own connector CSVs (connector_B/C/D):

| Pin | Label | Notes |
| --- | --- | --- |
| B7 | VVT1 / Low Side 1 | Low side output, has flyback diode |

## Drive-By-Wire ETB Conversion (in progress)

Throttle body: Ford ETC module 12C508, connector C1189 (BK). Confirmed
pinout from the throttle body's own connector, not yet from rusEFI's side:

| TB Pin | Circuit | Function |
| --- | --- | --- |
| 1 | BN | TPS1 Negative Slope |
| 2 | BU-OG | ETC Return (ground) |
| 3 | YE | ETC Reference (+5V) |
| 4 | GN-VT | TPS2 Positive Slope |
| 5 | YE-VT (18ga) | Motor + (TACM+) |
| 6 | BU-GN (18ga) | Motor - (TACM-) |

rusEFI-side assignment so far:

| Function | rusEFI Pin | Status |
| --- | --- | --- |
| TPS1 (Primary) | D13 | confirmed, reused from stock cable-throttle TPS pin |
| TPS2 (Secondary) | C14 (TPS2) | reserved - freed by removing Rear Diff Temp |
| Motor driver (DC1_PWM, DC1_DIR, DC1_DIS, OUT_DC1+/-) | unknown | NOT yet found - not on connector B/C/D CSVs, likely on connector A (no data) or find via ETB#1 Dir #1/Dir #2/Control/Disable dropdowns in TunerStudio |
| ETC Reference (+5V) | -- | use existing Sensor +5V (C1) or dedicated ref, TBD |
| ETC Return (ground) | -- | use Sensor Signal Ground (C11), TBD |

Still open:
- Motor driver pins unknown - need TunerStudio ETB#1 dropdown screenshots or
  connector_A.csv
- Accelerator pedal position sensor (dual channel) not yet planned - needs
  2 more analog inputs, none currently free
- rusEFI safety requirement: both TPS1 and TPS2 must be wired (per rusEFI
  Electronic Throttle Body Configuration Guide) - confirmed decision to
  wire both, not just one

## Sensor Calibrations

See [Sensor Calibrations](sensor-calibrations.md) for thermistor curves
(Oil Temp, Ambient Temp) and other analog sensor calibration values.

## Hardware notes

- IAC solenoid is 3-pin: 1 signal wire (3O, to B17), plus power and ground.
  Power ties into switched ignition power (can share 1B/A8 circuit), ground
  ties into Power Ground (3A/3B/3C, not Sensor Ground - this is an actuator,
  not a sensor). Neither power nor ground needs a dedicated rusEFI pin.
- CAN Bus (1D, 1L) reuses the factory Data Link Connector wires. These
  carried Mazda's old single-wire diagnostic protocol (pre-CAN on this
  99-00 model), not real CAN. Using them for rusEFI CAN breaks
  compatibility with any factory Mazda diagnostic tool on this circuit.
  Generic OBD-II scanner support (via CAN on connector pins 6/14) was
  considered and declined - not worth running separate wires for.
- Speedometer output not needed - handled directly by the transmission,
  not the ECU.
- Fuel Low Pressure Sensor (C15 AUX3, harness pin 2N) scaling not yet set,
  deferred until sensor voltage/pressure spec is confirmed.

## Not configured (NONE in TunerStudio)

Everything below is currently unassigned on the ECU. Confirm which of these
you actually need before wiring:

- Narrowband O2 heater output
- Idle Stepper Dir / Step / Enable - not used, this IAC is solenoid type, not stepper
- ETB#1 and ETB#2 (Dir, Control, Disable) - not used, no electronic throttle
- Main Relay Pin - not needed for this build (decided against, factory ignition switch handles power)
- Starter Relay Pin
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
