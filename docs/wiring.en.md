# Wiring Notes

![Wiring diagram](../assets/wiring-diagram.en.png)

## Goal

Use a relay to control four 24 V brake coils. The relay control side is powered by Manta M8P `M3B-2A` and USB-side GND. The relay contact switches only the 24 V brake positive line.

## Signal Names

| Name | Meaning |
| --- | --- |
| `M3B-2A` | Pin 2A on Manta M8P Motor3 / M3B |
| USB GND | GND near the Manta M8P USB connector |
| `DC+` | Relay module control-side positive |
| `DC-` | Relay module control-side negative |
| `S` / `IN` | Relay module trigger input |
| `COM` | Relay contact common terminal |
| `NO` | Normally-open contact, connected to COM when the relay is energized |
| `NC` | Normally-closed contact, unused in this mod |

## Control Side

1. Tap one wire from Manta M8P Motor3 / M3B `2A`.
2. Connect `M3B-2A` to both relay `S` and relay `DC+`.
3. Tap GND from the USB-side GND point on the Manta M8P.
4. Connect USB GND to relay `DC-`.
5. Set the relay high/low trigger jumper by testing the real module.

## Brake Load Side

1. Connect 24 V brake PSU `V+` to relay `COM`.
2. Connect relay `NO` to the `+` wire of all four brake coils in parallel.
3. Connect all brake coil `-` wires to 24 V brake PSU `V- / 0V`.
4. Leave `NC` disconnected.

## Do Not

- Do not connect the 24 V brake supply to relay control terminals `DC+ / DC-`.
- Do not run brake coil current through the Manta M8P stepper output.
- Do not run brake coil current through USB GND.
- Do not cut the original Z stepper phase wires.

## First Test

1. Connect only the relay control side and verify relay on/off behavior.
2. Connect the 24 V brake supply without loading the gantry and verify the NO contact output.
3. Connect the four brake coils and support the gantry by hand while testing.
4. Confirm that power loss, Klipper emergency stop, and idle timeout engage the brakes.
