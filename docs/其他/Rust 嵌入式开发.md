# Rust 嵌入式开发

## Arduino

```sh
cargo install cargo-generate
cargo install ravedude

cargo generate --git https://github.com/Rahix/avr-hal-template.git
```

## STM32

```console
rustup target add thumbv7em-none-eabi
rustup target add thumbv7em-none-eabihf # 有硬件浮点支持
```
