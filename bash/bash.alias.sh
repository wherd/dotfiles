alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias dl="cd $HOME/Downloads"
alias dk="cd $HOME/Desktop"
alias dv="cd $HOME/Development"

alias g="git"
alias e="vim"

alias rm="rm -rf"
alias md="mkdir -p"

# List all files colorized in long format
alias ls="ls -hG"
alias l="ls -lF"
alias la="ls -laF"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Get software updates
alias update="sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup;"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"
