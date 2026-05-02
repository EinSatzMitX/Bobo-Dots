{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      ## Put here any library that is required when running a package
      ## ...
      libice

      ## Uncomment if you want to use the libraries provided by default in the steam distribution
      ## but this is quite far from being exhaustive
      ## https://github.com/NixOS/nixpkgs/issues/354513
      (pkgs.runCommand "steamrun-lib" {} "mkdir $out; ln -s ${pkgs.steam-run.fhsenv}/usr/lib64 $out/lib")

      # create a small store derivation containing the native libs Scarab needs
      # (runCommand "scarab-native-deps" {} ''
      #   mkdir -p $out/lib
      #   # replace these with the actual paths where your downloaded .so files live
      #   cp /home/bobo/bobo-dots/scarab/libHarfBuzzSharp.so $out/lib/
      #   cp /home/bobo/bobo-dots/scarab/libSkiaSharp.so $out/lib/
      #   # If there are any other .so files shipped next to the binary, copy them here too.
      # '')
    ];
  };
}
