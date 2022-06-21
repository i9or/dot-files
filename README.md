# dot-files

## Description

* `starship.toml` contains [Starship](https://starship.rs/) prompt configuration. Should be put to `~/.config/` folder.
* `nvim` contains [Neovim](https://neovim.io/) configuration, written in Lua. Should be copied to `~/.config/` folder. Additional manual setup is needed for [Packer](https://github.com/wbthomason/packer.nvim#quickstart) plugin.
<!-- TODO: add the rest of configurations descriptions -->

## Setting up macOS

```sh
brew install ansible awscli cmake curl fd git go htop llvm neovim pinentry-mac ripgrep sqlite starship terraform tree wget
```

## Useful one-lines

Rewrite git history commiter name and email, saving dates:

```sh
git rebase -i --rebase-merges --root --exec 'GIT_COMMITTER_DATE="$(git log -n 1 --format=%aD)" git commit --amend --reset-author --no-edit --date="$(git log -n 1 --format=%aD)"'
```

## Attributions

N/A
