{pkgs, ...}: {
  # Only enable either docker or podman -- Not both

  virtualisation = {
    # virtualbox = {
    #   host.enableKvm = false;
    #   host.enable = true;
    #   guest.enable = true;
    # };

    libvirtd.enable = false;
    docker.enable = true;
    podman.enable = false;
  };

  # nixpkgs.config.virtualbox.enableExtensionPack = true;

  programs = {
    virt-manager.enable = false;
  };
  environment.systemPackages = with pkgs; [
    # virt-viewer # View Virtual Machines
  ];
}
