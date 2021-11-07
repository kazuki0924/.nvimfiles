#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

declare -r PACKER_REPO="https://github.com/wbthomason/packer.nvim"
declare -r DIST="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

[[ ! -d $DIST ]] && git clone "$PACKER_REPO" "$DIST"
