# Better list
alias ll="ls -alFGh"
alias ls="ls -G"

# Starship prompt
eval "$(starship init zsh)"

# Go
export PATH="$PATH:$(go env GOPATH)/bin"

# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GitHub PAT
export CR_PAT="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

# User bin folder
export PATH="/usr/local/sbin:$PATH"

# Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
