# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="clutchski"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git gitfast macos python gem pip extract asdf nvm rust)

source $ZSH/oh-my-zsh.sh

# custom zsh config
DISABLE_AUTO_TITLE=true
setopt auto_name_dirs
setopt no_prompt_cr
unsetopt correct_all

# Customize to your needs...
. ~/.exports.sh
. ~/.functions.sh
