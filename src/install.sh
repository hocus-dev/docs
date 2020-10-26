install() {
    set -e

    UNSUPPORTED_OS_MSG="
We don't seem to provide prebuilt binaries for this OS.
To install hocus, try building it from source.

Check out https://hocus.dev/installation.html for more information.
"
    POST_INSTALLATION_MSG="
Hocus has been installed.
To verify the installation was successful, restart your shell or run

$ source ~/.profile

and then run

$ hocus

If it was not, please ensure that $HOME/bin is in PATH and that $HOME/bin/hocus exists.
"

    case "$(uname -a)" in
        *"Darwin"* ) FILENAME="hocus-macos-x86_64";;
        *"GNU/Linux"* ) FILENAME="hocus-linux-x86_64-gnu";;
        * ) echo "$UNSUPPORTED_OS_MSG" && return 1;;
    esac

    echo "Downloading hocus..."

    mkdir -p "$HOME/bin"
    DOWNLOAD_LINK="https://github.com/hocus-dev/cli/releases/latest/download/$FILENAME"
    OUTPUT_LOCATION="$HOME/bin/hocus"
    curl -sSL "$DOWNLOAD_LINK" --output "$OUTPUT_LOCATION"
    chmod +x "$OUTPUT_LOCATION"

    if [ ":$PATH:" != *":$HOME/bin:"* ]; then
        echo 'export PATH="$PATH:$HOME/bin"' >> "$HOME/.profile"
    fi

    echo "$POST_INSTALLATION_MSG"
}

install
