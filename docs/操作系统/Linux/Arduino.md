# Arduino

1. 安装核心库

    ```sh
    sudo arduino-cli core install arduino:avr
    ```

2. 编译程序

    ```sh
    sudo arduino-cli compile -b arduino:avr:uno --warnings all
    ```

3. 确认开发板端口

    ```sh
    ls /dev/ttyACM*
    ls /dev/ttyUSB*
    ```

4. 上传程序

    ```sh
    sudo arduino-cli upload -b arduino:avr:uno -p <PORT>
    ```
