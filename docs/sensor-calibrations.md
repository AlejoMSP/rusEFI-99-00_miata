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
- Highest temperature: 41.5 C, Resistance @ HT: 1000 ohm

## Oil Temperature (ACDelco Gold 213-4514 / 19236568)

Input channel: D6 (PPS1), harness pin 2P.

- Pullup resistor: 2490 ohm
- Lowest temperature: -40 C, Resistance @ LT: 100700 ohm
- Middle temperature: 20 C, Resistance @ MT: 2868 ohm
- Highest temperature: 100 C, Resistance @ HT: 177 ohm

Note: source data listed an alternate middle point (30 C / 1796 ohm) instead
of the 20 C / 2868 ohm point used above - the 20 C point was used since it
was listed first. Confirm against official datasheet if oil temp readings
look off.

## Air Temperature Sensors - GM 25036751 (AC Delco 213-190)

This GM part is used for air temperature only (Ambient Temperature above),
not oil temperature - previously mislabeled in this doc, corrected.
