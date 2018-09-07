echo "[*] Loading bashrc configuration."

export EDITOR=/usr/bin/nano
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENV_PYTHON=/usr/local/bin/python

alias http='http --headers'
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
alias hexToIp='python -c "import sys;b=sys.argv[1].replace(\"0x\",\"\");print(\".\".join(map(lambda x: str(int(x, 16)), [b[i:i+2] for i in range(0,len(b), 2)])))"'
alias ssh='sshrc' 
alias mci='mvn clean install'
alias qfind="find . -name "                 # qfind:    Quickly search for file
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" # Search process table:
alias tabulatecsv='tabulate -s, -1'
bindkey '^R' history-incremental-pattern-search-backward

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
#    NETWORKING
#   ---------------------------
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections


#   ---------------------------
#    Wix
#   ---------------------------

# calc x-seen-by:
xsb() { x-seen-by -d $(http $1 --headers | grep X-Seen-By | awk '{print $2}') }

alias team-utils-venv="source /Users/gabik/.virtualenvs/team-utils/bin/activate"

get-ms() { wix meta-site get-ms $1 }

curlo() { curl -sS -v -o /dev/null $@ 2>&1 | x-seen-by; }

# Autocomplete for wix team-utils:
autoload bashcompinit && bashcompinit

_wix_completion() {
    COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
               COMP_CWORD=$COMP_CWORD \
               _WIX_COMPLETE=complete $1 ) )
    return 0
}

export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

complete -F _wix_completion -o default wix;
