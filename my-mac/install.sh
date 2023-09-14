#!/bin/bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo cp ./.zshrc ~/.zshrc
sudo cp parin.zsh-theme ~/.oh-my-zsh/themes
