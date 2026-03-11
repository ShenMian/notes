#!/bin/bash

set -e

cd "$( cd "$( dirname "$0"  )" && pwd  )/.."

git checkout --orphan empty
git branch -D main
git add -A
git commit -m 'feat: initial commit'
git push origin empty:main --force
git checkout main
git branch -D empty
git pull origin main --allow-unrelated-histories
