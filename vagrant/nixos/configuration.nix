{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";

  swapDevices = [{
    device = "/.swapfile";
    size = 2 * 1024;
  }];

  boot.kernelParams = [ "console=ttyS0,115200n8" ];
  boot.loader.grub.extraConfig = "
    serial --speed=115200 --unit=0 --word=8 --parity=no --stop=1
    terminal_input serial
    terminal_output serial
  ";

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Helsinki";

  i18n.defaultLocale = "en_IE.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IE.UTF-8";
    LC_IDENTIFICATION = "en_IE.UTF-8";
    LC_MEASUREMENT = "en_IE.UTF-8";
    LC_MONETARY = "en_IE.UTF-8";
    LC_NAME = "en_IE.UTF-8";
    LC_NUMERIC = "en_IE.UTF-8";
    LC_PAPER = "en_IE.UTF-8";
    LC_TELEPHONE = "en_IE.UTF-8";
    LC_TIME = "en_IE.UTF-8";
  };

  users.users.vagrant = {
    isNormalUser = true;
    description = "vagrant";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  security.sudo.extraRules= [
    { users = [ "vagrant" ];
      commands = [
        { command = "ALL" ;
          options= [ "NOPASSWD" "SETENV" ];
        }
      ];
    }
  ];

  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    xxd
    htop
    strace
    tree
    gcc
    gdb
    fzf
    fd
    ripgrep
    curl
    bat
    ctags
    gnumake
    git
  ];

  programs.command-not-found.enable = false;

  programs.fish.enable = true;
  users.users.vagrant = {
    shell = pkgs.fish;
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ "vagrant" ];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };

  networking.firewall.allowedTCPPorts = [ 22 ];

  system.stateVersion = "24.11";

}
