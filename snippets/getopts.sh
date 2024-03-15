function _set_colors {
    S="\e[m";    B="\e[1m";   F="\e[2m";   I="\e[3m";   U="\e[4m"
    R="\e[31m";  G="\e[32m";  Y="\e[33m";  M="\e[35m";  C="\e[36m"
    BR="\e[91m"; BG="\e[92m"; BY="\e[93m"; BM="\e[95m"; BC="\e[96m"
}
[ -t 1 ] && _set_colors

_ARGS=$(getopt -o 'hc::' -l 'help,color::' -- "$@")
_GETOPT_CODE=$?
if [ $_GETOPT_CODE -eq 3 ]; then
    echo "Error during arg parsing" >&2
    exit 1
fi
eval set -- "$_ARGS"

while true; do
    case "$1" in
        '-c'|'--color')
            if [ "$2" = "always" ]; then
                _set_colors
            elif [ "$2" = "never" ]; then
                unset S B F I U R G Y M C BR BG BY BM BC
            fi
            shift 2; continue ;;
        '-h'|'--help')
            _DISPLAY_HELP=${_DISPLAY_HELP:0}
            shift 1; continue ;;
        '--')
            shift 1; break ;;
        *)
            echo -e "${B}${R}ERROR${S}: $1 is not a valid argument" >&2
            _DISPLAY_HELP=1
            shift 1; continue ;;
    esac
done

read -rd '' help_msg <<EOF
{% Program %} v.{% semantic version %}
{% description %}

${B}USAGE${S}:
  {%%}

${B}OPTIONS${S}:
  -h, --help            Shows this message and exits
  -c, --color[=WHEN]    Enables/disables colored output
                        WHEN can be: always, never, auto (auto by default)

${B}EXAMPLES${S}:
  {%%}
EOF

if [ -n "$_DISPLAY_HELP" ]; then
    echo -e "$help_msg"
    exit $_DISPLAY_HELP
fi
