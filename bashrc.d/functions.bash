# Print path components, each on its own line
function path() {
  echo $PATH | tr ':' '\n'
}

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$_";
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# copy public key to remote machine
function authme() {
    ssh "$1" 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' \
        < ~/.ssh/id_rsa.pub
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
    local port="${1:-8000}";
    sleep 1 && open "http://localhost:${port}/" &
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver() {
    local port="${1:-4000}";
    local ip=$(ipconfig getifaddr en0);
    sleep 1 && open "http://${ip}:${port}/" &
    php -c . -S "${ip}:${port}";
}

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
    if [ -t 0 ]; then # argument
        python -mjson.tool <<< "$*" | pygmentize -l javascript;
    else # pipe
        python -mjson.tool | pygmentize -l javascript;
    fi;
}

# Run `dig` and display the most useful info
function digga() {
    dig +nocmd "$1" any +multiline +noall +answer;
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
    if [ $# -eq 0 ]; then
        open .;
    else
        open "$@";
    fi;
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
    tree -aC -I '.git|.hg|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

# Yoinked from http://brettterpstra.com/2009/11/14/fk-a-useful-bash-function/
# FK: ‘fk’ is short for Find and Kill, and it does a quick search of your
# running processes for a case-insensitive partial match of the first parameter
# passed to it
#
# run fk process, where process is a partial name of a running application or
# UNIX process. You’ll get a menu with the matches, and you can kill a
# specific process by typing its number at the prompt.
# "Cancel" is the first option.

fp () { #find and list processes matching a case-insensitive partial-match string
    ps Ao pid,comm|awk '{match($0,/[^\/]+$/); print substr($0,RSTART,RLENGTH)": "$1}'|grep -i $1|grep -v grep
}

fk () {
    IFS=$'\n'
    PS3='Kill which process? (1 to cancel): '
    select OPT in "Cancel" $(fp $1); do
        if [ $OPT != "Cancel" ]; then
            kill $(echo $OPT|awk '{print $NF}')
        fi
        break
    done
    unset IFS
}

# wrapper around dregutil
# https://github.com/merll/docker-registry-util
function dregutil(){
    declare REGISTRY=${REGISTRY:-'https://image-registry.interpublic.com:5000'}
    declare -r LOCAL_DOCKER_CONFIG="${HOME}/.docker/config.json"
    if [[ ! -f "$LOCAL_DOCKER_CONFIG" ]]
    then
        local username
        local password
        read -p  "Enter username for docker registry ${REGISTRY} " username
        read -sp 'Enter password: ' password
        CREDENTIALS="${username}:${password}"
        docker login "${REGISTRY}" -u "$username" -p "$password"
    fi
    local encoded_credentials=$(jq --exit-status \
                                   --raw-output ".[\"auths\"][\"${REGISTRY##*/}\"][\"auth\"]" \
                                   < "$LOCAL_DOCKER_CONFIG")
    if [[ $? -gt 0 ]]
    then
        # echo "$encoded_credentials"
        echo "Problem reading $LOCAL_DOCKER_CONFIG"
        if ! which jq >/dev/null
        then
            echo "Please install JSON parser \"jq\"".
        fi
        exit 1
    fi
    CREDENTIALS=$(base64 -d <(echo "$encoded_credentials"))
    if [[ $? -gt 0 ]]
    then
        echo "Problem deccoding credentials."
        if ! which base64 >/dev/null
        then
            echo "Please install utility \"base64\"."
        fi
        exit 1
    fi
    # split out username and password (colon delim)
    command /usr/local/bin/dregutil --user "${CREDENTIALS%%:*}" \
            --password "${CREDENTIALS#*:}" --registry "$REGISTRY" "$@"
} # dregutil
