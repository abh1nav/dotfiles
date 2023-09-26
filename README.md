# dotfiles

.files

## Pre-requisites

```
brew install zsh git git-cola tmux exa neovim curl go ripgrep
```

## NeoVim Setup

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

#### Find in files
```
<Space> f w
```

#### Switch between buffers
```
<Tab>
```

### Syntax highlighting

Use [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting. To install highlighters, inside neovim run:

```
:TSInstall cmake csv dockerfile git_config gitignore go gomod gosum html http javascript json make markdown markdown_inline proto python scss sql ssh_config svelte terraform toml tsv typescript vim yaml
```

### Install Gopls

Manage packages (like LSPs, linters, formatters) with [Mason](https://github.com/williamboman/mason.nvim). Ensure packages defined in the inside the mason config in `custom/plugins.lua` are installed by running:

```
:MasonInstallAll
```

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

