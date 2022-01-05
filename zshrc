# Path to your oh-my-zsh configuration.

echo "Sourcing env.sh"
source ~/env.sh

echo "Sourcing fzf.sh"
source ~/fzf.sh

echo "Sourcing alias.sh"
source ~/alias.sh

echo "Sourcing path.sh"
source ~/path.sh

echo "Sourcing helpers.sh"
source ~/helpers.sh

# dirhistory: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dirhistory
plugins=(git history dirhistory)

if [ -e $HOME/.oh-my-zsh ]; then
  source $ZSH/oh-my-zsh.sh
fi

setopt inc_append_history
setopt share_history

setopt histignorespace
setopt histignorealldups
setopt histreduceblanks
setopt histsavenodups

unsetopt listambiguous

autoload -U compinit
autoload -U colors; colors
KUBECTL_PROMPT_ROOT="$HOME/src/zsh-kubectl-prompt"
if [ -f "${KUBECTL_PROMPT_ROOT}/kubectl.zsh" ]; then
  source "${KUBECTL_PROMPT_ROOT}/kubectl.zsh"
  RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
fi

compinit

eval "$(pyenv init -)"
test -s "/usr/local/opt/nvm/nvm.sh" && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
test -s "/usr/local/opt/nvm/etc/bash_completion" && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

alias harbor-login="docker login -u sochoa -p \"$(get_passwd harbor/sochoa)\" artifacts.msap.io"

. /usr/local/etc/profile.d/z.sh
