MAGENTA=$(tput setaf 9)
ORANGE=$(tput setaf 172)
GREEN=$(tput setaf 190)
PURPLE=$(tput setaf 141)
WHITE=$(tput setaf 255)
BOLD=$(tput bold)
RESET=$(tput sgr0)

function parse_git_branch() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "${branch}" ]; then
        [ "${branch}" == "HEAD" ] && local branch=$(git rev-parse --short HEAD 2>/dev/null)
        local status=$(git status --porcelain 2>/dev/null)
        echo -n " on ${PURPLE}${branch}"
        [ -n "${status}" ] && echo -n "*"
    fi
}

export PS1="\n$RESET\[$ORANGE\]\w\[$WHITE\]\$(parse_git_branch)\[$WHITE\]\n→ \[$RESET\]"
