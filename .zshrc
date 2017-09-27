# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/satoem/.zshrc'

# completion settings
autoload -Uz compinit
compinit
# End of lines added by compinstall

# style settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':vompletion:*:default' menu select=1

# prompt color settings
autoload -Uz colors
colors
PROMPT="%{$fg[green]%}%m%(!.#.$) %{$reset_color%}"
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
RPROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}"

# global aliases
alias la="ls -la"
alias ll="ls -lh"
alias vi="vim"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias chrome-c="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias gitf="git-foresta"
alias search="find ./ -type f -print | xargs grep "
alias jpt="nohup jupyter notebook >> jupyter.log 2>&1 &"

# eval
if
  which pyenv > /dev/null;
  then
    eval "$(pyenv init -)";
fi

if
  which pyenv-virtualenv-init > /dev/null;
  then
    eval "$(pyenv virtualenv-init -)"; 
fi

# setup ssh-agent
if [ -f ~/.ssh-agent ]; then
    . ~/.ssh-agent
fi
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
    ssh-agent > ~/.ssh-agent
    . ~/.ssh-agent
fi
ssh-add -l >& /dev/null || ssh-add


