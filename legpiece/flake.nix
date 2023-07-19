{
  inputs = {
    # Principle inputs (updated by `nix run .#update`)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-flake.url = "github:srid/nixos-flake";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [ inputs.nixos-flake.flakeModule ];

      flake =
        let
          myUserName = "admin";
          hostName = "legpiece";
        in
        {
          # Configurations for Linux (NixOS) machines
          nixosConfigurations.${hostName} = self.nixos-flake.lib.mkLinuxSystem {
            imports = [
              inputs.disko.nixosModules.disko

              # Your machine's configuration.nix goes here
              ({ pkgs, lib, ... }: {
                disko.devices = import ./disk-config.nix {
                  inherit lib;
                };

                boot.loader.grub.device = "/dev/nvme0n1";
                boot.loader.grub.efiSupport = true;
                users.users.${myUserName}.isNormalUser = true;
                system.stateVersion = "23.05";

                environment.systemPackages = with pkgs; [
                  # Put your packages here
                  htop
                ];

                services = {
                  # openssh.settings.permitRootLogin = "prohibit-password";
                  openssh.settings.PasswordAuthentication = true;
                  openssh.enable = true;
                };

                networking = {
                  hostName = hostName;
                  networkmanager.enable = true;
                };

                # Enable flakes
                nix.settings.experimental-features = [ "nix-command" "flakes" ];

                users.users.root = {
                  root.initialHashedPassword = "";
                  root.openssh.authorizedKeys.keys = [
                    # Put your ssh pub keys
                  ];
                };
                users.users.admin = {
                  isNormalUser = true;
                };
              })

              # Setup home-manager in NixOS config
              self.nixosModules.home-manager
              {
                home-manager.users.${myUserName} = {
                  imports = [ self.homeModules.default ];
                  home.stateVersion = "22.11";
                };
              }
            ];
          };

          # home-manager configuration goes here.
          homeModules.default = { pkgs, ... }: {
            imports = [ ];
            programs.git.enable = true;
            programs.starship.enable = true;
            programs.bash.enable = true;
          };
        };
    };
}
