# Klipper Notes

This mod does not use an additional Klipper output pin and does not use an `[output_pin]` section to drive the relay.

The relay control signal is tapped from Manta M8P Motor3 / M3B `2A`, so the relay follows the selected motor-driver-side state instead of a normal MCU GPIO output.

## Recommended Checks

- Confirm that `M3B` is the actual Z driver port you want to use for brake release.
- Confirm that the brakes engage after `idle_timeout` disables the motors.
- Confirm that emergency stop or main power loss engages the brakes.
- Understand the interaction between idle timeout, stepper hold current, and brake state before leaving the gantry unsupported.

## Useful Test Commands

Test motor enable state with your actual stepper names, for example:

```ini
SET_STEPPER_ENABLE STEPPER=stepper_z ENABLE=1
SET_STEPPER_ENABLE STEPPER=stepper_z ENABLE=0
```

Common Voron 2.4 four-Z names include `stepper_z`, `stepper_z1`, `stepper_z2`, and `stepper_z3`. Use the names from your own `printer.cfg`.

## Why No Fixed Pin Config Is Provided

This mod does not use an MCU GPIO output, so there is no universal Klipper pin to include in a sample config. If you redesign it as a GPIO or MOSFET controlled relay, that becomes a different wiring and configuration approach.
