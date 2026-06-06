# Safety Notes

Brake steppers affect gantry safety. Incorrect wiring can prevent brake release, cause unexpected brake release, damage the relay, damage the controller, or allow the gantry to drop.

## Verify Before Use

- Brake coils are rated for 24 V.
- Total current of all four brake coils is below the relay contact rating with margin.
- Relay control-side current is appropriate for this `M3B-2A` trigger approach.
- USB GND is used only as the relay control reference and does not carry brake coil current.
- 24 V brake supply `V+ / V-` is not mixed with relay control terminals `DC+ / DC-`.
- Inductive load suppression is present across the brake coils.

## Recommended Protection

- Fuse the brake load circuit.
- Use appropriate wire gauge and ferrules.
- Add flyback diodes, TVS, or RC snubbers across the coils as appropriate for your hardware.
- Support or unload the gantry during first tests.
- Test power loss, reboot, firmware stop, and idle timeout behavior.

## Disclaimer

This is an experimental community mod, not an officially certified safety mechanism. Use it at your own risk.
