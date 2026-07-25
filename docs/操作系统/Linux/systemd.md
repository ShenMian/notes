# systemd

## 服务状态管理

```sh
sudo systemctl status <UNIT>       # 查看服务状态
sudo systemctl enable --now <UNIT> # 启用服务开机自启并立即启动

sudo systemctl start <UNIT>   # 启动服务
sudo systemctl stop <UNIT>    # 停止服务
sudo systemctl restart <UNIT> # 重启服务

sudo systemctl daemon-reload  # 重新加载 Unit 文件
sudo systemctl restart <UNIT> # 重启服务
sudo systemctl reload <UNIT>  # 重新加载服务配置

sudo systemctl enable <UNIT>  # 启用服务开机自启
sudo systemctl disable <UNIT> # 禁用服务开机自启
```

## 配置文件管理

```sh
sudo systemctl cat <UNIT>  # 查看服务配置文件内容
sudo systemctl edit <UNIT> # 编辑服务配置文件
```

## 其他

```sh
sudo systemd-analyze blame    # 查看服务启动时间
sudo systemd-analyze security # 查看服务安全性分析
```

## 日志

```sh
journalctl -u <UNIT> # 查看指定服务的日志
```

## 参见

- [systemctl cheat sheet](https://linux-audit.com/cheat-sheets/systemctl/).
- [Systemd features to secure units and services](https://linux-audit.com/systemd/systemd-features-to-secure-units-and-services/).
