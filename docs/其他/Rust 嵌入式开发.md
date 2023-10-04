# Rust 嵌入式开发

## Arduino

```console
cargo install cargo-generate
cargo install ravedude

cargo generate --git https://github.com/Rahix/avr-hal-template.git
```

## STM32

添加 Cortex-M4(F) 目标:

```console
rustup target add thumbv7em-none-eabi   # 无浮点处理单元
rustup target add thumbv7em-none-eabihf # 有浮点处理单元(FPU)
rustup target list
```
