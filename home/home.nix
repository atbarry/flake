{ config, pkgs, inputs, outputs, ... }:

{
  # TODO please change the username & home direcotry to your own
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      (final: prev: {
        unstable = import outputs.nixpkgs-unstable {
          system = prev.system;
          config.allowUnfree = true;
        };
      })
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # radar project
    osmium-tool
    gpxsee
    qgis

    # custom packages
    nix-inspect
    supercell-wx

    # meetings / productivity
    openvpn
    protonvpn-gui
    zoom-us

    # investing
    tradingview

    gh # github cli
    gitkraken
    nodejs

    # bevy dependencies
    pkg-config
    alsa-lib
    alsa-utils
    vulkan-loader
    wayland
    udev
    libxkbcommon
    libudev-zero
    xorg.libX11 xorg.libXcursor xorg.libXi xorg.libXrandr

    neofetch
    nnn # terminal file manager

    # browser
    unstable.firefox
    google-chrome
    qbittorrent

    # keyboard
    wally-cli

    # coding
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    unstable.zed-editor
    jdk21
    just # save and run project-specific commands

    # virtual machine
    qemu
    quickemu

    pdm # python package manager

    # documents
    typst
    typst-lsp

    # archives
    zip
    xz
    unzip
    p7zip

    #benchmarking
    geekbench

    #gaming
    steam
    lutris
    wine
    discord
    noisetorch
    mangohud
    gamemode
    obs-studio
    dolphin-emu
    dwarf-fortress

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
    fzf # A command-line fuzzy finder

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    eza # better ls

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    # Monitoring tools
    btop
    nvtop
    sniffnet

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    # fonts
    (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" "JetBrainsMono"]; })

    ledger-live-desktop
  ];

  # basic configuration of git
  programs.git = {
    enable = true;
    extraConfig.init.defaultBranch = "main";
    userName  = "atbarry";
    userEmail = "albarry465@gmail.com";
    aliases = {
      cm = "commit -m";
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      cat "shell is working!"
    '';
    shellAliases = {
      ls = "eza";
      cd = "z";
      cdi = "zi";
    };
  };

  programs.zoxide = {
    enable = true;
  };

  programs.eza = {
    enable = true;
    icons = true;
    extraOptions = [
      # "--git-ignore"
    ];
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.kitty = {
    enable = true;
    font = {
      name = "Iosevka";
      size = 12;
    };
    # custom settings
    settings = { };
  };

  # vscode stuff
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };

  # required to autoload fonts installed with Home Manager
  fonts.fontconfig.enable = true;

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

   # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
