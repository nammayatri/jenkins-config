
# CI configurations

Nammayatri uses Jenkins for CI. This repository contains the NixOS configuration for the master node and the macOS slave node. It uses [jenkins-nix-ci](https://github.com/juspay/jenkins-nix-ci) under the hood.

## Deploying

First enter the nix shell (via direnv or `nix develop`) and then run:

To deploy the master node,

```sh
deploy --remote-build -s .#nixos
```

NOTE: If deploying fails with rollback on NetworkManager issues, see https://github.com/serokell/deploy-rs/issues/91#issuecomment-846292218 (You mayi have to reboot the machine after deploying with rollback disable; and deploy again).

To deploy the macOS slave node,

```sh
deploy --remote-build -s .#macos
```

## Local build

For linux,

```sh
nix build .#nixosConfigurations.jenkins-nix-ci.config.system.build.toplevel
```

