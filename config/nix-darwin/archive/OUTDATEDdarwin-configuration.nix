# Run with: 
# darwin-rebuild switch -I darwsin-config=$HOME/.config/nix-darwin/darwin-configuration.nix
{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true; 
  environment.systemPackages = with pkgs; [ 
    # obsidian
    # Web / scocial
    # discordo Not working
    discord
    slack

    # Hotkeys and window management
    yabai
    skhd
    monitorcontrol


    # Unix tools
    stow
    wget

    # editors / note frameworks / terminals
    vim 
    neovim
    obsidian
    
  

    # p langs
    go 
    gcc
    llvm
    # gdb
    R

    #python3

    #python312Packages.pip

    jupyter
    quarto


    # C++ and Carfac Related
    eigen
    jack2
    pkg-config
    libpkgconf
    # zita-ajbridge
    # qjackctl


    # build systems
    gnumake
    autoconf
    scons
    meson # for jack example clients
    ninja # for jack example clients
    cmake
     

    # Msc Command line
    ffmpeg-full
    neofetch
    cbonsai
    libssh
    curl
    wget
    # mullvad-vpn

    blocky

  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
    taps = ["homebrew/services"];
    brews = [
      "mas"
      "jack"
      ];
    casks = [
      "mullvadvpn" 
      "brave-browser"
      ];
  };


  security.pam.enableSudoTouchIdAuth = true;
  system = {
    defaults = {
      dock = {
        autohide = true;
        show-recents = false;
      };  
      finder = {
        _FXShowPosixPathInTitle = true;
        AppleShowAllExtensions = true;
      };
      NSGlobalDomain._HIHideMenuBar = true;
    };
  };


  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwsin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;
  environment.variables.EDITOR = "code";
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

}


# Blocker

# TODO
  /* services.blocky = {
      enable = true;
      settings = {
        ports.dns = 53; # Port for incoming DNS Queries.
        upstreams.groups.default = [
          "https://one.one.one.one/dns-query" # Using Cloudflare's DNS over HTTPS server for resolving queries.
        ];
        # For initially solving DoH/DoT Requests when no system Resolver is available.
        bootstrapDns = {
          upstream = "https://one.one.one.one/dns-query";
          ips = [ "1.1.1.1" "1.0.0.1" ];
        };
        #Enable Blocking of certian domains.
        blocking = {
          blackLists = {
            #Adblocking
            ads = ["https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"];
            #Another filter for blocking adult sites 
            adult = ["https://blocklistproject.github.io/Lists/porn.txt"]; 
            #You can add additional categories
          };
          #Configure what block categories are used
          clientGroupsBlock = {
            default = [ "ads" "adult" ];
          };
        };
      };
    };

  */ 