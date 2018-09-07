# Source bashrc.
source "$HOME/.bashrc"

echo "[*] Loading zshrc configuration."

# Load nvm.
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source Prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
