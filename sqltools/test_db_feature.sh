#!/bin/bash

for i in $(cat $(pwd)/manifest.* | sed 's/\\i //g' | grep ".sql")
do
  if [[ ! -f $i ]]; then
    echo "$i does not exist on the file system"
    exit 2
  fi
done

for i in $(find -type f | grep ".sql" | grep -v ".svn" | sed 's/\.\///g' | grep -v 'tests')
do
    if ! grep -Fxq "$i" manifest.*; then
        echo "$i exists on the file system, but isn't included in the manifest.znr"
        exit 2
    fi
    kw=$(eval "svn propget svn:keywords $i")
    if [[ "$kw" = "*Id URL*" ]]; then
        echo "$i does not have the right svn keywords: $kw"
        exit 2
    fi;
done


