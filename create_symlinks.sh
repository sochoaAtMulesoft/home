#!/bin/bash
set -e # exit on error

script_dir="$( cd "$( dirname "$0" )" && pwd )"

for i in $(\ls "$script_dir/dot_files" | sed 's/.*dot_files//g')
do
    dot_file="$HOME/.$i"
    echo "ln -f -s $(pwd)/dot_files/$i $dot_file"
    [[ -e "$dot_file" ]] && rm -Rf "$dot_file"
    ln -f -s "$(pwd)/dot_files/$i" "$dot_file"
done

if [[ -f "$HOME/.pgpass" ]]; then
    chmod 0600 "$HOME/.pgpass"
fi

git submodule update --init --recursive
