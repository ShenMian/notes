# Git

## 清空仓库
git clone https://github.com/ACCOUNT/REPO.wiki.git
cd REPO.wiki
git checkout --orphan empty
git rm --cached -r .
git commit --allow-empty -m 'first commit'
git push origin empty:master --force