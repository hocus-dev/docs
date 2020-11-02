# Installation

> **Command Line Notation**
>
> In this chapter and throughout the book, we’ll show some commands used in the
> terminal. Lines that you should enter in a terminal all start with `$`. You
> don’t need to type in the `$` character; it indicates the start of each
> command.

## Prerequisites

Make sure you have installed recent versions of:

- git
- docker
- docker-compose
- VSCode
- the `ms-vscode-remote.remote-containers` extension for VSCode

## With curl

The easiest way to install `hocus` is to just run:

```bash
$ export SHELL && curl -sSL https://hocus.dev/install.sh | sh
```

## Building from source

Alternatively, you may also build `hocus` from source. Make sure you have a recent stable
[Rust](https://www.rust-lang.org/) toolchain installed and run:

```bash
$ cargo install --git https://github.com/hocus-dev/cli
```
