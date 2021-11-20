# dot-files

## Useful one-lines

Rewrite git history commiter name and email, saving dates:

```sh
git rebase -i --rebase-merges --root --exec 'GIT_COMMITTER_DATE="$(git log -n 1 --format=%aD)" git commit --amend --reset-author --no-edit --date="$(git log -n 1 --format=%aD)"'
```

## Attributions

* `Grape.terminal` theme for macOS Terminal.app is slightly changed one from the [lysyi3m/macos-terminal-themes](https://github.com/lysyi3m/macos-terminal-themes) repository.
