# Source bashrc.
source "$HOME/.bashrc"

echo "[*] Loading zshrc configuration."

# Load nvm.
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source Prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gabik/git/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/gabik/git/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gabik/git/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/gabik/git/google-cloud-sdk/completion.zsh.inc'; fi
source /Users/gabik/.bazelenv
