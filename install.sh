#!/usr/bin/env bash

# This script is intended to be run by regular user with sudo privileges.
# Run on a fresh Arch installation

# Function to install packages from the list
install_yay() {
  # Check if yay is installed
  if ! command -v yay &>/dev/null; then
    echo "yay not found. Installing yay..."
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
  else
    echo "yay is already installed."
  fi
}

install_packages() {
  if [[ -f packages ]]; then
    echo "Installing packages from 'packages' file..."
    yay -S --noconfirm - <packages
  else
    echo "'packages' file not found. Please ensure it's in the same directory."
    exit 1
  fi
}

# Function to clone dotfiles
clone_dotfiles() {
  NVIM_CONFIG="$HOME/.config/nvim"

  if [[ -d "$NVIM_CONFIG" ]]; then
    echo "Neovim configuration directory already exists."
  else
    echo "Cloning Neovim config..."
    gh repo clone m1kkY8/nvimrc "$NVIM_CONFIG"
  fi
}

# Function to run stow for dotfile management
manage_dotfiles() {
  if [[ -d "$HOME/dotfiles" ]]; then
    cd "$HOME/dotfiles" || exit
    echo "Running stow to manage dotfiles..."
    stow . --adopt
  else
    echo "Dotfiles directory not found at '$HOME/dotfiles'. Please ensure your dotfiles are correctly cloned."
    exit 1
  fi
}

# Function to setup keyd
setup_keyd() {
  echo "Enabling and starting keyd service..."
  sudo systemctl enable keyd
  sudo systemctl start keyd
}

setup_docker() {
  sudo groupadd docker
  echo "Adding user to docker group..."
  sudo usermod -aG docker "$USER"
  echo "Enabling and starting docker service..."
  sudo systemctl enable docker
  sudo systemctl start docker
}

enable_sddm() {
  echo "Enabling and starting sddm service..."
  sudo systemctl enable sddm
  sudo systemctl start sddm
}

install_tmux_plugin_manager() {
  echo "Installing tmux plugin manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}
# Main execution
main() {
  install_yay
  install_packages
  clone_dotfiles
  manage_dotfiles
  setup_keyd
  setup_docker
  enable_sddm
  install_tmux_plugin_manager
}

# Check if the OS is Arch Linux
if [[ -f /etc/arch-release ]]; then
  main
else
  echo "This script is intended for Arch Linux only."
  exit 1
fi
