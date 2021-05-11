# Spazzy757 Dotfiles

A collection of my local configs

I have tried to keep them as simple as possible but also store some personal
config here that I encrypt with [git-crypt][1]

## To Setup

### Unlock Secrets
This will only work if your GPG key is part of the keychain
```bash
git-crypt unlock
```

### Run Setup 

This will install all the required configurations into your home directory

*Note:* For MAC this will also install brew and run brew bundle
```bash
scripts/setup.sh
```

[1]: https://github.com/AGWA/git-crypt

