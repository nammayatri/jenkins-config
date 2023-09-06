# Keep CI machines from getting run out of disk space.
{ pkgs, ... }:
{
  nix = {
    # Disabling because of https://github.com/NixOS/nix/issues/7273
    # settings.auto-optimise-store = true;

    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    } // (if pkgs.stdenv.isLinux then {
      dates = "weekly";
    } else {
      interval = { Hour = 0; Minute = 0; };
    });
  };
}
