#!/bin/bash

# Neovim: install plugins

REQUIREMENTS=(
  nvim
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT" --HEAD
done

# non-interactive
# nvim --headless +'PackerSync' +qa

# interactive
nvim +PackerSync

