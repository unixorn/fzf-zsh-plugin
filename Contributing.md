# Contributing

**fzf-zsh-commands** is a collection of helper scripts for `fzf` and links to fzf-related articles.

## Contribution Guidelines

### To add a shell function

Submit a pull request
    - Please consider wrapping it in a script in the `bin` directory instead. That makes it easy for users of any shell to use the script, otherwise they'll have to rewrite the function in their own shell, which is unnecessary work.

### To add a helper script

Submit a pull request.

    - Please use `#!/usr/bin/env interpreter` instead of a direct path to the interpreter, this makes it easier for people to use more recent interpreter versions when the ones packaged with their OS (macOS and CentOS, I'm looking at you) are stale.
    - Please _do not_ include a language file extension in the script name unless they are meant to be sourced and not run standalone. No one should have to know if a script was written in bash, python, ruby or whatever language to use a script. Not including file extensions makes it easier to rewrite the script in another language later without having to change every reference to the previous version.

### To remove a script

All of the scripts here were either taken from blog posts, public wikis or had an Open Source license. That said, if you wrote something included here and want it removed, either open an issue to request the removal or submit a pull request.

For each script you add, please:

- Include an entry in the contents section of `README.md` for any scripts in your PRs so authors get their work credited correctly. Please keep the contents section in alphabetical order by script name.
- Include a link to the original source in the contents section and the comments at the beginning of added scripts so people can find their other work.
