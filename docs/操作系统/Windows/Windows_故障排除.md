# Windows 故障排除

## 开机时 Num Lock 自动启用  

```bat
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_DWORD /d 0 /f
```

- 0: 表示关闭所有指示器.
- 1: 表示开启Caps Lock(大写键).
- 2: 表示开启Num Lock(小键盘).
- 4: 表示开启Scroll Lock(在 Thinkpad 中与 Num Lock 是相同的).

## 电源管理中没有"关闭盖子动作"选项

- 方法1

    设置位于 `Control Panel\All Control Panel Items\Power Options\System Settings`.  

    运行 `gpedit.msc` 并打开路径 `Local Computer Policy/Computer Configuration/Administrative Templates/System/Power Managment/Button Settings`.  
    启用其中的 `Select the lid switch action` 并设置一个动作.  
    若选项无法修改, 则取消以上操作.  

- 方法2(可能无效)

    ```bat
    REM 开启选项
    REG ADD HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\4f971e89-eebd-4455-a8de-9e59040e7347\5ca83367-6e45-459f-a27b-476b1d01c936 /v Attributes /t REG_DWORD /d 2 /f

    REM 关闭选项
    powercfg -attributes SUB_BUTTONS 5ca83367-6e45-459f-a27b-476b1d01c936 +ATTRIB_HIDE
    ```

## 删除 MISO EFI 分区

磁盘管理器中无法对 MISO EFI 分区进行任何操作. 下面操作可以清空整个**盘**:  

```bat
diskpart
list disk
sel disk <disk-id>
clean
```

## 打开启动项文件夹

运行 `shell:startup`.  

## 显示连接过 Wi-Fi 的密码

```
REM SSID 填写 * 显示全部连接过 Wi-Fi 的密码
netsh wlan show profile name="<SSID>" key=clear
```

明文密码位于 `Security settings->Key Content`.  