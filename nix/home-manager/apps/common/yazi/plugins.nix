{ pkgs, ... }:

# nix-shell -p nix-prefetch-github

# nix-prefetch-github yazi-rs plugins
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "2ad42fa7065b4885ff058280b4ab4309c11a5755";
    hash = "sha256-+FDiOaEYkA0A8w+Cg2Y/pFZY56lOsWLeKCNwLI0ZKVk=";
  };
in {
  chmod = "${yazi-plugins}/chmod.yazi";
  full-border = "${yazi-plugins}/full-border.yazi";
  git = "${yazi-plugins}/git.yazi";
  jump-to-char = "${yazi-plugins}/jump-to-char.yazi";
  smart-filter = "${yazi-plugins}/smart-filter.yazi";
  smart-enter = "${yazi-plugins}/smart-enter.yazi";
  bypass = pkgs.fetchFromGitHub {
    owner = "Rolv-Apneseth";
    repo = "bypass.yazi";
    rev = "2ab6d84e8165985dd4d63ef0098e3a30feb3a41a";
    hash = "sha256-6LiBUvHmN8q/ao1+QhCg75ypuf1i6MyRQiU16Lb8pEs=";
  };
  # nix-prefetch-github boydaihungst mediainfo.yazi
  mediainfo = pkgs.fetchFromGitHub {
    owner = "boydaihungst";
    repo = "mediainfo.yazi";
    rev = "b74b7b82aa468d8715547628511e4495df455790";
    hash = "sha256-RKSHos4Jnr6MYTtvzRvM2+c//9kyKD/pm1GGgrKcPc4=";
  };
  ouch = pkgs.fetchFromGitHub {
    owner = "ndtoan96";
    repo = "ouch.yazi";
    rev = "2496cd9ac2d1fb52597b22ae84f3af06c826a86d";
    hash = "sha256-OsNfR7rtnq+ceBTiFjbz+NFMSV/6cQ1THxEFzI4oPJk=";
  };
  restore = pkgs.fetchFromGitHub {
    owner = "boydaihungst";
    repo = "restore.yazi";
    rev = "328dd888c1e2b9b0cb5dc806f099e3164e179620";
    hash = "sha256-3Z8P25u9bffdjrPjxLRWUQn6MdBS+vyElUBkgV4EUwY=";
  };
  starship = pkgs.fetchFromGitHub {
    owner = "Rolv-Apneseth";
    repo = "starship.yazi";
    rev = "c0707544f1d526f704dab2da15f379ec90d613c2";
    hash = "sha256-H8j+9jcdcpPFXVO/XQZL3zq1l5f/WiOm4YUxAMduSRs=";
  };
  sudo = pkgs.fetchFromGitHub {
    owner = "TD-Sky";
    repo = "sudo.yazi";
    rev = "af70636fbcf30ef17f77c5ffcfcbf1342c554be1";
    hash = "sha256-IvTBAhZrbrNJ5nsLxr35V0ntQw89yXUdoU9ashbflYY=";
  };
  what-size = pkgs.fetchFromGitHub {
    owner = "pirafrank";
    repo = "what-size.yazi";
    rev = "f1c6b691363e602d0ddbee29384017d08b608f64";
    hash = "sha256-M1phqmo318/VYkLWiqjEWuHlnQ+hfz5H+k8G0zsmclg=";
  };
  copy-file-contents = let
    src = pkgs.fetchFromGitHub {
      owner = "AnirudhG07";
      repo = "plugins-yazi";
      rev = "524c52c7e433834e36a502abd1e31a6a65c8caf0";
      hash = "sha256-GrPqcHYG+qHNi80U+EJJd1JjdAOexiE6sQxsqdeCSMg=";
    };
  in "${src}/copy-file-contents.yazi";
}
