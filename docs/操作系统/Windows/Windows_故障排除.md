# Windows 故障排除

## 蓝屏

蓝屏时系统将创建一个拓展名为 `.dmp` 的内存转储文件到 `C:\Windows\Minidump` 目录 (默认路径) 下.

```console
> ll C:\Windows\Minidump
----- 7.8M 16 Jun 08:45  061625-18812-01.dmp
-----  11M 20 Jun 20:40  062025-26937-01.dmp
```

可以看出近期有两次蓝屏, 分别发生在 6 月 16 日和 20 日.

[BlueScreenView](https://www.nirsoft.net/utils/blue_screen_view.html) 可以帮助用户分析 `.dmp` 文件, 找出系统崩溃的原因.

![BlueScreenView 截图](assets/bluescreenview.png)

如上图所示, 很容易看出选中的崩溃是由第三方驱动 WinBtrfs 导致的.

## 开机时 Num Lock 自动启用

```bat
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_DWORD /d 0 /f
```

- `0`: 表示关闭所有指示器.
- `1`: 表示开启Caps Lock (大写键).
- `2`: 表示开启Num Lock (小键盘).
- `4`: 表示开启Scroll Lock(在 Thinkpad 中与 Num Lock 是相同的).

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

```bat
list part
sel part <part-id>
del part override
```

## 打开启动项文件夹

运行 `shell:startup`.

## 显示连接过 Wi-Fi 的密码

```bat
REM SSID 填写 * 显示全部连接过 Wi-Fi 的密码
netsh wlan show profile name="<SSID>" key=clear
```

明文密码位于 `Security settings->Key Content`.
