# worktrunk (wt) shell integration
# Enables directory changing for wt commands like `wt switch`
# https://github.com/max-sixty/worktrunk

if command -v wt >/dev/null 2>&1; then
  eval "$(command wt config shell init zsh)"
fi
