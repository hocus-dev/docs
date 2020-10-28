# Installation

## Prerequisites

Make sure you have installed recent versions of:

- git
- docker
- docker-compose
- VSCode
- the ms-vscode-remote.remote-containers extension for VSCode

## With curl

The easiest way to install Hocus is to just run:

```bash
export SHELL && curl -sSL https://hocus.dev/install.sh | sh
```

## Building from source

Alternatively, you may also build Hocus from source. Make sure you have a recent stable
[Rust](https://www.rust-lang.org/) toolchain installed and run:

```bash
cargo install --git https://github.com/hocus-dev/cli
```
