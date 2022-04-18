# fzf-zsh-plugin

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![Awesomebot](https://github.com/unixorn/fzf-zsh-plugin/actions/workflows/awesomebot.yml/badge.svg)
![Superlinter](https://github.com/unixorn/fzf-zsh-plugin/actions/workflows/superlinter.yml/badge.svg)
[![Code Climate](https://codeclimate.com/github/unixorn/fzf-zsh-plugin/badges/gpa.svg)](https://codeclimate.com/github/unixorn/fzf-zsh-plugin)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Contents](#contents)
- [Installing](#installing)
  - [Zgenom](#zgenom)
  - [Antigen](#antigen)
  - [Oh-My-Zsh](#oh-my-zsh)
  - [Without using a framework](#without-using-a-framework)
  - [(optional) Install recommended tools](#optional-install-recommended-tools)
- [Customization](#customization)
  - [A note on `lessfilter-fzf`](#a-note-on-lessfilter-fzf)
- [Other FZF resources](#other-fzf-resources)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

This ZSH plugin enables using [fzf](https://github.com/junegunn/fzf) to search your command history and do file searches.

It will automagically install `fzf` into your home directory if it isn't already there, and bind `^R` to an `fzf`-powered search of your command history.

Created for the [zsh-quickstart-kit](https://github.com/unixorn/zsh-quickstart-kit) to make the default setup have a more 'batteries included' feel.

Yes, there is a plugin baked into [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh), this allows easy `fzf` integration for other frameworks and shells, and adds some helper scripts.

Note - while these scripts could all be ZSH functions instead of scripts in the `bin` directory, it uses standalone scripts so that non-ZSH users can also use the repository by adding its `bin` directory to their `$PATH`.

## Contents

| Name | Description | Author |
| ---- | ----------- | ------ |
| `asdf-install` | Install one or more versions of the specified language with `fzf` and installs your selection with `asdf` | [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `asdf-uninstall` | Select one or more versions of the specified language with `fzf` and uninstalls your selection with `asdf` | [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `chrome-bookmark-browser` | Rummages through your Chrome bookmarks with `fzf` and opens the selected bookmark(s) in your default browser | [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `d-attach` | Uses `fzf` to select `docker` containers to start and attach to. | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `d-image-rm` | Uses `fzf` to select `docker` images to remove. | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `d-rm` | Uses `fzf` to select `docker` containers to remove. | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `d-stop-container` | Stop a Docker container. | |
| `falias` | Searches your ZSH aliases, then puts your selection on the mac clipboard (macOS only) | |
| `fif` | Uses `fzf` and `rg` to find a term in files | [Boost Your Command-Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-brew-cask-install` | Uses `fzf` to select programs to install (or show the home page) based on the output of `brew cask search` | [Boost Your Command-Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-brew-cask-uninstall` | Uses `fzf` to select `brew`-installed programs to delete (or show the home page) | [Boost Your Command-Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-brew-install` | Uses `fzf` to select programs to install based on the output of `brew search` | [Boost Your Command-Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-brew-uninstall` | Uses `fzf` to select `brew`-installed programs to delete | [Boost Your Command-Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-brew-update` | Uses `fzf` to select `brew`-installed programs to update | [Boost Your Command-Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-find-edit` | Uses `fzf` to select files (displaying previews) to edit with `$EDITOR` | [Boost Your Command-Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-git-branch` | Uses `fzf` to select a branch name in a `git` repository for use in scripts | From Mark Nielsen's [Fuzzy Git Checkout](https://polothy.github.io/post/2019-08-19-fzf-git-checkout/) article |
| `fzf-git-checkout` | Uses `fzf` to check out a branch in a `git` repository | From Mark Nielsen's [Fuzzy Git Checkout](https://polothy.github.io/post/2019-08-19-fzf-git-checkout/) article |
| `fzf-grep-edit` | Uses `fzf` to select files (displaying previews) that contain a search term to edit with `$EDITOR` | [Boost Your Command-Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `fzf-kill` | Uses `fzf` to select processes to kill | [Boost Your Command-Line Productivity With Fuzzy Finder](https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d) |
| `lessfilter-fzf` | A less pre-processor to nicely display a wide range of file formats, including images and directories that can be used to show fzf previews (see [Customization](#customization) section). | [Aloxaf/fzf-tab - Wiki/Preview](https://github.com/Aloxaf/fzf-tab/wiki/Preview) |
| `pr-list` | Use `fzf` to select a PR using `gh` | ? |
| `tm` | Uses `fzf` to search for a `tmux` session or create one if there are no matches. | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `tmux-kill` | Uses `fzf` to select a `tmux` session and kill it. | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `tmux-search` | Uses `fzf` to select a `tmux` session. Skips `fzf` if there's only one match, exits if no match. | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |
| `vagrant-box-search` | Uses `fzf` to select a `vagrant` box and connect to it with `ssh`. | From the [fzf wiki](https://github.com/junegunn/fzf/wiki/examples) |

## Installing

You should set this plugin to be last, or near to last in your framework's list of plugins to load. It dynamically generates `$FZF_DEFAULT_OPT` and `$FZF_DEFAULT_COMMAND` based on whether it sees things like `rg` and `bat` in your `$PATH`, so it should come after other plugins have had a chance to extend your `$PATH`.

### [Zgenom](https://github.com/jandamm/zgenom)

Add `zgenom load unixorn/fzf-zsh-plugin` to your `.zshrc` with your other load commands.

### [Antigen](https://github.com/zsh-users/antigen)

Add `antigen bundle unixorn/fzf-zsh-plugin@main` to your `.zshrc`

☝  **Note** that until <https://github.com/zsh-users/antigen/issues/717> gets fixed in Antigen, it only recognizes plugins in `master` branch. So you need to explicitly specify `@main` here.

### [Oh-My-Zsh](http://ohmyz.sh/)

1. `git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin`
2. Add **fzf-zsh-plugin** to your plugin list - edit `~.zshrc` and change `plugins=(...)` to `plugins=(... fzf-zsh-plugin)`

### Without using a framework

1. `git clone git@github.com:unixorn/fzf-zsh-plugin.git`, then add its `bin` directory to your `$PATH`.
2. Add `source /path/to/repository/checkout/fzf-zsh-plugin.plugin.zsh` to your `.zshrc` file.

The scripts in this collection don't actually require you to be using ZSH as your login shell, they're being distributed as an [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)-compatible plugin because it's convenient for me.

### (optional) Install recommended tools

Optionally, to make the most out of `fzf` preview (`?` toggle), install the following tools and enable the advanced preview (see [Customization](#customization) section):
- `exa` - improved file/directory listing,
- `bat` - a `cat` clone with syntax highlighting and Git integration,
- `chafa` - show images (the image can look better or worse depending on the terminal app you use),
- `exiftool` - also show image metadata,
- `lesspipe.sh`, e.g. `brew install lesspipe` - and other optional tools `lesspipe.sh` relies on. See <https://github.com/wofr06/lesspipe>  
  ☝ **Note**: This is not the `lesspipe` already bundled in Ubuntu/Debian but an improved one (while package is called `lesspipe`, the binary is `lesspipe.sh`).

## Customization

You can customize a few features by exporting the following environment variables in your init script (`.zshrc`/`.bashrc` or similar):

| Export variable                    | Description                                                                                                                                                                                                                                                                                  |
| ---------------------------------- |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `export FZF_PREVIEW_ADVANCED=true` | Use `less` viewer with a pre-processor to display improved previews for a wide range of files (requires you to install at least `exa`, `bat`, `chafa`, `exiftool`; and very recommended `lesspipe.sh` and the tools it uses underneath: `mdcat`, `in2csv`,...). _This is an opt-in feature._ |
| `export FZF_PREVIEW_WINDOW=''`     | Set any value supported by `fzf --preview-window` option, e.g. `right:65%:nohidden` will show the preview by default.                                                                                                                                                                        |
| `export FZF_PATH=''`               | Path to install fzf binary and script, e.g. `${HOME}/.config/fzf`.                                                                            |

### A note on `lessfilter-fzf`

You can also use it as a general `less` preprocessor to extend the `less` capabilities. To do that, place the following in your shell init scripts (`.zshrc`/`.bashrc` or equivalent):

```shell
export LESSOPEN='| lessfilter-fzf %s'
```

Ultimately, `lesspipe.sh` (if present) will still honor your own `lessfilter` if found in your `PATH`, leading to the following execution: `lessfilter-fzf > lesspipe.sh > lessfilter`.

## Other FZF resources

- [Fuzzy Git Checkout](https://polothy.github.io/post/2019-08-19-fzf-git-checkout/) - Mark Nielsen wrote a good blog post showing how to use [fzf](https://github.com/junegunn/fzf) for `git` checkouts.
- [fzf-pass](https://github.com/smeagol74/zsh-fzf-pass) - ZSH plugin that uses [fzf](https://github.com/junegunn/fzf) and [pass](https://www.passwordstore.org/) for better password handling.
- [fzf-tab](https://github.com/Aloxaf/fzf-tab) - Replace ZSH's default completion with [fzf](https://github.com/junegunn/fzf)
