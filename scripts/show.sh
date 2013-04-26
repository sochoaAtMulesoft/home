#!/bin/bash

case $1 in 
    python)
        if ! which pip &>/dev/null ; then
            echo "PIP not installed."
            exit 1
        fi
        if ! which virtualenv &>/dev/null ; then
            echo "Virtualenv not installed."
            exit 1
        fi        
        ;;
    ruby)
        if ! which ruby &>/dev/null ; then
            echo "Ruby not installed."
            exit 1
        fi;
        if ! which rvm  &>/dev/null ; then
            echo "RVM not installed."
            exit 1
        fi;
        rvm-prompt | sed 's/ruby-/\n\truby:\t\t/g' \
                   | sed 's/@/\n\tgem-set:\t/g' 
        ;;
    load)
        echo -e "\n\t$(bash $HOME/git/home/scripts/load.ps1.rc)"
        ;;
esac;
