{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "macbook"; 
  networking.networkmanager.enable = true;

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";
  
  services.xserver.videoDrivers = [ "modesetting" ];
  services.libinput.enable = true;
  services.libinput.touchpad.naturalScrolling = true;

  programs.fish.enable = true;
  users.users.ryan = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

  programs.hyprland.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  environment.systemPackages = with pkgs; [
    hyprland hyprpaper hyprpanel
    rofi-wayland nautilus ghostty zen-browser obsidian
    vscode htop btop onepassword lazyvim llm-studio
    fish fontconfig gtk3 gtk4 mononoki wget curl git unzip
    nodejs google-gemini-cli
  ];

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [ (nerdfonts.override { fonts = [ "Mononoki" ]; }) ];
  };

  programs.dconf.enable = true;
  environment.variables = {
    GTK_THEME = "Ayu-Mirage";
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  nixpkgs.config.allowUnfree = true;
}
