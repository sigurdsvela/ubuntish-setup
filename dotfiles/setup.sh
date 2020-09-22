#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

## -- SSH -- ##
if [ ! -d ~/.ssh ]; then
  mkdir ~/.ssh;
fi
for f in $DIR/.ssh/*; do ln -fs $DIR/.ssh/$f ~/.ssh/$(basename $f); done

## -- XKB.d -- ##
ln -fs $DIR/.xkb ~/.xkb

## -- PROFILE.D -- ##
# Run all .profile.d .sh files on .bashrc
printf "\n\nfor f in ~/.profile.d/*.sh; do source \"\$f\"; done \n" >> ~/.bashrc
ln -fs $DIR/.profile.d ~/.profile.d
source ~/.bashrc

