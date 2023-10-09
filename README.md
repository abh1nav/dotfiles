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
    fd 
```

Install rustup

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## NeoVim Setup

### Syntax highlighting

Use [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting. To install highlighters, inside neovim run:

```
:TSInstall cmake csv dockerfile git_config gitignore go gomod gosum html http javascript json make markdown markdown_inline proto python scss sql ssh_config svelte terraform toml tsv typescript vim yaml
```

### Install LSPs

Manage packages (like LSPs, linters, formatters) with [Mason](https://github.com/williamboman/mason.nvim). Ensure packages defined in the inside the mason config in `custom/plugins.lua` are installed by running:

```
:MasonInstallAll
```

To find a symbol definition, press `g d` when your cursor is on the symbol.

### Install go formatters

```
go install github.com/incu6us/goimports-reviser/v3@latest
go install github.com/segmentio/golines@latest
```

### Link the custom lua scripts

```
cd ~/.config/nvim/lua
rm -Rf custom
ln -s $HOME/.dotfiles/nvim/lua/custom
```

### NvChad key bindings

#### Change theme
```
<Space> t h
```

#### Find files
```
<Space> f f
```

#### Find buffer
```
<Space> f b
```

#### Close buffer
```
<Space> x
```

#### Live grep
```
<Space> f w
```

#### Switch between buffers
```
<Tab>
```

