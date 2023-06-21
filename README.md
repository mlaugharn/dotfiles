# dotfiles

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
exa
curl
vim
parallel
```

# pyenv
`curl https://pyenv.run | bash`

# new pyenv shared venv 
`export PYTHON_CONFIGURE_OPTS='--enable-shared' pyenv virtualenv <prev venv> <new venv>`

# rustup 
`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

# oh-my-zsh
`sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

# oh-my-zsh plugins
`tmux history-substring-search pyenv fzf vi-mode`

# oh-my-zsh theme
`aussiegeek`

# cargo install
```
bat
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

# fzf zsh autocomplete + ctrl-r
`dpkg -L fzf | grep zsh | parallel 'echo source {}' >> ~/.zshrc`

# [conda zsh autocompletion](https://stackoverflow.com/a/57793510)
`git clone https://github.com/esc/conda-zsh-completion`

at start (before ohmyzsh):
`fpath+=/path/to/where/you/installed/conda-zsh-completion`

after ohmyzsh:
`compinit conda`

# faster aussiegeek
`git config --add oh-my-zsh.hide-dirty 1`

# don't use nvm zsh integration - very slow!!
