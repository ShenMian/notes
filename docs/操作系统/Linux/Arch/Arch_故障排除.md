# Arch 故障排除

## signature from "XXX" is unknown trust

```sh
pacman -S archlinux-keyring
pacman-key -l Caleb
# 密钥过时
# 更新密钥
pacman-key --refresh-keys
pacman-key -l Caleb
# 密钥有效
```
