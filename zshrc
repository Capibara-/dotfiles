export EDITOR=/usr/bin/nano
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENV_PYTHON=/usr/bin/python3
export GOPATH=$HOME/go
export CLOUDSDK_PYTHON="/usr/bin/python3"
export PATH="/opt/homebrew/opt/python@3.10/libexec/bin":"/opt/homebrew/opt/scala@2.12/bin":$PATH:$GOPATH/bin
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-17.jdk"

alias git='hub'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -aFGlAhp'                       # Preferred 'ls' implementation
alias l='ls'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias edit='code'                           # edit:         Opens any file in VSCode editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
alias grep='grep --color=auto'              # Colorize grep
alias egrep='egrep --color=auto'            # Colorize grep
alias fgrep='fgrep --color=auto'            # Colorize grep
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias urlEncode='python3 -c "import sys, urllib.parse as ul; retval = ul.quote_plus(sys.argv[1]) if len(sys.argv) == 2 else \"Please pass a a single argument.\"; print(retval)"'
alias urlDecode='python3 -c "import sys, urllib.parse as ul; retval = ul.unquote_plus(sys.argv[1]) if len(sys.argv) == 2 else \"Please pass a single argument.\"; print(retval)"'
alias htmlDecode='python3 -c "import sys;import html; print(html.unescape(sys.argv[1]))"'
alias hexToIp='python3 -c "import sys;b=sys.argv[1].replace(\"0x\",\"\");print(\".\".join(map(lambda x: str(int(x, 16)), [b[i:i+2] for i in range(0,len(b), 2)])))"'
alias qfind="find . -name "                 # qfind:    Quickly search for file
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" # Search process table:
alias tabulatecsv='tabulate -s, -1'
alias kc='kubectl config use-context '
alias kn='kubectl config set-context --current --namespace '
alias run_buildozer='pbpaste | grep "^buildozer" | bash'
alias align-master='git checkout master  && git reset origin/master --hard && git pull'
alias pbminify='pbpaste | jq -r tostring | pbcopy'
alias glog='git log --oneline --decorate --graph'

# bindkey '^R' history-incremental-pattern-search-backward
bindkey "\e\eOD" backward-word 
bindkey "\e\eOC" forward-word

#   -------------------------------
#    FILE AND FOLDER MANAGEMENT
#   -------------------------------

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
extract () { # extract:  Extract most know archives with one command
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

#   ---------------------------
#    Wix
#   ---------------------------

alias npmpublic="npm config set registry https://registry.npmjs.org/ && npm config get registry && yarn config set registry https://registry.npmjs.org/ || yarn config set npmRegistryServer https://registry.npmjs.org/ "
alias npmprivate="npm config set registry https://npm.dev.wixpress.com && npm config get registry && yarn config set registry https://npm.dev.wixpress.com || yarn config set npmRegistryServer https://npm.dev.wixpress.com"

alias team-utils-venv="source /Users/gabik/.virtualenvs/team-utils-latest/bin/activate"

get-ms() { wix meta-site get-ms $1 | jq }

request-id () {
	curl -s https://www.wix.com/_serverless/logs-support/request-id/$1/ | jq '.grafana' | xargs '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'
}

dump-key-vi-cache () {
  curl --compressed http://$1:8080/$2 -H'x-wix-key-vi-proxy-secret:ab81f2c1-2c86-4bfa-8a29-b5b04b78a5eb'
}

curlh() { curl -sS -v -o /dev/null $@ 2>&1 | x-seen-by; }

export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1
export LC_ALL="en_US.UTF-8"

tput smam
