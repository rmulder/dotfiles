# Load env vars for the system
source ~/.env

# -------------------------------------------------------------------
# Mac helper aliases
# -------------------------------------------------------------------

# Show/hide hidden files (starting with a `.`)
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Save me from myself
alias rm=trash

# Delete auto-generated `.DS_Store` files
alias deleteDSFiles="find . -name '.DS_Store' -type f -delete"

# Flush the DNS cache (helpful if you’re playing with local DNS)
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

# -------------------------------------------------------------------
# Git stuff
# -------------------------------------------------------------------

# Use hub to make git more powerful (https://hub.github.com/)
alias git=hub

# Tab-to-complete commands for Git and Hub
source ~/.bash_completion/git.bash
source ~/.bash_completion/hub.sh

# Shortcut function for creating custom git.io links.
# See https://blog.github.com/2011-11-10-git-io-github-url-shortener/
gitlink() {
  # The first argument is the URL to shorten
  VALUES="-F \"url=$1\""

  # If a custom short code was requested, set the form value.
  if [ -n "$2" ]; then VALUES="$VALUES -F \"code=$2\""; fi

  # Send the request to GitHub and grab the Location header.
  RESPONSE=$(eval "curl -i https://git.io $VALUES 2>&1" | grep Location)

  # Remove the header name and echo only the generated short link.
  echo "${RESPONSE//Location: /}"
}

# -------------------------------------------------------------------
# GPG stuff
# -------------------------------------------------------------------

# This is so we can do nerdy GPG stuff and pretend to be hackers
export GPG_TTY=$(tty)

# -------------------------------------------------------------------
# Customize the prompt
# -------------------------------------------------------------------

# We want to show whether or not the repo has unstaged/staged changes
GIT_PS1_SHOWDIRTYSTATE=true

# Enable the prompt to display the current repo’s branch and status
source ~/.bash_prompt/git.sh

# This is the gibberish that sets colors and prompt variables
export PS1='\n\[\e[0;32m\]@jlengstorf: \[\e[0;33m\]\w\[\e[0m\] $(__git_ps1 " (%s)")\[\e[00m\]\n$ '

# -------------------------------------------------------------------
# Node.js
# -------------------------------------------------------------------

# Config for nvm, which lets us switch Node versions easily (https://github.com/creationix/nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# -------------------------------------------------------------------
# VS Code Configuration setup
# -------------------------------------------------------------------

# For screencasting, use stripped down settings with large text.
alias teach="code --user-data-dir ~/.code_profiles/screencast/data"

# -------------------------------------------------------------------
# Gatsby Stuff
# -------------------------------------------------------------------

# Add a helper for creating Gatsby short links.
source ~/.gatsby_shortlinks.sh
