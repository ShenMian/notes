# Rust 嵌入式开发

## STM32

添加 Cortex-M4(F) 目标:

```console
rustup target add thumbv7em-none-eabi   # 无浮点处理单元
rustup target add thumbv7em-none-eabihf # 有浮点处理单元 (FPU)
```

## Arduino

```console
cargo install cargo-generate
cargo install ravedude

cargo generate --git https://github.com/Rahix/avr-hal-template.git
```

!!! warning
    Arduino 开发板的闪存[^1]通常较小, 因此使用 Rust 开发需要特别注意空间使用情况, 避免程序过大.

[^1]: <https://docs.arduino.cc/learn/programming/memory-guide/#flash-memory-measurement>
