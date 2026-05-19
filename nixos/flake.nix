{
  description = "My NixOS VM Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel/release";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Mac style plymouth theme
    mac-style-plymouth = {
      url = "github:SergioRibera/s4rchiso-plymouth-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Alejandra
    alejandra = {
      url = "github:kamadorueda/alejandra/4.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Matugen
    matugen = {
      url = "github:/InioX/matugen";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nur
    nur = {
      url = "github:nix-community/nur";
    };

    niri.url = "github:sodiboo/niri-flake";
  };

  outputs = {
    nixpkgs,
    nixvim,
    ...
  } @ inputs: let
    default = {
      stateVersion = "25.05";
      # Use a config folder for compatibility with arch
      flakePath = "/home/${default.username}/dotfiles/nixconfig/";
      templateFolder = "${default.flakePath}/dots/templates";
      configFolder = "${default.flakePath}/dots/config";
      localFolder = "${default.flakePath}/dots/local";
      desktopEntryFolder = "${default.flakePath}/dots/desktop-entries";

      system = "x86_64-linux";
      username = "noon";

      wallpaper = let
        url = "https://w.wallha.com/ws/14/CgX5kJtd.png";
        sha256 = "01157ryi41if7jy3hbx2fxc6llkaaqsl2c3ds3jbkjcf18lk1lkh";
        ext = nixpkgs.lib.last (nixpkgs.lib.splitString "." url);
      in
        builtins.fetchurl {
          name = "wallpaper-${sha256}.${ext}";
          inherit url sha256;
        };
    };

    mkLib = nixpkgs:
      nixpkgs.lib.extend (
        self: super: {falak = import ./lib {lib = self;};} // inputs.home-manager.lib
      );

    addNewHost = hostName:
      with inputs;
        nixpkgs.lib.nixosSystem {
          system = default.system;
          modules = [
            ./modules
            (./. + "/hosts/${hostName}")
            inputs.disko.nixosModules.disko
            {
              nixpkgs.overlays = [
                nix-cachyos-kernel.overlays.pinned
                inputs.mac-style-plymouth.overlays.default
              ];
              environment.systemPackages = [
                matugen.packages.${default.system}.default
              ];
            }
            inputs.matugen.nixosModules.default
          ];
          specialArgs = {
            lib = mkLib inputs.nixpkgs;
            inherit inputs hostName default;
          };
        };
  in {
    nixosConfigurations = {
      vm = addNewHost "vm";
      # laptop = addNewHost "laptop";
    };
    formatter.x86_64-linux = inputs.alejandra.packages.x86_64-linux.default;
  };
}
