#!/bin/sh
dependencies=""
{% Executables %}="{% vim fzf nc ...%}"

bin_dir="$HOME/.local/bin"
bash_setup_dir="$HOME/.config/bash/setup"

mkdir -p "$bin_dir" "$bash_setup_dir"

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    printf "To install the files, run:\n"
    printf "\t./install.sh\n"
    printf "To uninstall the files, run:\n"
    printf "\t./install.sh -u\n"
    exit 0
elif [ "$1" = "-u" ]; then
    mode=uninstall
    operation=Uninstalling
else
    mode=install
    operation=Installing
fi

if [ "$mode" != "uninstall" ]; then
    echo "Dependencies check:"
    for dependency in $dependencies; do
        which "$dependency" >/dev/null 2>&1 && output='\e[32mOK' || { output='\e[31mnot found'; valid_deps=false; }
        printf "    %b %b\e[m\n" "$dependency" "$output"
    done
fi

if ! $valid_deps; then
    echo "Not all dependencies met. Aborting."
    exit 1
fi

echo "$operation {%%}..."
for {% Item %} in ${% Items %}s; do
    if [ $mode = "uninstall" ]; then
        rm "${% Dir %}/${% Item %}"
    elif ! [ -e "${% Dir %}/${% Item %}" ]; then
        ln -Ts "$PWD/${% Item %}."* "${% Dir %}/${% Item %}"
    fi
done

