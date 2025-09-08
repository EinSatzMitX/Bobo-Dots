{
  profile,
  host,
  pkgs,
  ...
}: let
  inherit
    (import ../../../hosts/${host}/themes/${profile}.nix)
    vesktopTheme
    ;
in {
  home.packages = with pkgs; [
    vesktop
  ];

  programs.vesktop = {
    enable = true;

    settings = {
      themeLinks = [
        vesktopTheme
      ];
    };
  };
}
