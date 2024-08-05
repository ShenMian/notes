@echo off

cd %~dp0\.. || exit /b 1

git checkout --orphan empty        || exit /b 1
git branch -D main                 || exit /b 1
git add -A                         || exit /b 1
git commit -m "."                  || exit /b 1
git push origin empty:main --force || exit /b 1
git checkout main                  || exit /b 1
git branch -D empty
git pull origin main --allow-unrelated-histories
