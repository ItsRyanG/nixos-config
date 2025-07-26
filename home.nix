{ config, pkgs, ... }:

{
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";

  programs.vscode.enable = true;

  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -alh";
      update = "sudo nixos-rebuild switch --flake ~/nixos-config#macbook";
    };
  };

  programs.neovim = {
    enable = true;
    extraConfig = ''
      set number
      set relativenumber!
    '';
  };

  gtk = {
    enable = true;
    theme.name = "Ayu-Mirage";
    iconTheme.name = "Papirus-Dark";
    cursorTheme.name = "Adwaita";
    font.name = "Mononoki Nerd Font Regular 11";
  };

  home.file.".config/hypr/hyprland.conf".text = ''
    monitor=,preferred,auto,1
    exec-once = rofi-wayland
    exec-once = hyprpanel
  '';

  home.file.".config/ghostty/config".text = ''
    font-family = Mononoki Nerd Font Regular
    font-family-bold = Mononoki Nerd Font Regular
    font-family-italic = Mononoki Nerd Font Regular
    font-family-bold-italic = Mononoki Nerd Font Regular
    theme = Ayu Mirage
  '';

  home.stateVersion = "25.05";
}
