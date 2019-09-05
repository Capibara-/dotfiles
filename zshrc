echo "[*] Loading zshrc configuration."

export EDITOR=/usr/bin/nano
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENV_PYTHON=/usr/local/bin/python
export ANDROID_SDK=$HOME/Library/Android/sdk
export GOPATH=$HOME/go
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH:$GOPATH/bin

alias git='hub'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias l='ls'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias edit='code'                           # edit:         Opens any file in VSCode editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
alias grep='grep --color=auto'              # Colorize grep
alias egrep='egrep --color=auto'            # Colorize grep
alias fgrep='fgrep --color=auto'            # Colorize grep
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias urlEncode='python -c "import sys, urllib as ul; retval = ul.quote_plus(sys.argv[1]) if len(sys.argv) == 2 else \"Please pass a a single argument.\"; print retval"'
alias urlDecode='python -c "import sys, urllib as ul; retval = ul.unquote_plus(sys.argv[1]) if len(sys.argv) == 2 else \"Please pass a single argument.\"; print retval"'
alias htmlDecode='python -c "import sys;from HTMLParser import HTMLParser; print(HTMLParser().unescape(sys.argv[1]))"'
alias hexToIp='python -c "import sys;b=sys.argv[1].replace(\"0x\",\"\");print(\".\".join(map(lambda x: str(int(x, 16)), [b[i:i+2] for i in range(0,len(b), 2)])))"'
#alias ssh='sshrc' 
alias mci='mvn clean install'
alias qfind="find . -name "                 # qfind:    Quickly search for file
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" # Search process table:
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias tabulatecsv='tabulate -s, -1'
alias kc='kubectl config use-context '
alias kn='kubectl config set-context --current --namespace '
alias run_buildozer='pbpaste | grep "^buildozer" | bash'
alias clear_maven='find . -name target -type d -prune -print -exec rm -rf {} \;'

bindkey '^R' history-incremental-pattern-search-backward
bindkey "\e\eOD" backward-word 
bindkey "\e\eOC" forward-word

#   -------------------------------
#    FILE AND FOLDER MANAGEMENT
#   -------------------------------

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
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

# calc x-seen-by:
xsb() { x-seen-by -d $(http $1 --headers | grep X-Seen-By | awk '{print $2}') }

alias team-utils-venv="source /Users/gabik/.virtualenvs/team-utils/bin/activate"

get-ms() { wix meta-site get-ms $1 | jq }

request-id() { http https://www.wix.com/_serverless/logs-support/request-id/$1/}

curlo() { curl -sS -v -o /dev/null $@ 2>&1 | x-seen-by; }

export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1
export LC_ALL="en_US.UTF-8"

# eval "$(_WIX_COMPLETE=source wix)"

# Load nvm.
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source Prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source /Users/gabik/.bazelenv

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gabik/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/gabik/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gabik/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/gabik/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
