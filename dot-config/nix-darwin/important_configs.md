# Nix Packages and homebrew


```nix
    configuration = { pkgs, ... }: {
      
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
          "rbenv"
            
        ];
        casks = [
          "mullvadvpn" 
          "brave-browser"
          "notion"
        ];
      };
```


# Darwin / mac 

```nix 
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
    };
};

```