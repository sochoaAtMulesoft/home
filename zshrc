# Path to your oh-my-zsh configuration.

echo "Sourcing env.sh"
source ~/env.sh

echo "Sourcing alias.sh"
source ~/alias.sh

echo "Sourcing path.sh"
source ~/path.sh

# zsh-autosuggestions: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
# dirhistory: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dirhistory
plugins=(git history zsh-autosuggestions dirhistory)

if [ -e $HOME/.oh-my-zsh ]; then
  source $ZSH/oh-my-zsh.sh
  if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
    echo "Cloning zsh-autosuggestions => ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  fi
fi

setopt histignorespace
setopt share_history
unsetopt listambiguous

eval "$(pyenv init -)"
