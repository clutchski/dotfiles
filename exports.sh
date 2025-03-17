# Environment variables.

export PYTHONSTARTUP=~/.pythonrc
export EDITOR=vim
export SCREENDIR=~/.screen
export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000
export VIRTUAL_ENV_DISABLE_PROMPT=true
export PATH=$PATH:/usr/local/bin:~/bin:/opt/homebrew/bin:/usr/local/go/bin/

# install asdf
export PATH="$PATH:$HOME/.asdf/shims"

# install pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# install rust
export PATH=$PATH:~/.cargo/bin

# Load shell plugins.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

if [ -e ~/.secrets.sh ]
then
    . ~/.secrets.sh
fi
