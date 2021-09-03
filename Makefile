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

git/pull:
> @ echo git pull .nvimfiles:
> @ [[ ! -d ~/.nvimfiles ]] && git clone https://github.com/kazuki0924/.nvimfiles ~/.nvimfiles
> @ cd ~/.nvimfiles && git pull

symlink:
> @ ~/.dotscripts/tasks/symlink.sh .nvimfiles .config/nvim

setup: git/pull symlink

.PHONY: git/pull symlink setup
