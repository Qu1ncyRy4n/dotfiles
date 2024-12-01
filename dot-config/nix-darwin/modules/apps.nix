{ pkgs, ...}: {

  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    discord
    slack
    

    # Hotkeys and window management
    yabai
    skhd
    monitorcontrol

    # Unix tools
    stow
    wget
    git
    lazygit
    tree

    # editors / note frameworks / terminals
    vim 
    neovim
    obsidian

    # p langs
    go # C/CPP tools
    gcc
    llvm
    # gdb # not compatible with "aarch64-apple-darwin" ?? but compat with "aarch64-darwin"
    R
    rustup # rust
    cargo # rust dependencies and builder
    jupyter
    quarto
    


    # C++ and Carfac Related
    eigen
    # jack2
    pkg-config
    libpkgconf
    # zita-ajbridge
    # qjackctl


    # build systems
    gnumake
    autoconf
    scons
    cmake
    

    # Msc Command line
    ffmpeg-full
    neofetch
    cbonsai
    libssh
    curl
    wget
    cowsay
    blocky
    pywal
    stow
  ];

  # DONE To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup = "uninstall";
      upgrade = true;
    };

    taps = [
      "homebrew/services"
    ];

    brews = [
      "mas"
      "jack"
      "python@3.13"
      "python@3.12"
      "python@3.11"
      "ruby@3.2"
      "rbenv"
    ];
    casks = [
      "mullvadvpn" 
      "brave-browser"
      "notion"
    ];
  };
}
