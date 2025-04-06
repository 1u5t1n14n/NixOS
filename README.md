# Disclaimer
I am no expert in nix. Most things in this repo are done in ways that make them very inefficient. This configuration isn't designed to work flawlessly. I just started writing it because this kind experiment was fun. Don't expect serious things in here.

## Secrets
For your Secrets to be accessible by the CLI you need to create an environment
file (`.env`) in the directory of the flake.
In this file you declare the following variables using a
`VARIABLE=VALUE`-scheme. Escape needed Characters (like `$`).

```bash
PAPERLESS   # passwd for Paperless Admin
PASSWD      # hashed passwd for main user
NEXTCLOUD   # passwd for Nextcloud Admin
KIAN        # hashed passwd for Kian (please use meme passwds or remove him)
ROOT        # hashed root passwd (use mkpasswd for all hashed passwds)
```

Have all these variables in one line of the file! Sorted organization in not
yet supported.

## Rebuilding
For rebuilding NixOS and Home-Manager there is a `Makefile`. Just pass your
desired parameters into `make`:

For NixOS rebuilding:
```bash
make HOST=hostnameFromFlake
```

For Home-Manager:
```bash
make USER=userNameFromFlake homeManager
```
