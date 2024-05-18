#!/bin/bash

echo "Starting system update..."

echo "Updating package list..."
sudo apt-get update
if [ $? -eq 0 ]; then
    echo "Package list successfully updated!"
else
    echo "Error updating package list!"
    exit 1
fi

echo "Installing available updates..."
sudo apt-get upgrade -y
if [ $? -eq 0 ]; then
    echo "Available updates successfully installed!"
else
    echo "Error installing available updates!"
    exit 1
fi

echo "Installing updates with removal or installation of other packages..."
sudo apt-get dist-upgrade -y
if [ $? -eq 0 ]; then
    echo "Updates successfully installed!"
else
    echo "Error installing updates!"
    exit 1
fi

echo "Removing unnecessary packages..."
sudo apt-get autoremove -y
if [ $? -eq 0 ]; then
    echo "Unnecessary packages successfully removed!"
else
    echo "Error removing unnecessary packages!"
    exit 1
fi

echo "Cleaning cache..."
sudo apt-get autoclean
if [ $? -eq 0 ]; then
    echo "Cache successfully cleaned!"
else
    echo "Error cleaning cache!"
    exit 1
fi

echo "System update completed!"
