#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

nvim +PackerSync
