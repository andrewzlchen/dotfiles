## My Dotfiles

This repository is a collection of my various scripts and configs (mostly neovim) that I use in my day-to-day.

## TODO

- Create a mapping that opens up Telescope with a list of commits. It should pipe the selection into the following command: 
    - `git rebase -i <selected commit>`
- Fix tab when hitting tab on nothing
    - Currently freezes vim; it probably has something to do with the `tab_completion` function
