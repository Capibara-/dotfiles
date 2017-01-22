#!/bin/bash
#
# Based on https://raw.githubusercontent.com/orrsella/dotfiles/master/setup-brew.sh by the great Orr Sella.

if ! which brew > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

brew update

for app in "ansible" \
           "hub" \
	         "bash" \
           "bash-completion" \
           "coreutils" \
           "fortune" \
           "gawk" \
           "git" \
           "gnu-tar" \
           "httpie" \
           "ifstat" \
           "jq" \
           "python3" \
           "ruby" \
           "ssh-copy-id" \
           "sshrc" \
           "tree" \
           "htop" \
           "jq" \
           "ag" \
           "wget"; do

  brew install $app
done