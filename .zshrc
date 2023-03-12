# Better list
alias ll="ls -alFGh"
alias ls="ls -G"

# Docker Compose
alias doco="docker-compose"

# Starship prompt
if which starship > /dev/null; then eval "$(starship init zsh)"; fi

# Go
# export PATH="$PATH:$(go env GOPATH)/bin"

# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# User bin folder
export PATH="/usr/local/sbin:$PATH"

# Use Chromium instead of Chrome
export CHROME_EXECUTABLE=chromium

# Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Colima Docker settings
# export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
export DOCKER_DEFAULT_PLATFORM=linux/amd64
