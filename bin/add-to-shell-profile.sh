#!/bin/bash

# (c) 2018 Kapanu AG 

function addToShellProfileIfNotAlreadyThere {
  lineToAdd=$1
  # If bash completion not in bash_profile, add it
  if ! grep -qF "$lineToAdd" ~/.bash_profile ; then
    # backup bash_profile
    cp ~/.bash_profile ~/.bash_profile_backup_$(date +%Y-%m-%d-%H:%M:%S)
    
    echo "$lineToAdd" >> ~/.bash_profile
    source ~/.bash_profile
  fi
}
