export PATH="$HOME/.local/bin:$PATH"

# pyenv autoinstaller
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# idiosyncrasy of installing fd with apt
# ln -s $(which fdfind) ~/.local/bin/fd
alias fd=fdfind
