
# nammayatri Jenkins CI configuration

Configuration for the CI machines used in https://github.com/nammayatri

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

