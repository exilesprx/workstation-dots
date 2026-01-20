set shell := ["bash", "-c"]
set ignore-comments

target := "$HOME"
packages := "nvim git zsh alacritty bat starship eza lazygit delta lsd zellij btop go ssh wallpapers zim"

default: help

help:
  @echo "Commands to stow and unstow dotfiles"

# Using the --adopt flag to avoid conflicts with existing files
# Any existing files will be adopted into the package and when
# used with git, allows a comparison inside the stow package
# which the differences can either be kept or discarded.

stow package:
  stow -v --adopt --target={{target}} {{package}}

[confirm('Are you sure you want to unstow the package? y/n')]
unstow package:
  stow -v --delete --target={{target}} {{package}}

[confirm('Are you sure you want to stow all packages? y/n')]
stow-all:
  #!/bin/bash
  for pkg in {{packages}}; do
    just stow $pkg
  done

[confirm('Are you sure you want to unstow all packages? y/n')]
unstow-all:
  #!/bin/bash
  for pkg in {{packages}}; do
    just unstow $pkg
  done

# Via doesn't work with a symlink, so copy the file
# to the udev rules directory
enable-via:
  [ "$(id -u)" -eq 0 ] || { echo "Must be run as root"; exit 1; }
  cp via/99-via.rules /etc/udev/rules.d/99-via.rules
  udevadm control --reload-rules
  udevadm trigger

disable-via:
  [ "$(id -u)" -eq 0 ] || { echo "Must be run as root"; exit 1; }
  rm /etc/udev/rules.d/99-via.rules
  udevadm control --reload-rules
  udevadm trigger
