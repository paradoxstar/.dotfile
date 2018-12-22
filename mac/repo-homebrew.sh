#!/bin/sh


if [ $1 -eq 1 ];then
  echo "Mirrors THU"
  cd "$(brew --repo)"
  git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
  cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
  git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
  cd "$(brew --repo)/Library/Taps/homebrew/homebrew-cask"
  git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
elif [ $1 -eq 2 ];then
  echo "Mirrors USTC"
  cd "$(brew --repo)"
  git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
  cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
  git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
  cd "$(brew --repo)/Library/Taps/homebrew/homebrew-cask"
  git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git
else
    echo "Reload Github"
    cd "$(brew --repo)"
    git remote set-url origin https://github.com/Homebrew/brew.git
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://github.com/Homebrew/homebrew-core.git
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-cask"
    git remote set-url origin https://github.com/Homebrew/homebrew-cask.git
fi
