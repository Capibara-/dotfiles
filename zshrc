echo "[*] Loading zshrc configuration."

# Add brew python folder to path to take precedence:
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source bashrc.
source "$HOME/.bashrc"

# Load nvm.
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load z:
. /usr/local/etc/profile.d/z.sh
