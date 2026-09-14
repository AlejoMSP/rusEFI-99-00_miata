# rusEFI 99-00 Miata

rusEFI Hellen / uaEFI adapter board build for a 1999-2000 Mazda Miata NB1 (1.8L, 64-pin, 3-plug factory harness).

## Status

Bench testing phase, using an ECU simulator board before final vehicle install.

## Firmware config

Set via CLI: `set engine_type 9` (NB1 4/2 trigger decoder pattern for crank and cam sensors).

## Docs

- [Pinout Mapping](docs/pinout-mapping.md) - full harness to ECU pin map, aux sensors, reserved pins, wiring rules.

## Next steps

- KiCad schematic (`rusEFI-99-00_miata`) mapping the 3 factory plugs to the rusEFI adapter header.
