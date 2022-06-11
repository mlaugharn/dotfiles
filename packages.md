# apt
```
zsh
tmux
neovim
ripgrep
fd-find 
tldr
fzf
build-essential
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
`tmux history-substring-search pyenv fzf`

# oh-my-zsh theme
`aussiegeek`

# cargo install
```
bat
exa
```

# cuda 11.7 (x86_64 ubuntu 22.04)
```
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.7.0/local_installers/cuda-repo-ubuntu2204-11-7-local_11.7.0-515.43.04-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-11-7-local_11.7.0-515.43.04-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-11-7-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda
```
# docker

# nvidia-docker
