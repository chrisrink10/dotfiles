#!/usr/bin/env sh

if ! command -v brew &> /dev/null
then
    while true; do
        read -p "brew could not be found. Install? (Y/n) " yn
        case $yn in
            [Yy]* ) /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";;
            [Nn]* ) exit 0;;
            * ) echo "Please answer (Y/n).";;
        esac
    done
fi

echo "Installing dependencies..."
brew update
brew install direnv \
     fzf \
     pyenv \
     python3 \
     stow

brew install --cask aws-vault

if ! command -v poetry &> /dev/null
then
    while true; do
        read -p "poetry could not be found. Install? (Y/n) " yn
        case $yn in
            [Yy]* ) curl -sSL https://install.python-poetry.org | python3 -;;
            [Nn]* ) break;;
            * ) echo "Please answer (Y/n).";;
        esac
    done
fi

if ! command -v sdk &> /dev/null
then
    while true; do
        read -p "sdkman could not be found. Install? (Y/n) " yn
        case $yn in
            [Yy]* ) curl -s "https://get.sdkman.io" | bash;;
            [Nn]* ) break;;
            * ) echo "Please answer (Y/n).";;
        esac
    done
fi

if ! command -v nvm &> /dev/null
then
    while true; do
        read -p "nvm could not be found. Install? (Y/n) " yn
        case $yn in
            [Yy]* ) PROFILE=/dev/null curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash;;
            [Nn]* ) break;;
            * ) echo "Please answer (Y/n).";;
        esac
    done
fi
