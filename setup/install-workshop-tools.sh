#!/bin/bash

pathOfCurrentFile="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

chmod +x "$pathOfCurrentFile/../tools/kill-xc.sh"
chmod +x "$pathOfCurrentFile/../tools/convert-svg-to-png.sh"

source "$pathOfCurrentFile/../tools/add-to-shell-profile.sh"

# Add git autocompletion to console
addToShellProfileIfNotAlreadyThere "if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi"

# Add git branch parsing to console
addToShellProfileIfNotAlreadyThere "parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1='\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ '"

# Add alias to go to kapanu development folder
addToShellProfileIfNotAlreadyThere "export HISTCONTROL=ignoreboth:erasedups"
addToShellProfileIfNotAlreadyThere "alias cdk='cd ~/Developer/kapanu'"
addToShellProfileIfNotAlreadyThere "alias kill-xc='sh $pathOfCurrentFile/../tools/kill-xc.sh"
addToShellProfileIfNotAlreadyThere "alias k-svg2png='sh $pathOfCurrentFile/../tools/convert-svg-to-png.sh"

# TODO(nidegen) decide if not keep everythin in a script and only source it in bash profile
