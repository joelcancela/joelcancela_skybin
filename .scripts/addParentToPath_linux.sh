#!/usr/bin/env bash
scriptFolder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
parentFolder="$(dirname "$scriptFolder")"
binFolder="$parentFolder/.bin"

# Pick the rc file actually loaded by the current shell (zsh on macOS by default,
# bash login shells on macOS read .bash_profile instead of .bashrc).
case "$(basename "${SHELL:-}")" in
    zsh)
        rcFile="${HOME}/.zshrc"
        ;;
    bash)
        if [[ "$OSTYPE" == "darwin"* ]]; then
            rcFile="${HOME}/.bash_profile"
        else
            rcFile="${HOME}/.bashrc"
        fi
        ;;
    *)
        rcFile="${HOME}/.bashrc"
        ;;
esac

for folder in "$parentFolder" "$binFolder"; do
    case ":$PATH:" in
        *":$folder:"*)
            echo "'$folder' is already in PATH."
            ;;
        *)
            if grep -qF "$folder" "$rcFile" 2>/dev/null; then
                echo "'$folder' is already referenced in $rcFile. Run 'source $rcFile' to apply it."
            else
                echo "export PATH=\"\$PATH:$folder\"" >> "$rcFile"
                export PATH="$PATH:$folder"
                echo "Added '$folder' to PATH in $rcFile. Restart your shell or run 'source $rcFile' for changes to take effect."
            fi
            ;;
    esac
done
