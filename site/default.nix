let
  sources = import ../nix/26.05/nix/sources.nix;
  pkgs = import sources.nixpkgs {};
in
{
  md.index = pkgs.writeText "index" (builtins.readFile ../nix-rec/index.md);
  svg.title-01 = pkgs.writeText "title-01" (builtins.readFile ../nix-rec/01-create-droplet/title.svg);
}
