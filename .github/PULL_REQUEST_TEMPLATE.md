<!--- Provide a general summary of your changes in the Title above -->

# Description

<!--- Describe your changes in detail -->

# Checklist

<!--- Go over all the following points, and put an `x` in all the boxes that apply. [x] -->
<!--- If you're unsure about any of these, don't hesitate to ask. I'm happy to help! -->

- [ ] All new and existing tests pass.
- [ ] Rather than adding functions to `fzf-zsh-plugin.zsh`, I have created standalone scripts in bin so they can be used by non-ZSH users too.
- [ ] Any scripts added use `#!/usr/bin/env interpreter` instead of potentially platform-specific direct paths (`#!/bin/sh` is an ok exception)
- [ ] Scripts are marked executable
- [ ] Scripts _do not_ have a language file extension unless they are meant to be sourced and not run standalone. No one should have to know if a script was written in bash, python, ruby or whatever. Not including file extensions makes it easier to rewrite the script in another language later without having to change every reference to the previous version.
- [ ] I have confirmed that the link(s) in my PR are valid.
- [ ] I have read the **CONTRIBUTING** document.

# License Acceptance

- [ ] This repository is Apache version 2.0 licensed (some scripts may have alternate licensing inline in their code) and by making this PR, I am contributing my changes to the repository under the terms of the Apache 2 license.
