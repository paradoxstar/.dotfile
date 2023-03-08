#! /bin/sh
#
# set_config_file.sh
#
# Copyright © 2023 Hongkun Yu <staryhk@gmail.com>
#
# @AUTHOR:      Hongkun Yu
# @MAIL:        staryhk@gmail.com
# @VERSION:     2023-02-27
#

ln -s $DOTFILEDIR/config/condarc $HOME/.condarc
ln -s $DOTFILEDIR/config/tmux.conf $HOME/.tmux.conf
ln -s $DOTFILEDIR/config/gitconfig HOME/.gitconfig

