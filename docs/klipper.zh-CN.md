# Klipper 说明

本方案不额外占用 Klipper 输出引脚，也不使用 `[output_pin]` 直接控制继电器。

继电器控制信号来自 Manta M8P Motor3 / M3B 的 `2A` 线，因此它跟随所选电机驱动侧状态，而不是跟随普通 MCU GPIO。

## 建议检查项

- 确认 `M3B` 对应的是你实际想用来触发刹车释放的 Z 驱动口。
- 确认 `idle_timeout` 后电机会失能，刹车会抱死。
- 确认 emergency stop 或主电源断电后刹车会抱死。
- 如果你希望长时间保持龙门可移动，请先理解 idle timeout、步进保持电流和刹车状态之间的关系。

## 可用测试命令

按你的实际 stepper 名称测试电机 enable 状态，例如：

```ini
SET_STEPPER_ENABLE STEPPER=stepper_z ENABLE=1
SET_STEPPER_ENABLE STEPPER=stepper_z ENABLE=0
```

Voron 2.4 四 Z 常见名称包括 `stepper_z`、`stepper_z1`、`stepper_z2`、`stepper_z3`，请以你的 `printer.cfg` 为准。

## 不提供固定 pin 配置的原因

此 mod 没有使用 MCU GPIO 输出，所以没有通用的 Klipper pin 可以写进示例配置。若你改成 GPIO 或 MOSFET 控制继电器，那就是另一种方案，需要重新设计接线和配置。
