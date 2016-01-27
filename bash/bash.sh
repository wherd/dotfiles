if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

source $HOME/.dotfiles/bash/bash.alias.sh
source $HOME/.dotfiles/bash/bash.functions.sh
source $HOME/.dotfiles/bash/bash.exports.sh
source $HOME/.dotfiles/bash/bash.prompt.sh
