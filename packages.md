# apt
```
zsh
tmux
neovim
ripgrep
fd-find 
tldr
fzf
```

# zshrc
```
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

ln -s $(which fdfind) ~/.local/bin/fd
alias fd=fdfind
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
```


# pyenv
`curl https://pyenv.run | bash`

# rustup 
`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

# oh-my-zsh
`sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

# oh-my-zsh plugins
tmux history-substring-search pyenv fzf

# oh-my-zsh theme
aussiegeek

# via cargo
bat # better cat
exa # better ls
procs 


# docker

# nvidia-docker
