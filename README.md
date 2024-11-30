# Installation
Just add these files to your directory and include them in `configuration.nix` or your flake. Also remember to add `home.nix` to your flake if you want to use it!
```nix
imports = [
    ./programs/pkgs.nix
    ./settings/nix.nix
];
```
Every major thing should be included. When using LUKS, leave `boot` settings in your configuration.

And please, don't expect too much. I only recently got into NixOS.
