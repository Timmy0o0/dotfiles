{ pkgs, ... }:

let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "b12a9ab085a8c2fe2b921e1547ee667b714185f9";
    hash = "sha256-LWN0riaUazQl3llTNNUMktG+7GLAHaG/IxNj1gFhDRE=";
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
  mediainfo = pkgs.fetchFromGitHub {
    owner = "boydaihungst";
    repo = "mediainfo.yazi";
    rev = "436cb5f04d6e5e86ddc0386527254d87b7751ec8";
    hash = "sha256-oFp8mJ62FsJX46mKQ7/o6qXPC9qx3+oSfqS0cKUZETI=";
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
