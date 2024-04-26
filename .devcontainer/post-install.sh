#!/bin/bash
set -ex

# ssh files
cp -r $HOME/.ssh_mounted/* $HOME/.ssh \
&& chmod 400 $HOME/.ssh/id_rsa  #\
# && chmod 755 $HOME/.ssh/config

# zsh files
cp $HOME/.zshrc_mounted $HOME/.zshrc \
&& cp -r $HOME/.oh-my-zsh_mounted/* $HOME/.oh-my-zsh \
&& cp $HOME/.p10k.zsh_mounted $HOME/.p10k.zsh

# Create some aliases
echo 'alias ll="ls -alF"' >> $HOME/.bashrc
echo 'alias la="ls -A"' >> $HOME/.bashrc
echo 'alias l="ls -CF"' >> $HOME/.bashrc

# Convenience workspace directory for later use
WORKSPACE_DIR=$(pwd)

# Change some Poetry settings to better deal with working in a container
poetry config cache-dir ${WORKSPACE_DIR}/.cache
poetry config virtualenvs.in-project true

# Now install all dependencies
poetry install
# Install pre-commit hooks
poetry run pre-commit install
poetry run pre-commit install --hook-type commit-msg

# Init zsh
zsh

echo "Done!"
