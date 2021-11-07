#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

RES="$(nvim -c +TSInstall yaml)"

echo $RES
