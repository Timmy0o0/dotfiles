{
  mgr = { show_hidden = true; };
  preview = {
    max_width = 1000;
    max_height = 1000;
  };
  plugin = {
    prepend_fetchers = [
      {
        id = "git";
        name = "*";
        run = "git";
      }
      {
        id = "git";
        name = "*/";
        run = "git";
      }
    ];
    prepend_preloaders = [
      # Replace magick, image, video with mediainfo
      {
        mime = "{audio,video,image}/*";
        run = "mediainfo";
      }
      {
        mime = "application/subrip";
        run = "mediainfo";
      }
    ];
    prepend_previewers = [
      # Replace magick, image, video with mediainfo
      {
        mime = "{audio,video,image}/*";
        run = "mediainfo";
      }
      {
        mime = "application/subrip";
        run = "mediainfo";
      }
      # ouch
      {
        mime = "application/*zip";
        run = "ouch";
      }
      {
        mime = "application/x-tar";
        run = "ouch";
      }
      {
        mime = "application/x-bzip2";
        run = "ouch";
      }
      {
        mime = "application/x-7z-compressed";
        run = "ouch";
      }
      {
        mime = "application/x-rar";
        run = "ouch";
      }
      {
        mime = "application/x-xz";
        run = "ouch";
      }
      {
        mime = "application/xz";
        run = "ouch";
      }
    ];
  };
}
