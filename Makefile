SHELL := bash
.ONESHELL:
.DELETE_ON_ERROR:
.SHELLFLAGS := -Eeuo pipefail -c
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

all: setup

symlink:
> @ .symlink .nvimfiles .config/nvim

.PHONY: symlink

packer/sync:
> @ ~/.nvimfiles/scripts/nvim_packer_setup.sh

.PHONY: packer/sync

setup: symlink packer/sync

.PHONY: setup
