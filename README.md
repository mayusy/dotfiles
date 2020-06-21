# dotfiles
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fmayusy%2Fdotfiles.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fmayusy%2Fdotfiles?ref=badge_shield)

----
mayusy's dotfiles  
Fullstack Develop Environment in Docker

## Description

- neovim (https://neovim.io)
  - vim-plug (https://github.com/junegunn/vim-plug)
  - vim-lsp (https://github.com/prabirshrestha/vim-lsp)
  - python3 deoplete dependency
  - language
    - Go
    - Rust
    - Nim
    - Python
    - C / C++
    - Ruby
    - JavaScript
    - HTML CSS
- zsh
  - zplug (https://github.com/zplug/zplug)
- tmux
- git
  - gitconfig
  - gitignore
  - gitattributes

## Requirements
- ghq
- make
- docker
- bash/zsh

## Install
```shell
# I recommend use ghq instead of git command
git config --global ghq.root $HOME/go/src
ghq get mayusy/dotfiles
cd $HOME/go/src/github.com/mayusy/dotfiles
make $SHELL
```

## Contribution
1. Fork it ( http://github.com/mayusy/dotfiles/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## Author

[mayusy](https://github.com/mayusy)


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fmayusy%2Fdotfiles.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fmayusy%2Fdotfiles?ref=badge_large)
