#!/bin/bash

set -e

plugins="
  zsh-users/antigen
  conghui/terminal-colors
  powerline/fonts
  bssthu/tunet_py
"

if [[ -z $DOTFILEDIR ]]; then
  echo "Please set DOTFILEDIR. e.g. export DOTFILEDIR=`pwd`"
  exit 1
fi

echo "DOTFILEDIR is set to $DOTFILEDIR"

mkdir -p ${DOTFILEDIR}/bundle

# clone a repo into ${DOTFILEDIR}/bundle if it does not exist. Otherwise, update it.
for repo in $plugins; do
  url="https://github.com/${repo}.git"
  local_dir="${DOTFILEDIR}/bundle/${repo##*/}"

  if [[ ! -d $local_dir ]]; then
    git clone --recursive --depth 1 $url $local_dir
  else
    pushd $local_dir; git pull; popd
  fi
done

# install Menlo fonts
curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash

 

echo "installtion complete"
