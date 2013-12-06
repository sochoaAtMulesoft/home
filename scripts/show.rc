#!/bin/bash

echo
case $1 in 
    python)
        if ! which pythonbrew &>/dev/null ; then
            echo "pythonbrew not installed."
            exit 1
        fi
        if which pythonbrew &>/dev/null ; then 
            pythonbrew list 
        else
            version="$(python -c 'import sys; sys.stdout.write(str(sys.version[:5]));')"
            echo "System:  $(which python) $version"
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
