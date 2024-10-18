#!/bin/bash

cd "$( cd "$( dirname "$0"  )" && pwd  )" || exit
cd .. || exit

git checkout --orphan empty        || exit 1
git branch -D main                 || exit 1
git add -A                         || exit 1
git commit -m '.'                  || exit 1
git push origin empty:main --force || exit 1
git checkout main                  || exit 1
git branch -D empty
git pull origin main --allow-unrelated-histories
