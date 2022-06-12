# Better list
alias ll="ls -alFGh"
alias ls="ls -G"

# Micro editor
alias m="micro"

# Starship prompt
if which starship > /dev/null; then eval "$(starship init zsh)"; fi

# Go
export PATH="$PATH:$(go env GOPATH)/bin"

# LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# User bin folder
export PATH="/usr/local/sbin:$PATH"

# Terraform shortcut
alias tf="terraform"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# Dart SDK
export PATH="$PATH:/usr/local/opt/dart/libexec"

# Dart Pub
export PATH="$PATH:$HOME/.pub-cache/bin"

# Use Chromium instead of Chrome
export CHROME_EXECUTABLE=chromium

# Java
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
