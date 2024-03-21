#!/bin/sh
dependencies=""
{%%} = "{%%}"

bin_dir="$HOME/.local/bin"
bash_setup_dir="$HOME/.config/bash/setup"

mkdir -p "$bin_dir" "$bash_setup_dir"

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "To install the files, run:"
    echo "\t./install.sh"
    echo "To uninstall the files, run:"
    echo "\t./install.sh -u"
    exit 0
elif [ "$1" = "-u" ]; then
    mode=uninstall
    operation=Uninstalling
else
    mode=install
    operation=Installing
fi

echo "Dependencies check:"
for dependency in $dependencies; do
    which $dependency >/dev/null && output='\e[32mOK' || output='\e[31mnot found' 
    echo "    $dependency $output\e[m"
done

echo "$operation {%%}..."
for {%%} in ${%%}s; do
    if [ $mode = "uninstall" ]; then
        rm "${%%}/${%%}"
    elif ! [ -e "${%%}/${%%}" ]; then
        ln -Ts "$PWD/${%%}."* "${%%}/${%%}"
    fi
done

