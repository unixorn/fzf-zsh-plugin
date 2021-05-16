# fzf-zsh-plugin

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![CircleCI](https://circleci.com/gh/unixorn/fzf-zsh-plugin.svg?style=shield)](https://circleci.com/gh/unixorn/fzf-zsh-plugin)
[![Code Climate](https://codeclimate.com/github/unixorn/fzf-zsh-plugin/badges/gpa.svg)](https://codeclimate.com/github/unixorn/fzf-zsh-plugin)
[![Issue Count](https://codeclimate.com/github/unixorn/fzf-zsh-plugin/badges/issue_count.svg)](https://codeclimate.com/github/unixorn/fzf-zsh-plugin)
[![GitHub stars](https://img.shields.io/github/stars/unixorn/fzf-zsh-plugin.svg)](https://github.com/unixorn/fzf-zsh-plugin/stargazers)

ZSH plugin to enable using [fzf](https://github.com/junegunn/fzf) to search command history and for files.

This will automagically install `fzf` into your home directory if it isn't already there, and bind `^R` to an `fzf`-powered search of your command history.

Used by the [zsh-quickstart-kit](https://github.com/unixorn/zsh-quickstart-kit) to make the default setup have a more 'batteries included' feel.

Yes, there is a plugin baked into oh-my-zsh, this allows easy `fzf` integration for other frameworks, and adds some helper scripts.

## Contents

| Name | Description | Author |
| ---- | ----------- | ------ |
| `chrome-bookmark-browser` | Rummages through your Chrome bookmarks with `fzf` and opens the selected bookmark(s) in your default browser | [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `d-attach` | Uses `fzf` to select `docker` containers to start and attach to. | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `d-image-rm` | Uses `fzf` to select `docker` containers to start and attach to. | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `d-rm` | Uses `fzf` to select `docker` containers to remove. | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `fif` | Uses `fzf` and `rg` to find a term in files | [Boost Your Command Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-brew-cask-install` | Uses `fzf` to select programs to install (or show the home page) based on the output of `brew cask search` | [Boost Your Command Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-brew-cask-uninstall` | Uses `fzf` to select `brew`-installed programs to delete (or show the home page) | [Boost Your Command Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-brew-install` | Uses `fzf` to select programs to install based on the output of `brew search` | [Boost Your Command Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-brew-uninstall` | Uses `fzf` to select `brew`-installed programs to delete | [Boost Your Command Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-brew-update` | Uses `fzf` to select `brew`-installed programs to update | [Boost Your Command Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-find-edit` | Uses `fzf` to select files (displaying previews) to edit with `$EDITOR` | [Boost Your Command Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-grep-edit` | Uses `fzf` to select files (displaying previews) that contain a search term to edit with `$EDITOR` | [Boost Your Command Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-kill` | Uses `fzf` to select processes to kill | [Boost Your Command Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `tm` | Uses `fzf` to search for a `tmux` session or create one if no matches. | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `tmux-search` | Uses `fzf` to select a `tmux` session. Skips `fzf` if there's only one match, exits if no match. | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `vagrant-box-search` | Uses `fzf` to select a `vagrant` box and connect to it with `ssh`. | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |