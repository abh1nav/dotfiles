# dotfiles

.files

## Pre-requisites

```
brew install zsh git git-cola tmux exa neovim curl go
```

## NeoVim Setup

### Pick theme

```
<Space> t h
```

### Install language parser

Inside neovim:

```
:TSInstall cmake csv dockerfile git_config gitignore go gomod gosum html http javascript json make markdown markdown_inline proto python scss sql ssh_config svelte terraform toml tsv typescript vim yaml
```

### Install Gopls

Inside neovim:

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
