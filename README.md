# Spazzy757 Dotfiles

A collection of my local configs

I have tried to keep them as simple as possible but also store some personal
config here that I encrypt with [git-crypt][1]


## IDE

My primary IDE is [NeoVim][2] and all my config can be found in the
[nvim](./nvim) folder

## Shell

I use [Bash][3] for my shell alongside [Bash-IT][4] for customization
all config can be found in [bash](./bash) folder


## To Setup

### Run Setup 

For setup I simply use [stow][5] Ive tested various other tooling and just find
its a lot of overhead to maintain, when stow does what I need

The following are what I run (here just because I always need to look them up)

### Git

```bash
stow -v -R -t ~/ git
```

### Bash

```bash
stow -v -R -t ~/ bash
```

### NeoVim

```bash
stow -v -R -t ~/.config/nvim/ nvim/
```

### Unlock Secrets
This will only work if your GPG key is part of the keychain
```bash
git-crypt unlock
```

[1]: https://github.com/AGWA/git-crypt
[2]: https://neovim.io/
[3]: https://www.gnu.org/software/bash/
[4]: https://github.com/Bash-it/bash-it
[5]: https://www.gnu.org/software/stow/manual/stow.html
