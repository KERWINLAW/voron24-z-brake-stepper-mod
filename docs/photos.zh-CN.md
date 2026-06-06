# 参考图片

[English](photos.en.md)

这些图片用于帮助爱好者识别本方案用到的实物元器件和端口，只作为参考。实际接线前，请按自己手上的下位机、继电器、电源和刹车步进电机丝印确认引脚、极性、触发逻辑，并用万用表验证继电器动作。

## 电器底仓实拍

![电器底仓实拍](../assets/photos/electronics-bay.jpg)

Voron 2.4 电器底仓示例，包含 Manta M8P、刹车继电器模块、刹车电源线和四个 Z 轴带刹车步进电机。

## Manta M8P 端口参考

![Manta M8P 红框端口参考](../assets/photos/manta-m8p-highlighted-ports.png)

红框位置用于标记本方案中需要关注的区域：Motor3 / M3B 步进端口中的 `2A` 引线，以及 USB 口旁用于继电器 `DC-` 的 GND 位置。

## 带刹车步进电机

![带刹车步进电机实物](../assets/photos/brake-stepper-motors.jpg)

四个 Z 轴位置使用的 42 系列带刹车步进电机示例。普通步进电机相线和刹车线圈线要分清，刹车线圈不要接入步进驱动相线回路。

## 继电器模块参考

![继电器模块购买/参考截图](../assets/photos/relay-module-reference.jpg)

继电器模块购买/参考截图。它只用于说明模块类型和外观，不能直接替代实物核对：不同继电器模块的 `S`、`DC+`、`DC-`、`COM`、`NO`、`NC` 端子顺序、触发电压、跳帽逻辑和触点容量都可能不同。
