#!/bin/sh

rm -rf ../../../configuration.nix
rm -rf ../../../hardware-configuration.nix

cp /etc/nixos/configuration.nix ../../../configuration.nix
cp /etc/nixos/hardware-configuration.nix ../../../hardware-configuration.nix

sed -i ':a;N;$!ba;s#./hardware-configuration#/etc/nixos/hardware-configuration.nix\n ./programs/pkgs.nix\n ./settings/nix.nix#g' configuration.nix

sudo nixos-rebuild switch --flake ../../..#Morpheus
