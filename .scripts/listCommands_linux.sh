#!/usr/bin/env sh
script_dir=$(dirname "$0")
parent_folder=$(dirname "$script_dir")
cd "$parent_folder" || exit 1

red_bold=''
reset=''
if [ -t 1 ]; then
    red_bold=$(printf '\033[1;31m')
    reset=$(printf '\033[0m')
fi

if command -v column >/dev/null 2>&1; then
    use_column=true
else
    use_column=false
fi

for file in ./*; do
    [ -f "$file" ] || continue
    name=${file#./}
    case "$name" in
        *.*) continue ;;
    esac
    IFS= read -r first_line < "$file"
    case "$first_line" in
        \#*\#*)
            arguments=${first_line#\#}
            arguments=${arguments%%\#*}
            description=${first_line#*\#}
            description=${description#*\#}
            arguments=${arguments# }
            description=${description# }
            ;;
        *)
            arguments=''
            description="${red_bold}*** MISSING DESCRIPTION ***${reset}"
            ;;
    esac
    printf '%s\t%s\t%s\n' "$name" "$arguments" "$description"
done | if "$use_column"; then
    column -t -s "$(printf '\t')" -o "$(printf '\t')"
else
    cat
fi
