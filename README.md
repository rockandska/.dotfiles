# .Dotfiles bootstrap

## Requirements:

- git
- wget
- perl

## Repositories used to bootstrap by default:

- **myrepos:**
    - git://myrepos.branchable.com/.git
- **cpanm:**
    - https://github.com/miyagawa/cpanminus
- **my personal dotfiles:**
    - https://github.com/rockandska/.dotfiles

## Install with git :

- Call the bootstrap scriptwith default values
```
$ wget -O - https://raw.githubusercontent.com/rockandska/.dotfiles/master/.config/myrepos/bootstrap.sh \
| bash
```

**If needed you can call this script with your own config files (positional parameters for now):**
- remote .mrconfig
- remote perl config file
- remote dotfiles repository url
- branch to used for dotfiles repository

```
$ wget -O - https://raw.githubusercontent.com/rockandska/.dotfiles/dev/.config/myrepos/bootstrap.sh \
| bash /dev/stdin \
https://raw.githubusercontent.com/rockandska/.dotfiles/dev/.mrconfig \
https://raw.githubusercontent.com/rockandska/.dotfiles/dev/.config/bash/conf.d/00perl.sh \
https://github.com/rockandska/.dotfiles \
dev
```

## Workflow of ```bootstrap.sh``` :

---
- download myrepos repository into a tmp directory
- use the tmp myrepos downloaded to bootstrap the remote .mrconfig
- .mrconfig actions done:
    - download myrepos repository
        - install myrepos
    - download cpanm repository
        - install cpanm
        - install IO:Scalar
        - install stow
    - install default dotfiles repository
        - backup files that will be stowed
        - apply dotfiles with stow
- use the new myrepos to checkout new repositories coming from my dotfiles
- done

## **Launch a new terminal, we should now have a working base environment**
