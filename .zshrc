# Better list
alias ll="ls -alFGh"
alias ls="ls -G"

# Starship prompt
if which starship > /dev/null; then eval "$(starship init zsh)"; fi

# Go
export PATH="$PATH:$(go env GOPATH)/bin"

# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# User bin folder
export PATH="/usr/local/sbin:$PATH"

# Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# PostgreSQL 15
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# bun completions
[ -s "/Users/igor/.bun/_bun" ] && source "/Users/igor/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
