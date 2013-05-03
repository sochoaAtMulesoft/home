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

# update the gid/uid for all home files, preferring
# the group id based on user name instead of the user's
# primary group id based on the id command
gid_pri="$(grep -Ei ^$USER /etc/group | grep -Eo '[0-9]+')"
gid_sec="$(id | ack -o 'gid=\d+' | tr -d 'gid=')"
gid=$gid_pri
if [ "$gid" == "" ]; then
    echo "Primary GID unavailable.  Using secondary GID."
    gid=$gid_sec
fi;
uid=$(id | ack -o "uid=\d+" | tr -d 'uid=')
echo "sudo chown $uid:$gid -R $HOME/.ssh"
sudo chown $uid:$gid -R $HOME/.ssh 
rc=$?

if [ $rc -ne 0 ]; then 
    echo "Changing ownership of $HOME/.ssh failed (rc = $?)."
    exit 2
fi

chmod 0700 $HOME
chmod 0700 $HOME/.ssh
chmod 0600 $HOME/.ssh/authorized_keys
chmod 0600 $HOME/.ssh/*.id_rsa
chmod 0644 $HOME/.ssh/*.id_rsa.pub

git submodule update --init --recursive
