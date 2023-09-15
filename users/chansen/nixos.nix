{ pkgs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.mitchellh = {
    isNormalUser = true;
    home = "/home/mitchellh";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$6$l3YdTEtEXpUEMY7G$BrM/YrNp/5Vuy2T1375PAQgn9UUxCEKrutCOMkzpYSe/u1kZhrgKlbAaXvx/7.C8n9zxaec5CobvClYhunRWA/";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGbTIKIPtrymhvtTvqbU07/e7gyFJqNS4S0xlfrZLOaY mitchellh"
    ];
  };
  users.users.chansen = {
    isNormalUser = true;
    home = "/home/chansen";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$6$l3YdTEtEXpUEMY7G$BrM/YrNp/5Vuy2T1375PAQgn9UUxCEKrutCOMkzpYSe/u1kZhrgKlbAaXvx/7.C8n9zxaec5CobvClYhunRWA/";
    openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDdtrC5MGM38tM9gk32eKzJBAP1nqtFoScJJFpksbimBpSroMgDezq1gxYCoVYg15QuaO5m6RbTNfH5A1J3UkKh2UulW5UAXqZIt9+tvPe1x+191jJanjfq1OIoq3Ge5IKWQsaJcGjYktHQDssmVio104sXE/0bkq10/xoQs66vIuDDLOHcPxl+RgDwRHlATHOKdxxPhlO/L3/mDAL8aYmBEHwhfSh8s1NoEPoM7op+aL/s2ojYHRPW/JeHgyxdDcwnT6pFY2X+BoRLx+/J4TqstwqZ2ucbjbum1BIz6uBTaKOdCIMtq6Y9vOmv9Yr4r/RdOjhyfF5jYaBOmx56GzbaqZ/JXcg7nvXmkcFvh2ehLUzumlQzofV/AjsJM+5Vnao3yBunKs3r6Z9fWImvHA915+sMph423TNPkRwJJfmAbVb+HyVpHHmL/Dbt3/vw+7r1WvWr2KkrAiFNPsBXogRVeseck4Z366g3wnkD8BYhca19UXO6rzCnTgVohsHWIxM= chansen@CHANSEN-MACBOOK16"
        ];
    };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix)
  ];
}
