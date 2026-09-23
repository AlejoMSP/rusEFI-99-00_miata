# Sensor Calibrations

Thermistor and analog sensor calibration values used on this ECU. All values
below are burned to the ECU (confirmed via TunerStudio sensor settings
screens), not just planned.

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

## Air Temperature Sensor - GM 25036751 (AC Delco 213-190) - NOT USED

This GM part was originally intended for air temperature (Ambient Temp), not
oil temperature. Dropped from this build entirely: the intended input pin
(D9) turned out to be the same physical MCU pin as ETB TPS2 (C14), a
conflict caught by TunerStudio, and the sensor was confirmed to be the
wrong one for this application anyway. Not currently wired to anything.
