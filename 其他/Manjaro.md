## 終端美化

### 命令提示符
```bash
git clone https://github.com/daniruiz/dotfiles
./dotfiles/install.sh
```

### 透明背景
```bash
yay -S gnome-terminal-transparency
```
在終端設置裏調整透明度.

## Gnome

### 瀏覽器插件管理
URL: https://extensions.gnome.org/


## Git

### 安裝 github-cli
```bash
sudo pacman -S gh
gh auth login
# gh auth setup-git
```

### 設置用戶
```bash
git config --global user.name 'name'
git config --global user.email 'eamil'
```

### 設置代理
```bash
git config --global http.proxy 'socks5://127.0.0.1:7891'
git config --global https.proxy 'socks5://127.0.0.1:7891'
```
