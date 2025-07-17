# Rust 嵌入式开发

## STM32

### 目标

添加合适的目标, 以 Cortex-M4(F) 为例:

```console
rustup target add thumbv7em-none-eabi   # 无浮点处理单元
rustup target add thumbv7em-none-eabihf # 有浮点处理单元 (FPU)
```

- `thumbv6m-none-eabi`: 适用于 Cortex-M0 和 Cortex-M1 处理器.
- `thumbv7m-none-eabi`: 适用于 Cortex-M3 处理器.
- `thumbv7em-none-eabi`: 适用于 Cortex-M4 和 Cortex-M 处理器.
- `thumbv7em-none-eabihf`: 适用于 Cortex-M4F 和 Cortex-M7F 处理器.
- `thumbv8m.main-none-eabi`: 适用于 Cortex-M33 和 Cortex-M35P 处理器.
- `thumbv8m.main-none-eabihf`: 适用于 Cortex-M33F 和 Cortex-M35PF 处理器.

### 烧录

下面工具可以将固件烧录到单片机内, 具体安装方法请参考[官方教程](https://probe.rs/docs/getting-started/installation/).

- [cargo-embed](https://probe.rs/docs/tools/cargo-embed/): 烧录程序到单片机和调试程序.

    ```console
    cargo embed
    ```

- [cargo-flash](https://probe.rs/docs/tools/cargo-flash/): 烧录程序到单片机.

    ```console
    cargo flash
    ```

## Arduino

!!! warning
    部分 Arduino 开发板 (如 Nano) 的闪存[^1]较小, 因此使用 Rust 开发需要特别注意空间使用情况, 避免程序过大.

```console
cargo install cargo-generate
cargo install ravedude

cargo generate --git https://github.com/Rahix/avr-hal-template.git
```

### 烧录

```console
cargo run
```

由于模板已经通过 `.cargo/config.toml` 对工具链进行的配置, 此时只需要简单的执行上面命令即可执行烧录.

[^1]: <https://docs.arduino.cc/learn/programming/memory-guide/#flash-memory-measurement>

## 参考

- <https://jzow.github.io/discovery/microbit/05-led-roulette/build-it.html>
