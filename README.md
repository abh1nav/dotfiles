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
    warp
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

To find a symbol definition, press `g d` when your cursor is on the symbol.

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

