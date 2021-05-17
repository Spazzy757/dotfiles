# Spazzy757 Dotfiles

A collection of my local configs

I have tried to keep them as simple as possible but also store some personal
config here that I encrypt with [git-crypt][1]


*Note*: Currently trying out [Comtrya][2] to
handle system setups and symlinks

## To Setup

### Run Setup 

#### For Mac

```bash
scripts/setup_macos.sh
```

### Unlock Secrets
This will only work if your GPG key is part of the keychain
```bash
git-crypt unlock
```

## Create/Update Symlinks

```bash
scripts/update_symlinks.sh
```

[1]: https://github.com/AGWA/git-crypt
[2]: https://github.com/comtrya/comtrya
