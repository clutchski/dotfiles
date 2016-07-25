# Environment variables.

export PYTHONSTARTUP=~/.pythonrc
export EDITOR=vim
export SCREENDIR=~/.screen
export PATH=$PATH:~/bin
export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000
export VIRTUAL_ENV_DISABLE_PROMPT=true

# Load shell plugins.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.tmuxinator/scripts/tmuxinator" ]] && source "$HOME/.tmuxinator/scripts/tmuxinator"

if [ -e ~/.secrets.sh ]
then
    . ~/.secrets.sh
fi
