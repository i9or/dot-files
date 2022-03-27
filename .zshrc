# Better list
alias ll="ls -alFGh"
alias ls="ls -G"

# Starship prompt
if which starship > /dev/null; then eval "$(starship init zsh)"; fi

# Go
export PATH="$PATH:$(go env GOPATH)/bin"

# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# User bin folder
export PATH="/usr/local/sbin:$PATH"

# Terraform shortcut
alias tf="terraform"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
