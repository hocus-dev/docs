install() {
    set -e

    UNSUPPORTED_OS_MSG="
We don't seem to provide prebuilt binaries for this OS.
To install hocus, try building it from source.

Check out https://hocus.dev/installation.html for more information.
"
    POST_INSTALLATION_MSG="
Hocus has been installed.
To verify the installation was successful, restart your shell and run

$ hocus

If it was not, please ensure that $HOME/bin is in PATH and that $HOME/bin/hocus exists.
"

    case "$(uname -a)" in
        *"Darwin"* ) FILENAME="hocus-macos-x86_64" && PLATFORM="macos";;
        *"GNU/Linux"* ) FILENAME="hocus-linux-x86_64-gnu" && PLATFORM="linux";;
        * ) echo "$UNSUPPORTED_OS_MSG" && return 1;;
    esac

    echo "Downloading hocus..."

    mkdir -p "$HOME/bin"
    DOWNLOAD_LINK="https://github.com/hocus-dev/cli/releases/latest/download/$FILENAME"
    OUTPUT_LOCATION="$HOME/bin/hocus"
    curl -sSL "$DOWNLOAD_LINK" --output "$OUTPUT_LOCATION"
    chmod +x "$OUTPUT_LOCATION"

    if [ ":$PATH:" != *":$HOME/bin:"* ]; then
        PATH_SNIPPET='export PATH="$PATH:$HOME/bin"'
        
        case "$SHELL" in
            *"/bash"* ) SHELL_NAME="bash";;
            *"/zsh"* ) SHELL_NAME="zsh";;
            * ) SHELL_NAME="unknown" ;;
        esac

        if [ "$SHELL_NAME" = "bash" ] && [ $PLATFORM = "linux" ]; then
            echo "$PATH_SNIPPET" >> "$HOME/.bashrc"
        elif [ "$SHELL_NAME" = "bash" ] && [ $PLATFORM = "macos" ]; then
            echo "$PATH_SNIPPET" >> "$HOME/.bash_profile"
        elif [ "$SHELL_NAME" = "zsh" ]; then
            echo "$PATH_SNIPPET" >> "$HOME/.zshrc"
        else
            echo "Unsupported default shell; please add '$HOME/bin' to PATH yourself."
        fi
    fi

    echo "$POST_INSTALLATION_MSG"
}

install
