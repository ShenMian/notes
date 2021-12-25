# Git

### 安裝 github-cli
```bash
sudo pacman -S gh
gh auth login # 登录 Github 账号
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
## 清空仓库
git clone https://github.com/ACCOUNT/REPO.wiki.git
cd REPO.wiki
git checkout --orphan empty
git rm --cached -r .
git commit --allow-empty -m 'first commit'
git push origin empty:master --force