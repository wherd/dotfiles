# Create dir and cd it
function mcd {
    mkdir -p $1
    cd $1
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
    local port="${1:-8000}"
    sleep 1 && open "http://localhost:${port}/" &
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver() {
    local port="${1:-4000}"
    local ip=$(ipconfig getifaddr en1)
    sleep 1 && open "http://${ip}:${port}/" &
    php -S "${ip}:${port}" $2
}

# `o` with no arguments opens current directory, otherwise opens the given
# location
function o() {
    if [ $# -eq 0 ]; then
        open .
    else
        open "$@"
    fi
}

function hostsremove() {
    if [ -n "$(grep $1 /etc/hosts)" ]
    then
        echo "$1 Found in your /etc/hosts, Removing now...";
        sudo sed -i".bak" "/$1/d" /etc/hosts
    else
        echo "$1 was not found in your /etc/hosts";
    fi
}

function hostsadd() {
    HOSTS_LINE="$2\t$1"
    if [ -n "$(grep $1 /etc/hosts)" ]
        then
            echo "$1 already exists : $(grep $1 /etc/hosts)"
        else
            echo "Adding $1 to your /etc/hosts";
            sudo -- sh -c -e "echo '$HOSTS_LINE' >> /etc/hosts";

            if [ -n "$(grep $1 /etc/hosts)" ]
                then
                    echo "$1 was added succesfully \n $(grep $1 /etc/hosts)";
                else
                    echo "Failed to Add $1, Try again!";
            fi
    fi
}
