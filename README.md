# fzf-zsh-plugin

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![CircleCI](https://circleci.com/gh/unixorn/fzf-zsh-plugin.svg?style=shield)](https://circleci.com/gh/unixorn/fzf-zsh-plugin)
[![Code Climate](https://codeclimate.com/github/unixorn/fzf-zsh-plugin/badges/gpa.svg)](https://codeclimate.com/github/unixorn/fzf-zsh-plugin)
[![Issue Count](https://codeclimate.com/github/unixorn/fzf-zsh-plugin/badges/issue_count.svg)](https://codeclimate.com/github/unixorn/fzf-zsh-plugin)
[![GitHub stars](https://img.shields.io/github/stars/unixorn/fzf-zsh-plugin.svg)](https://github.com/unixorn/fzf-zsh-plugin/stargazers)

ZSH plugin to enable using `fzf` to search command history and for files.

This will automagically install `fzf` into your home directory if it isn't already there, and bind `^R` to an `fzf`-powered search of your command history. Used by the [zsh-quickstart-kit](https://github.com/unixorn/zsh-quickstart-kit) to make the default setup have a more 'batteries included' feel.