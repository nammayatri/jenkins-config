
## Log

Example config: https://github.com/shivaraj-bh/nix-workshop/tree/master/workshop-0/nixos-config

```sh
# scaffold
nix flake init -t github:srid/nixos-flake#linux
```

- edit username/hostname
- config
    - disko - partition configuration https://github.com/nix-community/disko
    - networking - 
    - boot
- install
  - https://github.com/numtide/nixos-anywhere

```
nix run github:numtide/nixos-anywhere -- --flake .#hetzner-cloud root@135.181.254.201
```