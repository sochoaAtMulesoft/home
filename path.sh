# vim: set ft=bash:
if [ -d /usr/local/sbin ]; then 
  export PATH="/usr/local/sbin:${PATH}"
fi

if [ -d "${HOME}/opt/bin" ] ; then
  export PATH="${HOME}/opt/bin:${PATH}"
fi
