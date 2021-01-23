#!/usr/bin/env bash
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/lua

# link wholesale
for f in `find . -regex ".*\.vim$\|.*\.lua$"`; do
    rm -rf ~/.config/nvim/$f
    ln $f ~/.config/nvim/$f
done