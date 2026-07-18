# dotfiles

.files

## Pre-requisites

```
brew install \
    zsh \
    git \
    git-cola \
    tmux \
    eza \
    neovim \
    tree-sitter-cli \
    curl \
    go \
    ripgrep \
    fzf \
    fd \
    starship \
    jesseduffield/lazygit/lazygit \
    jesseduffield/lazydocker/lazydocker
```

Install rustup

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## NeoVim Setup

### Treesitter

`nvim-treesitter` tracks its `main` branch, which requires Neovim 0.12+ and compiles parsers on the fly. This needs the `tree-sitter` CLI, installed via the `tree-sitter-cli` Homebrew formula in the pre-requisites above (note: the `tree-sitter` formula is only the C library, not the CLI). Parsers install automatically on first use; run `:TSUpdate` to update them after upgrading the plugin.

### Install LSPs

Manage packages (like LSPs, linters, formatters) with [Mason](https://github.com/williamboman/mason.nvim). Ensure packages defined in the inside the mason config in `custom/plugins.lua` are installed by running:

```
:MasonInstallAll
```

## Tmux Setup

In a tmux pane, run `<Leader>I` to ask TPM to install all plugins defined in the `.tmux.conf`.
