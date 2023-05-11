# vim: fdm=marker fdl=0 ft=zsh
# keep this file as simple & clean as possible

# set the actually home path
# for those public accounts to init personal env as: ACTHOME=$HOME/yhk
# It should be $HOME when private account.
export ACTHOME=$HOME

# setup PATH for linuxbrew/homebrew # {{{
if [[ "$OSTYPE" == "linux-gnu" ]]; then # only set for Linux
  export HOMEBREW_DIR=$ACTHOME/.linuxbrew
  export PATH="$HOMEBREW_DIR/bin":"$HOMEBREW_DIR/sbin":$PATH
  export MANPATH="$HOMEBREW_DIR/share/man":$MANPATH
  export INFOPATH="$HOMEBREW_DIR/share/info":$INFOPATH
  export FPATH="$HOMEBREW_DIR/share/zsh/site-functions":$FPATH
elif [[ "$OSTYPE" == "darwin"* ]]; then # only set for MAC
  export PATH="$(brew --prefix coreutils)/libexec/gnubin":$PATH
fi
# }}}

# variables
[[ -f ~/.linuxbrew/bin/vim ]] && VIM=~/.linuxbrew/bin/vim  || VIM=vim
export LANG=en_US.UTF-8
export DOTFILEDIR=$ACTHOME/.dotfile
export EDITOR_CH="$VIM -u $DOTFILEDIR/vim/vimrc"
export EDITOR="$VIM -u $DOTFILEDIR/vim/vimrc_yhk"
export GIT_EDITOR=${EDITOR}
export TERM="xterm-256color"
export PAGER="less"

# aliases
alias ec=$EDITOR_CH
alias e=$EDITOR
#alias ssh='ssh -Y'
alias vim='vim -u $DOTFILEDIR/vim/tiny-vimrc.vim'
alias tmux='tmux -f $DOTFILEDIR/config/tmux.conf'

# make ~/.antigen inside dotfile# {{{
if ! readlink ${ACTHOME}/.antigen | grep 'dotfile/bundle/zsh_plugins' -q; then
  echo "${ACTHOME}/.antigen is not inside dotfile"
  echo "create a directory (if not exist) in ${DOTFILEDIR}/bundle/zsh_plugins to save zsh plugins"
  mkdir -p ${DOTFILEDIR}/bundle/zsh_plugins

  echo "linking ${ACTHOME}/.antigen to ${DOTFILEDIR}/bundle/zsh_plugins"
  rm -rf ${ACTHOME}/.antigen && ln -s ${DOTFILEDIR}/bundle/zsh_plugins ${ACTHOME}/.antigen || exit
fi
# }}}
# source config before antigen# {{{
if ls $DOTFILEDIR/zsh/custom/ | grep -q '.zsh'; then
  for f in $DOTFILEDIR/zsh/custom/*.zsh; do
    source $f
  done
fi
# }}}
# set true to improve performance, but need to run `antigen-reset` after any changes
export ADOTDIR=$ACTHOME/.antigen
export _ANTIGEN_CACHE=true
export _ANTIGEN_CACHE=${_ANTIGEN_CACHE:-false}
source ${DOTFILEDIR}/bundle/antigen/antigen.zsh

antigen use oh-my-zsh # use oh-my-zsh as library
#backup bundles {{{
#mafredri/zsh-async
#docker
#}}}
antigen bundles << EOBUNDLES
  git
  fasd
  pip
  colored-man-pages
  zsh-users/zsh-completions
  zsh-users/zsh-syntax-highlighting
  derekdreery/zsh-ag
  history-substring-search
  joel-porquet/zsh-dircolors-solarized
  ${DOTFILEDIR}/zsh/plugin
EOBUNDLES

#sindresorhus/pure
#antigen theme evan # a skinny, topless prompt, use it if your computer is really slow
antigen theme ys-yhk
#antigen theme agnoster 
antigen apply

# color different file types and file extensions
alias ls='ls --color=tty'
alias ll='ls -al'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"


# Buddha

#echo -ne "\033[0;33m"
#cat<<EOT
#                         _oo0oo_                           
#                        088888880                          
#                        88" . "88                          
#                        (| -_- |)                          
#                         0\ = /0                           
#                      ___/'---'\___                        
#                    .' \\\\|     |// '.                      
#                   / \\\\|||  :  |||// \\                     
#                  /_ ||||| -:- |||||_ \\                    
#                 |   | \\\\\\  -  /// |   |                   
#                 | \_|  ''\---/''  |_/ |                   
#                 \  .-\__  '-'  __/-.  /                   
#               ___'. .'  /--.--\  '. .'___                 
#            ."" '<  '.___\_<|>_/___.' >'  "".              
#            | | : '-  \'.;'\ _ /';.'/ - ' : | |            
#            \  \ '_.   \_ __\ /__ _/   .-' /  /            
#        ====='-.____'.___ \_____/___.-'____.-'=====        
#                          '=---='                          
#                                                           
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^     
#                  天下武功  🙏   唯快不破                   
#                                                           
#     \\\\    // ||     ||          ||     ||  ||    //       
#      \\\\  //  ||     ||          ||     ||  ||  //         
#       \\\\//   ||     ||          ||     ||  ||//           
#        ||    ||     ||          ||_____||  ||\\\\           
#        ||    ||     ||          ||     ||  ||  \\\\         
#        ||    \\\\    //           ||     ||  ||    \\\\       
#        ||     \\\\__//            ||     ||  ||      \\\\     
#
#EOT
#echo -ne "\033[m"

