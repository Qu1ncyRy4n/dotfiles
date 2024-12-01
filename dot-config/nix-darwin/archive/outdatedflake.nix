# nix run nix-darwin -- switch --flake ~/.config/nix-darwin
# Should now just work with `darwin-rebuild switch --flake .#MacBook-Pro-485 `
# update with nix flake update

{
  description = "Q's MBP Nix-Darwin config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    #home-manager = {
    #  url = "github:nix-community/home-manager";
    #  inputs.nixpkgs.follows = "nixpkgs"; # Ensure consistent nixpkgs
    # };

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:

      nixpkgs.config.allowUnfree = true;
      # nixpkgs.config.allowUnsupportedSystem = true; 

      environment.systemPackages = with pkgs; [ 
        # Web / social
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
            "python@3.13"
            "python@3.12"
            "python@3.11"
            

            ];
          casks = [
            "mullvadvpn" 
            "brave-browser"
            "notion"
            #"whisky"
            ];
        };
        #programs.git = {
        #  enable = true;
        #  userName = "Qu1ncyRy4n";
        #  userEmail = "quincymryan@gmail.com";
        # };
    
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
            # NSGlobalDomain._HIHideMenuBar = true;
          };
        };
      

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      #programs.fish.enable = true;
      #programs.zsh.enable = true;
      #users.defaultUserShell = pkgs.zsh;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MacBook-Pro-485
    darwinConfigurations."MacBook-Pro-485" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."MacBook-Pro-485".pkgs;
  };
}
