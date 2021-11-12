# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="daveverwer"

plugins=(git rvm svn tmux yum history-substring-search)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

export TZ=America/Los_Angeles
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias sudo="nocorrect sudo"
export LESS=-Ri

alias ll='ls -l'
alias la='ls -A'
alias l='ls -C'
alias v='vim'

# tmux aliases
alias ta="tmux attach -d -t"
alias tn="cd $HOME; tmux new -s"
alias tl="tmux ls 2>/dev/null || echo 'No sessions available'"

if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then 
  source "$HOME/.rvm/scripts/rvm"
  rvm get stable --auto-dotfiles
fi


if [ -f "${HOME}/git/home/scripts" ]; then 
  script_dir=$HOME/git/home/scripts
  source "${script_dir}/reset_gemset.rc"
  source "${script_dir}/tree_with_color.rc"
  source "${script_dir}/find_large_directories.rc"
fi

if [ -d "${HOME}/opt/bin" ] ; then 
  export PATH="${HOME}/opt/bin:${PATH}"
fi
export PATH="/usr/local/sbin:${PATH}"

vim=$(which vim)
export VISUAL=$vim
export EDITOR=$vim
export PSQL_EDITOR=$vim

powerline="/Library/Python/2.7/site-packages/powerline"
if [ -d "${powerline}" ]; then 
    powerline="${HOME}/git/powerline/powerline"
    powerline+="/bindings/zsh/powerline.zsh"
    [ -f "${powerline}" ] && source "${powerline}"
fi

alias rg="grep -nrHI" 
alias rtest="rspec -f d"
export MCC_SRC="${HOME}/git/mcc"

unsetopt listambiguous


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
