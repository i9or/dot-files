# dot-files

## Description

* `starship.toml` contains [Starship](https://starship.rs/) prompt configuration. Should be put to `~/.config/` folder.
<!-- TODO: add the rest of configurations descriptions -->

## Setting up Linux

Install packages:

```sh
sudo apt-get install build-essential curl wget cmake git vim sqlite3 tree vim-gtk3
```

Setup Git:

```sh
./setup-git-unix.sh
```

## Setting up macOS

Install packages:

```sh
brew install ansible awscli cmake curl fd git go htop llvm pinentry-mac ripgrep sqlite starship terraform tree wget macvim
```

Setup Git:

```sh
./setup-git-unix.sh
```

## Setting up Windows

Setup Git:

```powershell
.\setup-git-windows.ps1
```

## Useful one-lines

Rewrite git history commiter name and email, saving dates:

```sh
git rebase -i --rebase-merges --root --exec 'GIT_COMMITTER_DATE="$(git log -n 1 --format=%aD)" git commit --amend --reset-author --no-edit --date="$(git log -n 1 --format=%aD)"'
```

## Attributions

* Terminal.app theme is a modified Iceberg theme by https://github.com/cocopon/iceberg.vim
