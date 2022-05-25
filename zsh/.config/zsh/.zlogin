#!/bin/zsh

printenv | awk --field-separator="=" "(\$1 ~ /^XDG_.+_HOME\$/) { print \$2 }" | xargs --delimiter="\n" mkdir --parents
startx "$XDG_CONFIG_HOME/x11/xinitrc"
