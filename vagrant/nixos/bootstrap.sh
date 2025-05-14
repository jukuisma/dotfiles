#!/usr/bin/env bash

set -xe

if ! grep -- installation-cd-minimal /etc/nixos/configuration.nix; then
    exit 1
fi

# Partitioning
sudo wipefs --all /dev/vda
sudo fdisk /dev/vda <<EOF
o
n
p
1
2048
+500M
n
p
2


w
EOF

# Filesystems
sudo mkfs.fat -F 32 /dev/vda1
sudo mkfs.ext4 /dev/vda2

# Mount
sudo mount /dev/vda2 /mnt
sudo mkdir /mnt/boot
sudo mount /dev/vda1 /mnt/boot

# Swap
sudo dd if=/dev/zero of=/mnt/.swapfile bs=1024 count=2M
sudo chmod 600 /mnt/.swapfile
sudo mkswap /mnt/.swapfile
sudo swapon /mnt/.swapfile

# Config
sudo nixos-generate-config --root /mnt
sudo cp configuration.nix /mnt/etc/nixos/configuration.nix

# Install
cd /mnt
sudo nixos-install
