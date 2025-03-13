#!/bin/sh

config_dir="$HOME/.config"
dotfiles_dir="$HOME/dotfiles"

dirs="zellij nvim bspwm sxhkd polybar alacritty rofi gtk-3.0"

for dir in $dirs; do
    ln -s "$dotfiles_dir/$dir" "$config_dir"
done
