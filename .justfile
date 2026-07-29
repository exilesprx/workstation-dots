set shell := ["bash", "-c"]
set ignore-comments

target := "$HOME"

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
