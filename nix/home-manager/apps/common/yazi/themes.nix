{ pkgs, ... }:

let
  everforest-medium = pkgs.fetchFromGitHub {
    owner = "Chromium-3-Oxide";
    repo = "everforest-medium.yazi";
    rev = "3d5f8471fa6d5c2130d8a980b4ef48d8c5c8521d";
    hash = "sha256-FXg++wVSGrJZnYodzkS4eVIeQE1xm8o0urnoInqfP5g=";
  };
  flexoki-light = pkgs.fetchFromGitHub {
    owner = "gosxrgxx";
    repo = "flexoki-light.yazi";
    rev = "9d53f85a290155b4750af3739c804dca1e8ad054";
    hash = "sha256-5dlD4CvLwpSA2XJJtm562vAyZfsKWQGdbwkQJuXj5Jk=";
  };
in {
  theme = {
    flavor = {
      dark = "everforest-medium";
      light = "flexoki-light";
    };
  };
  flavors = {
    everforest-medium = "${everforest-medium}";
    flexoki-light = "${flexoki-light}";
    # dracula = "${yazi-flavors}/dracula.yazi";
  };
}
