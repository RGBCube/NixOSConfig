{ lib, pkgs, systemPackages, homeConfiguration, enabled, ... }: lib.recursiveUpdate

(with pkgs; systemPackages [
  (python311.withPackages (pkgs: with pkgs; [
    pip
    requests
  ]))
  virtualenv
  poetry
])

(homeConfiguration "nixos" {
  programs.nushell.shellAliases = {
    venv = "virtualenv venv";
  };
})
