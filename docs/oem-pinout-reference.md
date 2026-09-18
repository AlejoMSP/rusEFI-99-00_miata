# Miata ECU/PCM Pinout Comparison by Year (1991-2003)

Source: factory wiring diagrams supplied by Daniel, read directly from scanned images.

**Important:** connector pin letters/numbers do NOT carry across generations. Each
year uses a different connector count and pin-naming scheme:

- 1990-93: 2 connectors (CONN #1 A-U, CONN #2 A-Z) - confirmed identical
  pinout across all four years; see full pin list below
- 1994-97: one generation. 1996 and 1997 pinouts are confirmed identical
  pin-for-pin (1A-1V, numbered 1-30, 3A-3P, 4A-4Z). 1994 uses the same wire
  colors on most functions but was originally read from a diagram using a
  separate numbered sensor harness (1-27) instead of the 4-connector layout -
  treated here as the same generation, merged into one "1994-97" column
- 1999 / 2000 (NB1): 3 connectors (1A-1V, 2A-2P, 3A-3Z), NB1 is your project's target
- 2003 (NB2): 4 connectors (2A-2R, 3A-3Z, 4A-4AH), adds VTCS + OCV (VVT) not present on NB1

So this table compares by **function and wire color**, not by pin letter. A "-" means
that turn's diagram didn't give a clean, confident function-to-wire match (per the
project rule: no guessing). Where 1994 and 1996/97 gave different wire colors for
the same function, both are shown as "94: X / 96-97: Y" rather than merged silently.

## Fuel Injectors

| Function | 90-93 | 1994-97 | 1999 (NB1) | 2000 (NB1) | 2003 (NB2) |
|---|---|---|---|---|---|
| Injector 1 | batch, see note below | GRN | YEL/BLK | Y/B | YEL/BLK |
| Injector 2 | batch, see note below | GRN/WHT | WHT/GRN | V/G | VIO/BLU |
| Injector 3 | batch, see note below | YEL/BLK | WHT/RED | Y/R | YEL/RED |
| Injector 4 | batch, see note below | YEL | YEL/GRN | Y/G | YEL/GRN |
| Common (power) | WHT-RED | WHT/RED | WHT/BLU | W/L | WHT/BLU |

**1994-97 injector note:** the GRN/GRN-WHT/YEL-BLK/YEL values above come from
the 1997 diagram. A separate 1996 diagram (Fig. 8, "1.8L Engine Performance
Circuits") shows injector wires ORN (#4), WHT/RED (#3), YEL/BLU (#2), BLU/RED
(#1) instead - same generation, but I can't confidently map those wires to
the same cylinder-to-letter assignment as the 1997 sheet without re-checking
which pin each attaches to. Treat the 1996 wire colors as unconfirmed against
this table until that's resolved; don't mix the two color sets when wiring.

**91-93 injector note:** this year uses batch fire, not individual per-cylinder
drive. Confirmed pins: **2U = YEL** (drives injectors 1 & 3) and **2V =
YEL-BLK** (drives injectors 2 & 4), both on common WHT-RED - confirmed
directly from the 1990 factory diagram's "FUEL INJECTORS" box, which labels
the cylinder numbers on each wire.
1990 uses the identical CONN#1/CONN#2 pinout and wire colors as 91-93 (same
ECU) - confirmed pin-for-pin against the 1990 factory diagram, no
differences found. My earlier version of this row incorrectly listed 4
separate pins (S/T/W/X) for individual injectors - that was a misread;
there is no per-cylinder injector pin on this year's 2-connector ECU.

## Trigger / Position Sensors

| Function | 90-93 | 1994-97 | 1999 (NB1) | 2000 (NB1) | 2003 (NB2) |
|---|---|---|---|---|---|
| Crank angle/position sensor | BLK-LT GRN, WHT-RED, WHT, YEL-BLU | - | - | A/B/C: W/R, GY/R, B/L | BLK/BLU, WHT/RED |
| Camshaft position sensor | - | GRN/RED, BLK/LT GRN, GRN/BLK | - | B/L, GY/L, W/R | BLU/BLU, GRY/BLU, WHT/RED |
| Knock sensor | - | - | - | W, B/L | BLU/BLK, BLK |

## Air / Fuel Metering

| Function | 90-93 | 1994-97 | 1999 (NB1) | 2000 (NB1) | 2003 (NB2) |
|---|---|---|---|---|---|
| MAF sensor | WHT, YEL-BLU, RED-WHT, RED-GRN | 94: BLK/LT GRN, YEL/BLU / 96-97: LT GRN, RED/WHT, BLU/RED | - | W/R, LG/B, B/L | BLK/BLU, PNK, WHT/RED |
| Throttle position sensor | LT GRN-RED, LT GRN-WHT, RED-BLK | 94: LT GRN/RED, LT GRN/WHT / 96-97: RED/WHT, BLK/YEL, BLK/BLU | - | G/B, B/R, LG/R | pin 4V (RED/BLU) |
| Coolant temp sensor | BLU-WHT, BLK-LT GRN | 94: RED/BLK / 96-97: LT GRN/RED | - | B/R, R/L, V/W | - |
| Front O2 sensor | RED-BLU | 94: YEL/BLK / 96-97: WHT/BLK, YEL/BLK | - | L=B/W, B/R=V/Y | - |
| Rear O2 sensor | - | 96-97: BLK/YEL | - | R=B/W, B/R=R/Y | - |
| IAC / idle air valve | - | 94: YEL/BLK | VIO/RED, ORG | V/R, O | - |
| Purge solenoid | - | 94: YEL/RED | - | BR/R, W/R | - |
| EGR valve/solenoid | - | 94: RED/BLU, RED (function), YEL/RED, YEL/BLK (solenoids) / 96-97: RED/BLK, RED | - | V, W/R, W/G, P/B | WHT/RED, PNK/BLK, WHT/GRN, LT GRN |
| EGR boost sensor | - | 96-97: BRN/BLK, LT GRN/WHT | - | C=LG/R, B=GY, A=B/R/Y | - |
| VICS solenoid | - | - | - | W/L, W/R | - |
| VTCS solenoid (NB2 only) | n/a | n/a | n/a | n/a | WHT/RED, PNK/BLK, WHT/GRN, LT GRN |

## Ignition

| Function | 90-93 | 1994-97 | 1999 (NB1) | 2000 (NB1) | 2003 (NB2) |
|---|---|---|---|---|---|
| Ignition coil (both banks combined) | RED, WHT, BLU | 94: BLU, BLK/WHT, BRN/YEL, BRN / 96-97: BLK/WHT, BLK/BLU (from 1&4 / 2&3 coils) | - | - | BLK/WHT, BRN/RED |
| Ignition coil 1 (separate, NB) | n/a | n/a | - | BR/Y, B, B/W | see above |
| Ignition coil 2 (separate, NB) | n/a | n/a | - | BR, B, B/W | see above |

## Switches / Relays

| Function | 90-93 | 1994-97 | 1999 (NB1) | 2000 (NB1) | 2003 (NB2) |
|---|---|---|---|---|---|
| Main relay | WHT-GRN, WHT-RED, BLK, BLK-WHT | - | - | G/R, B/W, W/L, B | - |
| A/C relay | BLU-BLK, LT GRN-YEL | 94: BLU/WHT, BLU/BLK / 96-97: BLU/BLK (1J) | - | - | BLU/BLK (2K) |
| Cooling fan relay | - | 94: BLK/GRN / 96-97: BLK/GRN (1L) | BLU/WHT (1I) | - | - |
| Clutch switch (M/T) | BRN-WHT, BLK | 94: BRN/WHT, BLK | - | B, BR/W | - |
| Neutral switch (M/T) | BRN-WHT, BLK | 96-97: YEL, YEL/BLK (4U,4V) | - | V, B | - |
| PSP switch | - | - | - | BR | - |
| Fuel pump relay | - | - | - | - | - |
| Data link connector | - | 96-97: WHT (pin26) | - | - | - |
| VSS | - | 94: WHT/RED, YEL/BLK / 96-97: YEL/BLU (pin28) | - | - | - |
| Refrigerant pressure switch | - | 94: LT GRN/BLK | - | - | - |
| Cruise control | BRN-WHT | 96-97: GRN/WHT, GRN, BLU/GRN, VIO (4W-4Z) | BLK/YEL | - | - |

## 1994-97 Generation: Confirmed Pin Match (1996 vs 1997)

Cross-checked directly, pin-for-pin, against a separate 1996 factory diagram set:

| Pin | 1996 | 1997 | Match |
|---|---|---|---|
| 1A | BLK/GRN | BLK/GRN | yes |
| 1B | BLU/WHT | BLU/WHT | yes |
| 1G | BLU/BLK | BLU/BLK | yes |
| 1I | LT GRN/YEL | LT GRN/YEL | yes |
| Numbered pin 1 | WHT/BLK | WHT/BLK | yes |
| Numbered pin 2 | YEL/BLK | YEL/BLK | yes |
| Numbered pin 5 | GRN/RED | GRN/RED | yes |
| Numbered pin 6 | BLK/LT GRN | BLK/LT GRN | yes |
| Numbered pin 8 | LT GRN | LT GRN | yes |
| Numbered pin 24 | WHT/RED | WHT/RED | yes |

Every pin checked matches exactly - 1996 and 1997 are the same ECU pinout.
This confirms 1994-97 is one real generation, not four different pinouts.

1996 also gave fuel injector wire colors not captured from any other year's
diagram: **#4 = ORN, #3 = WHT/RED, #2 = YEL/BLU, #1 = BLU/RED** (from Fig. 8,
"1.8L Engine Performance Circuits"). These don't match the GRN/GRN-WHT/
YEL-BLK/YEL set already in the Fuel Injectors table above (sourced from the
1997 diagram) - I haven't confirmed which pin letter each 1996 wire lands on,
so I can't yet tell if this is a real inconsistency or just two different
labeling passes on the same physical wires. Flagged above; don't rely on
either set for actual wiring until resolved.

## Aftermarket 94-95 ECU Pinout (by connector pin letter)

This diagram uses aftermarket board naming (Injector A/B/C/D, Ignition A/B/C/D, DFIN,
PWM), not Mazda factory wire colors. Connectors 1 and 4 are labeled "Factory Wiring"
(plug into the stock harness); Connectors 2 and 3 are labeled "Optional Wiring"
(aftermarket-only, no stock equivalent). Pin letters here are this board's own
naming, not confirmed to align 1:1 with the factory 1994 connector letters listed
above - do not assume pin 1A on this board is pin 1A on the factory diagram without
separately verifying against the physical connector.

**Connector 1 (Factory Wiring)**

| Pin | Function | Pin | Function |
|---|---|---|---|
| 1A | N/C | 1B | +12V Ignition |
| 1C | N/C | 1D | N/C |
| 1E | CEL (via DFIN1) | 1F | Tach Out |
| 1G | Cyl. 1/4 Ign. Coil (Ignition A Out) | 1H | Cyl. 2/3 Ign. Coil (Ignition B Out) |
| 1I | N/C | 1J | A/C Relay (Injector J Out) |
| 1K | N/C | 1L | Fan 1 Relay (PWM2) |
| 1M | VSS (DFIN2) | 1N | N/C |
| 1O | N/C | 1P | N/C |
| 1Q | A/C Switch In | 1R | N/C |
| 1S | N/C | 1T | N/C |
| 1U | N/C | 1V | Clutch Switch (Digital In 2) |

**Connector 2 (Optional Wiring)**

| Pin | Function | Pin | Function |
|---|---|---|---|
| 2A | CANH | 2B | Oxygen Sensor |
| 2C | CANL | 2D | Tach Out |
| 2E | External MAP Sensor | 2F | Knock Sensor |
| 2G | Ground | 2H | Digital In 1 (Flex) |
| 2I | PWM3 | 2J | Digital In 12V (DI4) |
| 2K | Analog In 2 | 2L | High Current 2 |

**Connector 3 (Optional Wiring)**

| Pin | Function | Pin | Function |
|---|---|---|---|
| 3A | Ignition C (Cyl 4 Seq.) | 3B | Ignition D (Cyl 2 Seq.) |
| 3C | Ignition A (Cyl 1/4 WS, Cyl 1 Seq.) | 3D | Ignition B (Cyl 2/3 WS, Cyl 3 Seq.) |
| 3E | Injector C (Cyl 4 Seq.) | 3F | Injector D (Cyl 2 Seq.) |
| 3G | Injector A (Cyl 1/4 Batch, Cyl 1 Seq.) | 3H | Injector B (Cyl 2/3 Batch, Cyl 3 Seq.) |
| 3I | +12V Out (Relay Supply) | 3J | High Current 1 (VVT) |
| 3K | Sensor Ground | 3L | IAC |
| 3M | CKP (Crank) Signal | 3N | +5Vref |
| 3O | CMP (Cam) Signal | 3P | TPS |

**Connector 4 (Factory Wiring)**

| Pin | Function | Pin | Function |
|---|---|---|---|
| 4A | Ground | 4B | Ground |
| 4C | Sensor Ground | 4D | Sensor Ground |
| 4E | CKP (Crank) Signal | 4F | Sensor Ground |
| 4G | CMP (Cam) Signal | 4H | N/C |
| 4I | Tach Out | 4J | N/C |
| 4K | +5Vref | 4L | N/C |
| 4M | TPS | 4N | O2 Sensor |
| 4O | Ext. MAP (MAF In) | 4P | IAT Sensor |
| 4Q | CLT Sensor | 4R | N/C |
| 4S | Condensor Fan (Injector I Out) | 4T | Fuel Pump |
| 4U | Cyl. 1 Injector (Injector A Out) | 4V | Cyl. 2 Injector (Injector D Out) |
| 4W | IAC (PWM1) | 4X | N/C |
| 4Y | Cyl. 3 Injector (Injector B Out) | 4Z | Cyl. 4 Injector (Injector C Out) |

**Flag:** pin 3J lists "High Current 1 (VVT)" - 94-95 Miatas have no VVT. Worth
confirming this diagram is actually labeled for the right year before relying on it.

## 1999-2005 Full Pin Lists

**1999 (NB1) - Connector 1 (1A-1V)**

| Pin | Wire | Function |
|---|---|---|
| 1A | BLU/RED | - |
| 1B | WHT/RED | - |
| 1D | GRN/WHT | - |
| 1E | WHT/BLU | - |
| 1F | GRN | - |
| 1G | BRN | - |
| 1H | GRN/RED | - |
| 1I | BLU/WHT | Cooling fans system |
| 1J | WHT/GRN | - |
| 1K | BRN/YEL | - |
| 1L | BRN/YEL | - |
| 1N | PNK/BLK | Transmissions system |
| 1O | GRY/RED | Starting/charging system |
| 1P | LT GRN/BLK | - |
| 1Q | BRN/RED | A/C system |
| 1R | RED/GRN | Starting/charging system |
| 1S | BLU/BLK | Cooling fans system |
| 1T | GRY | A/C system |
| 1U | VIO/YEL | Starting/charging system |
| 1V | VIO | - |

**1999 (NB1) - Connector 2 (2A-2P)**

| Pin | Wire |
|---|---|
| 2A | RED/GRN |
| 2B | PNK/BLU |
| 2C | BLU |
| 2D | WHT/BLK |
| 2E | RED/BLU |
| 2F | WHT |
| 2H | GRY/BLU |
| 2I | LT GRN/RED |
| 2J | GRY/RED |
| 2K | GRN/ORG |
| 2L | LT GRN/BLK |
| 2M | VIO |
| 2N | WHT/GRN |
| 2O | PNK/BLK |
| 2P | PNK |

**1999 (NB1) - Connector 3 (3A-3Z)**

| Pin | Wire |
|---|---|
| 3A | BLK/YEL |
| 3B | BLK/YEL |
| 3C | BLK/BLU |
| 3D | GRN/BLK |
| 3E | BLK/RED |
| 3G | BRN/YEL |
| 3H | BRN |
| 3I | BRN/WHT |
| 3J | RED |
| 3K | BRN/BLK |
| 3L | BRN/RED |
| 3M | ORG |
| 3N | LT GRN |
| 3O | VIO/RED |
| 3P | WHT/BLK |
| 3Q | WHT/BLU |
| 3R | VIO/YEL |
| 3S | GRY |
| 3T | GRY/BLK |
| 3U | BLU/ORG |
| 3V | RED/YEL |
| 3W | YEL/BLK |
| 3X | VIO/GRN |
| 3Y | YEL/RED |
| 3Z | YEL/GRN |

Fuel injectors (1999): 4 = YEL/GRN, 3 = WHT/RED, 2 = WHT/GRN, 1 = YEL/BLK, common WHT/BLU.
IAC solenoid: VIO/RED, ORG. These wire colors were traced to specific
components but not confidently pinned to specific connector-3 letters above
- treat as component-side confirmed, connector-letter-side unconfirmed.

Two additional numbered sensor harnesses (1-25 sensor side, 1-21 instrument/PCM
side) were read for wire color only - I could not confidently tie most of
those numbers to a specific function, so they're not reproduced here as a
pin table. Re-send those two pages zoomed on the function labels if you want
them added.

**2000 (NB1) - status: incomplete**

The 2000 source was a proper Mazda FSM with a shared "B1-01 PCM" pin grid
(rows 1U/1S/1Q... /3Y/3W/3U...) repeated across three sheets, but that grid
was too dense to read confidently letter-by-letter, so it was never
transcribed - flagged at the time rather than guessed. What *is* confirmed
for 2000 is the component-level pin/wire/connector-ID list (B1-02 through
B1-31, e.g. "B1-12 Fuel injector 1 (INJ): Y/B, W/L") already in the function
tables above. If you want the full 2000 PCM letter grid, that FSM page needs
to be re-sent cropped and zoomed on just the B1-01 table rows.

**2001-2002: no data.** Nothing has been sent for these years yet.

**2003 (NB2) - Connector 2 (2A-2R)**

| Pin | Wire | Function |
|---|---|---|
| 2A | YEL/BLK | Cooling fans |
| 2B | RED/YEL | Cooling fans |
| 2C | BLU/WHT | Cooling fans |
| 2D | VIO/GRN | - |
| 2E | LT GRN | - |
| 2F | WHT/GRN | - |
| 2G | YEL/RED | - |
| 2H | PNK/BLK | - |
| 2I | PNK | - |
| 2J | YEL/GRN | - |
| 2K | BLU/BLK | A/C system |
| 2L | RED/WHT | - |
| 2M | RED/WHT | - |
| 2N | BLK/WHT | - |
| 2O | RED | - |
| 2P | ORG | - |
| 2Q | VIO/RED | - |
| 2R | WHT/BLU | - |

**2003 (NB2) - Connector 3 (3A-3Z)**

| Pin | Wire | Function |
|---|---|---|
| 3A | BLK | - |
| 3B | BLK/RED | - |
| 3C | GRN/YEL | - |
| 3D | GRY/BLK | - |
| 3F | BRN/WHT | - |
| 3H | BLU/ORG | - |
| 3I | BLK/YEL | - |
| 3J | BLK/ORG | - |
| 3K | YEL/BLK | - |
| 3M | GRY/RED | Charging system |
| 3O | GRN/ORG | - |
| 3P | WHT/BLK | - |
| 3Q | GRN/WHT | - |
| 3S | RED/BLK | Anti-theft (immobilizer) |
| 3T | GRN/RED | - |
| 3U | BRN/RED | - |
| 3V | GRY/BLU | - |
| 3Y | VIO/WHT | - |

**2003 (NB2) - Connector 4 (4A-4AH)**

| Pin | Wire | Function |
|---|---|---|
| 4A | BLK/BLU | Instrument cluster |
| 4B | GRN | Instrument cluster |
| 4C | BRN | Instrument cluster |
| 4D | YEL | Instrument cluster |
| 4E | BRN/YEL | Instrument cluster |
| 4F | LT GRN/BLK | A/C system |
| 4H | VIO | (M/T) |
| 4I | WHT/GRN | (M/T) |
| 4J | ORG | - |
| 4L | LT GRN/RED | - |
| 4M | WHT | - |
| 4N | PNK/BLU | - |
| 4O | BLK/RED | - |
| 4P | RED/BLU | - |
| 4Q | VIO/YEL | - |
| 4S | BLK/WHT | - |
| 4T | GRY | Charging system |
| 4V | GRN/BLK - see flag below | - |
| 4W | BLU | - |
| 4X | PNK | - |
| 4Z | PNK/BLK | (W/A/T) |
| 4AA | RED | - |
| 4AC | VIO/RED | (W/A/T) |
| 4AD | BRN/BLK | - |
| 4AE | BLU/YEL | - |
| 4AF | WHT/RED | - |
| 4AG | BLU/RED | - |
| 4AH | RED/GRN | - |

**Flag - conflict on pin 4V:** the original 2003 diagram read gave 4V =
GRN/BLK with no function identified. You later told me TPS is pin 4V, and I
added "TPS = 4V (RED/BLU)" to the Air/Fuel Metering table above - but RED/BLU
doesn't match the GRN/BLK originally read at that same pin. One of these is
wrong. Since I didn't independently re-verify the diagram before accepting
the correction, don't treat either value as confirmed until this is
resolved - re-check the 2003 diagram at pin 4V directly.

**2004-2005: no data.** Nothing has been sent for these years yet.

## 90-93 Full Pin List (1.6L, 2-connector ECU)

Direct pin-letter transcription, confirmed against both the 90 and 91-93 factory
diagrams (identical ECU, identical pinout on both).

**CONN #1**

| Pin | Wire | Function |
|---|---|---|
| A | BLU-RED | Fuel tank unit |
| B | WHT-RED | Check eng IND / room fuse |
| C | VIO | Fuel tank unit / ST sign fuse |
| D | WHT-GRN | Check eng IND |
| E | YEL-BLK | Check eng IND |
| F | WHT-YEL | Check eng IND |
| G | BRN-YEL | Igniter |
| H | BRN | Igniter |
| I | - | N/C |
| J | BLU-BLK | A/C relay |
| K | LT GRN-YEL | A/C relay |
| L | - | N/C |
| M | - | N/C |
| N | - | N/C |
| O | RED | Igniter |
| P | GRN | Stop Lt SW |
| Q | BLU-YEL | A/C thermo SW |
| R | LT GRN-BLK | Cooling fan relay |
| S | BLK-GRN | Heater ctrl unit |
| T | BLU-ORG | Tail fuse |
| U | RED-BLK | unconfirmed |
| V | WHT (or BLK-BLU) | Ignition SW (M/T: WHT, A/T: BLK-BLU) |

**CONN #2**

| Pin | Wire | Function |
|---|---|---|
| A | BLK | ground (unconfirmed which) |
| B | BLK | ground (unconfirmed which) |
| C | BLK-LT GRN | unconfirmed |
| D | BLK-LT GRN | unconfirmed |
| E | WHT | Crank angle sensor |
| F | YEL-BLU | Crank angle sensor |
| G | RED-WHT | unconfirmed |
| H | BLK-WHT | unconfirmed |
| I | - | N/C |
| J | LT GRN-RED | Airflow meter |
| K | LT GRN-WHT | Throttle sensor (M/T) |
| L | RED-BLK | Throttle sensor (A/T) / unconfirmed |
| M | RED-BLU | O2 sensor |
| N | RED | unconfirmed |
| O | RED-GRN | Airflow meter |
| P | BLU-WHT | Coolant thermo sensor |
| Q | - | N/C |
| R | - | N/C |
| S | - | N/C |
| T | - | N/C |
| U | YEL | Fuel injectors 1 & 3 (batch) |
| V | YEL-BLK | Fuel injectors 2 & 4 (batch) |
| W | BLU-ORG | A/T control unit |
| X | YEL-RED | A/T control unit |
| Y | - | N/C |
| Z | LT GRN | A/T control unit |

Common injector power feed: WHT-RED (shared supply wire to both injector pairs, not a numbered pin).

## Notes

- 1994 and 1999 diagrams did not give a clean pin-to-function match for several
  sensors (MAF specifically for 1999, throttle/coolant for 1994 EGR area) - left
  as "-" rather than guessed.
- NB2 (2003) introduces VTCS and OCV (VVT solenoid) with no NB1 (1999-2000)
  equivalent - confirms these are not just relabeled pins but functionally
  different hardware between generations.
- Your project targets NB1 (1999-2000 column), so the 2000 FSM component tables
  (clean, high-confidence) are the best cross-check source against
  `docs/pinout-mapping.md`.
