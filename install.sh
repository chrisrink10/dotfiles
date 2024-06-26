#!/usr/bin/env sh

while true; do
    read -p "Enter your default Git user email: " git_user_email
    if [ ! -z "$git_user_email" ]; then
        git config -f "$HOME/.gitconfig.local" --add user.email "$git_user_email"
        break
    fi
done

if ! command -v brew &> /dev/null
then
    while true; do
        read -p "brew could not be found. Install? (Y/n) " yn
        case $yn in
            [Yy]* ) /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; break;;
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
            [Yy]* ) curl -sSL https://install.python-poetry.org | python3 -; break;;
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
            [Yy]* ) curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | PROFILE=/dev/null bash; break;;
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
            [Yy]* ) curl -s "https://get.sdkman.io" | bash; break;;
            [Nn]* ) break;;
            * ) echo "Please answer (Y/n).";;
        esac
    done
fi
