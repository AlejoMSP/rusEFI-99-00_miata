# Sensor Calibrations

Thermistor and analog sensor calibration values used on this ECU. All values
below are burned to the ECU (confirmed via TunerStudio sensor settings
screens), not just planned.

## Ambient Temperature (Stock Miata Airbox Intake Temp Sensor)

Input channel: D9 MAP (repurposed), harness pin 3J.

**Warning (per TunerStudio):** place this sensor before any turbocharger/
supercharger, near the air filter.

- Pullup resistor: 2490 ohm
- Lowest temperature: 5 C, Resistance @ LT: 4829 ohm
- Middle temperature: 24 C, Resistance @ MT: 1994 ohm
- Highest temperature: 39 C, Resistance @ HT: 1010 ohm

## Oil Temperature (GM / Delphi 25036751)

Input channel: D6 (PPS1), harness pin 2P. Sensor: GM / Delphi 25036751
(AC Delco 213-190) thermistor.

- Pullup resistor: 2490 ohm
- Lowest temperature: -20 C, Resistance @ LT: 28146 ohm
- Middle temperature: 25 C, Resistance @ MT: 2752 ohm
- Highest temperature: 100 C, Resistance @ HT: 175.3 ohm

Note: these values were provided by the user from a third-party source, not
independently verified against the GM datasheet. Confirm against the official
datasheet if oil temp readings look off.
