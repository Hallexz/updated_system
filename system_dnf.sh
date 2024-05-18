#!/bin/bash

echo "Starting system update..."

echo "Updating package list..."
sudo dnf check-update
if [ $? -eq 0 ]; then
    echo "Package list successfully updated!"
else
    echo "Error updating package list!"
    exit 1
fi

echo "Installing available updates..."
sudo dnf upgrade --refresh -y
if [ $? -eq 0 ]; then
    echo "Available updates successfully installed!"
else
    echo "Error installing available updates!"
    exit 1
fi

echo "Removing unnecessary packages..."
sudo dnf autoremove -y
if [ $? -eq 0 ]; then
    echo "Unnecessary packages successfully removed!"
else
    echo "Error removing unnecessary packages!"
    exit 1
fi

echo "Cleaning cache..."
sudo dnf clean all
if [ $? -eq 0 ]; then
    echo "Cache successfully cleaned!"
else
    echo "Error cleaning cache!"
    exit 1
fi

echo "System update completed!"
