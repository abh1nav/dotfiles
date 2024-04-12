# dotfiles

.files

## Pre-requisites

```
brew install \
    zsh \
    git \
    git-cola \
    tmux \
    exa \
    neovim \
    curl \
    go \
    ripgrep \
    fzf \
    fd \
    starship
```

Install rustup

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## NeoVim Setup

### Install LSPs

Manage packages (like LSPs, linters, formatters) with [Mason](https://github.com/williamboman/mason.nvim). Ensure packages defined in the inside the mason config in `custom/plugins.lua` are installed by running:

```
:MasonInstallAll
```

## Tmux Setup

In a tmux pane, run `<Leader>I` to ask TPM to install all plugins defined in the `.tmux.conf`.
