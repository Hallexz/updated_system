#!/bin/bash

echo "Starting system update..."

echo "Updating package list..."
sudo pacman -Sy
if [ $? -eq 0 ]; then
    echo "Package list successfully updated!"
else
    echo "Error updating package list!"
    exit 1
fi

echo "Installing available updates..."
sudo pacman -Su --noconfirm
if [ $? -eq 0 ]; then
    echo "Available updates successfully installed!"
else
    echo "Error installing available updates!"
    exit 1
fi

echo "Removing unnecessary packages..."
sudo pacman -Rns $(pacman -Qdtq)
if [ $? -eq 0 ]; then
    echo "Unnecessary packages successfully removed!"
else
    echo "Error removing unnecessary packages!"
    exit 1
fi

echo "Cleaning cache..."
sudo pacman -Scc --noconfirm
if [ $? -eq 0 ]; then
    echo "Cache successfully cleaned!"
else
    echo "Error cleaning cache!"
    exit 1
fi

echo "System update completed!"
