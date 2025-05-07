{ pkgs, ... }:

{
  home.packages = with pkgs; [
    web-ext
    open-in-mpv
  ];

  xdg.mimeApps = {
    defaultApplications = {
      # Set firefox as the default browser
      "application/pdf" = [ "firefox.desktop" ]; # pdf
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];
      # Open in MPV
      "x-scheme-handler/mpv" = [ "open-in-mpv.desktop" ];
    };
  };

  home.file.".local/share/applications/open-in-mpv.desktop".text = ''
    [Desktop Entry]
    Name=open-in-mpv
    Exec=open-in-mpv %u
    Type=Application
    Terminal=false
    NoDisplay=true
    MimeType=x-scheme-handler/mpv
  '';

  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      # Find extensions here: https://nur.nix-community.org/repos/rycee/
      # Request new extensions here: https://gitlab.com/rycee/nur-expressions/
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        # Block annoyances
        ublock-origin
        consent-o-matic
        # QoL
        darkreader
        vimium
        mal-sync
        bitwarden
        translate-web-pages
        iina-open-in-mpv
        wayback-machine
        zotero-connector
        libredirect
        # YouTube
        sponsorblock
        return-youtube-dislikes
        youtube-alternative-switch
        # nyaa.si
        nyaa-linker
      ];
      search = {
        force = true;
        default = "ddg";
        privateDefault = "ddg";
        engines = {
          # Defaults
          "google".metaData.hidden = true;
          "bing".metaData.hidden = true;
          "Amazon.co.uk".metaData.hidden = true;
          "ebay".metaData.hidden = true;
          "wikipedia".metaData.hidden = false;
          # Custom
          "Dictionary" = {
            urls = [{ template = "https://www.dictionary.com/browse/{searchTerms}"; }];
            icon = "https://www.dictionary.com/94e56a525da4e9fe0cda.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@d" ];
          };
          "Thesaurus" = {
            urls = [{ template = "https://www.thesaurus.com/browse/{searchTerms}"; }];
            icon = "https://www.thesaurus.com/0d297be7e698b98c9da8.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@t" ];
          };
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages?channel=unstable";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "Nix Options" = {
            urls = [{
              template = "https://search.nixos.org/options?channel=unstable";
              params = [
                { name = "type"; value = "options"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };
          "NixOS Wiki" = {
            urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nw" ];
          };
          "MDN" = {
            urls = [{ template = "https://developer.mozilla.org/en-US/search?q={searchTerms}"; }];
            icon = "https://developer.mozilla.org/favicon-48x48.bc390275e955dacb2e65.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@mdn" ];
          };
        };
        order = [
          "ddg"
          "wikipedia"
          "Dictionary"
          "Thesaurus"
          "Nix Packages"
          "Nix Options"
          "NixOS Wiki"
        ];
      };
      bookmarks = {
        force = true;
        settings = [
          {
            name = "Toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "Google";
                bookmarks = [
                  {
                    name = "Mail";
                    url = "https://mail.google.com";
                  }
                  {
                    name = "Calendar";
                    url = "https://calendar.google.com";
                  }
                  {
                    name = "Contacts";
                    url = "https://contacts.google.com";
                  }
                  {
                    name = "Maps";
                    url = "https://maps.google.com";
                  }
                  {
                    name = "Drive";
                    url = "https://drive.google.com";
                  }
                ];
              }
              {
                name = "Utilities";
                bookmarks = [
                  {
                    name = "Dropbox";
                    url = "https://www.dropbox.com/home";
                  }
                  {
                    name = "Paypal";
                    url = "https://www.paypal.com/myaccount/summary";
                  }
                  {
                    name = "addy.io";
                    url = "https://app.addy.io";
                  }
                  {
                    name = "Reactive Resume";
                    url = "https://rxresu.me/dashboard";
                  }
                  {
                    name = "Spotify Dedup";
                    url = "https://spotify-dedup.com/";
                  }
                  {
                    name = "LibreSpeed";
                    url = "https://librespeed.org/";
                  }
                  {
                    name = "ToS;DR";
                    url = "https://tosdr.org/";
                  }
                ];
              }
              {
                name = "Media";
                bookmarks = [
                  {
                    name = "MALSync PWA";
                    url = "https://malsync.moe/pwa";
                  }
                  {
                    name = "YouTube";
                    url = "https://www.youtube.com/feed/subscriptions";
                  }
                  {
                    name = "ChatReplay";
                    url = "https://chatreplay.stream/subscriptions";
                  }
                  {
                    name = "Google Play Books";
                    url = "https://play.google.com/books";
                  }
                ];
              }
              {
                name = "Lists";
                bookmarks = [
                  {
                    name = "AniList";
                    url = "https://anilist.co/";
                  }
                  {
                    name = "Simkl";
                    url = "https://simkl.com/";
                  }
                  {
                    name = "The StoryGraph";
                    url = "https://app.thestorygraph.com/";
                  }
                  {
                    name = "Infinite Backlog";
                    url = "https://infinitebacklog.net/";
                  }
                  {
                    name = "AlternativeTo";
                    url = "https://alternativeto.net/";
                  }
                  {
                    name = "ProtonDB";
                    url = "https://www.protondb.com/";
                  }
                  {
                    name = "PCPartPicker";
                    url = "https://pcpartpicker.com/";
                  }
                ];
              }
              {
                name = "Social";
                bookmarks = [
                  {
                    name = "GitHub";
                    url = "https://github.com/";
                  }
                  {
                    name = "LinkedIn";
                    url = "https://www.linkedin.com/";
                  }
                  {
                    name = "Lemmy";
                    url = "https://lemmy.world";
                  }
                  {
                    name = "Pixelfed";
                    url = "https://pixelfed.social";
                  }
                  {
                    name = "Mastodon";
                    url = "https://mastodon.social";
                  }
                ];
              }

              {
                name = "Development";
                bookmarks = [
                  {
                    name = "Home Manager";
                    url = "https://nix-community.github.io/home-manager/options.xhtml";
                  }
                  {
                    name = "nixvim";
                    url = "https://nix-community.github.io/nixvim/";
                  }
                  {
                    name = "catppuccin/nix";
                    url = "https://nix.catppuccin.com/";
                  }
                  {
                    name = "Hyprland";
                    url = "https://wiki.hyprland.org/";
                  }
                ];
              }
              {
                name = "Gaming";
                bookmarks = [
                  {
                    name = "SteamDB";
                    url = "https://steamdb.info/";
                  }
                  {
                    name = "Itch";
                    url = "https://itch.io/";
                  }
                  {
                    name = "IsThereAnyDeal";
                    url = "https://isthereanydeal.com";
                  }
                  {
                    name = "HowLongToBeat";
                    url = "https://howlongtobeat.com/";
                  }
                  {
                    name = "osu!";
                    url = "https://osu.ppy.sh/home";
                  }
                  {
                    name = "Osekai INEX / Medals";
                    url = "https://inex.osekai.net/medals/";
                  }
                  {
                    name = "lichess.org";
                    url = "https://lichess.org/";
                  }
                  {
                    name = "BoardGameGeek";
                    url = "https://boardgamegeek.com/";
                  }
                ];
              }
              {
                name = "Downloads";
                bookmarks = [
                  {
                    name = "1337x";
                    url = "https://1337x.to/home/";
                  }
                  {
                    name = "Anna's Archive";
                    url = "https://annas-archive.org/";
                  }
                  {
                    name = "Nyaa";
                    url = "https://nyaa.si/";
                  }
                  {
                    name = "Vimm's Lair";
                    url = "https://vimm.net/";
                  }
                  {
                    name = "hShop";
                    url = "https://hshop.erista.me/";
                  }
                  {
                    name = "Myrient";
                    url = "https://myrient.erista.me";
                  }
                ];
              }
              {
                name = "Megathreads";
                bookmarks = [
                  {
                    name = "dbzer0 Megathread";
                    url = "https://rentry.co/megathread";
                  }
                  {
                    name = "/r/Roms Megathread";
                    url = "https://r-roms.github.io/";
                  }
                  {
                    name = "The Index";
                    url = "https://theindex.moe/";
                  }
                ];
              }
              {
                name = "Shopping";
                bookmarks = [
                  {
                    name = "Amazon";
                    url = "https://www.amazon.co.uk/";
                  }
                  {
                    name = "Tesco";
                    url = "https://www.tesco.com/";
                  }
                  {
                    name = "2Tall";
                    url = "https://www.2tall.com/";
                  }
                ];
              }
              {
                name = "Hosting";
                bookmarks = [
                  {
                    name = "Vercel";
                    url = "https://vercel.com/";
                  }
                  {
                    name = "Hover";
                    url = "https://www.hover.com/";
                  }
                ];
              }
              {
                name = "University";
                bookmarks = [
                  {
                    name = "Student System";
                    url = "https://student-system.port.ac.uk";
                  }
                  {
                    name = "Timetable";
                    url = "https://timetabling.port.ac.uk";
                  }
                  {
                    name = "Moodle";
                    url = "https://moodle.port.ac.uk";
                  }
                  {
                    name = "Work Placements";
                    url = "https://workplacements.port.ac.uk";
                  }
                  {
                    name = "Learning Catalytics";
                    url = "https://learningcatalytics.com/class_sessions";
                  }
                  {
                    name = "Virtual Machine";
                    url = "https://uop-1-server-per-student-prod.appspot.com/instance/get";
                  }
                  {
                    name = "DCalc";
                    url = "https://soc.port.ac.uk/dcalc/";
                  }
                ];
              }
              {
                name = "Other";
                bookmarks = [
                  {
                    name = "williamwatson.dev";
                    url = "https://williamwatson.dev";
                  }
                ];
              }
            ];
          }
        ];
      };
      settings =
        let
          newTabPageBlocked = ''
            {"R8wYCmScoyV0xHr6e1KJng==":1,"c/GpBaAESHY/bXEx/uourw==":1,"Z3sawLcfnygbilXeU5fdHg==":1,"6qTsCBZaEVXWrWxdXn5pmQ==":1,"+CUypgsitL9L0VmPZ0t22g==":1,"c9lsKElwtRd9PbcOXhz3dA==":1,"otFC2oJcatFNwWRBjMU7YA==":1,"26UbzFJ7qT9/4DhodHKA1Q==":1,"4gPpjkxgZzXPVtuEoAL9Ig==":1,"gLv0ja2RYVgxKdp0I5qwvA==":1,"0GuysDfjFIJXq6QVZ2C5YA==":1,"FX7dGM0Jj2q2tTyEv9oaUQ==":1,"BRX66S9KVyZQ1z3AIk0A7w==":1}
          '';
          uiCustomizationState = ''
            {"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["_c84d89d9-a826-4015-957b-affebd9eb603_-browser-action","addon_darkreader_org-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","ublock0_raymondhill_net-browser-action","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","gdpr_cavi_au_dk-browser-action","sponsorblocker_ajay_app-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","_036a55b4-5e72-4d05-a06c-cba2dfcc134a_-browser-action","7esoorv3_alefvanoon_anonaddy_me-browser-action","_d66c8515-1e0d-408f-82ee-2682f2362726_-browser-action","wayback_machine_mozilla_org-browser-action","metacor_code_gmail_com-browser-action","_25cddbee-458b-4e9f-984d-dbf35511f124_-browser-action","zotero_chnm_gmu_edu-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","urlbar-container","save-to-pocket-button","downloads-button","fxa-toolbar-menu-button","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button"],"vertical-tabs":[],"PersonalToolbar":["personal-bookmarks"]},"seen":["metacor_code_gmail_com-browser-action","gdpr_cavi_au_dk-browser-action","wayback_machine_mozilla_org-browser-action","_25cddbee-458b-4e9f-984d-dbf35511f124_-browser-action","_d66c8515-1e0d-408f-82ee-2682f2362726_-browser-action","7esoorv3_alefvanoon_anonaddy_me-browser-action","addon_darkreader_org-browser-action","zotero_chnm_gmu_edu-browser-action","ublock0_raymondhill_net-browser-action","_036a55b4-5e72-4d05-a06c-cba2dfcc134a_-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","_c84d89d9-a826-4015-957b-affebd9eb603_-browser-action","developer-button","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","sponsorblocker_ajay_app-browser-action"],"dirtyAreaCache":["unified-extensions-area","nav-bar","PersonalToolbar","TabsToolbar","toolbar-menubar","vertical-tabs"],"currentVersion":20,"newElementCount":15}
          '';
        in
        {
          "extensions.pocket.enabled" = false; # Disable pocket
          "extensions.formautofill.creditCards.enabled" = false; # Disable autofill credit cards
          "browser.contentblocking.category" = "strict"; # Content blocking strict
          "browser.tabs.firefox-view" = false; # Disable firefox view
          "browser.tabs.firefox-view-next" = false; # Disable firefox view
          "browser.tabs.firefox-view-newIcon" = false; # Disable firefox view
          "browser.tabs.tabmanager.enabled" = false; # Disable tab manager
          "browser.aboutConfig.showWarning" = false; # Disable about config warning
          "browser.toolbars.bookmarks.visibility" = "newtab"; # Only show toolbar on new tab
          "browser.newtabpage.activity-stream.showSearch" = false; # Don't show search on new tab page
          "browser.newtabpage.activity-stream.feeds.topsites" = false; # Disable new tab page top sites
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false; # Disable new tab page recommended by pocket
          "browser.newtabpage.activity-stream.showSponsored" = false; # Disable new tab page sponsored
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false; # Disable new tab page sponsored top sites
          "browser.newtabpage.blocked" = newTabPageBlocked; # Remove the default pinned websites from the new tab page (appears in search)
          "browser.uiCustomization.state" = uiCustomizationState; # Save UI customizations
          "browser.search.suggest.enabled" = false; # Disable search suggestions
          "media.eme.enabled" = true; # Play DRM controlled content
          "permissions.default.desktop-notification" = 2; # Disable desktop notifications by default
          "privacy.donottrackheader.enabled" = true; # Always send do not track header
          "privacy.history.custom" = true; # Custom history settings
          "privacy.clearOnShutdown.cache" = false; # Don't clear cache on shutdown
          "privacy.clearOnShutdown.cookies" = false; # Don't clear cookies on shutdown
          "privacy.sanitize.sanitizeOnShutdown" = true; # Clear on shutdown
          "datareporting.healthreport.uploadEnabled" = false; # Disable health report
          "app.shield.optoutstudies.enabled" = false; # Opt out of studies
          "dom.security.https_only_mode" = true; # Enable HTTPS only mode
          "dom.security.https_only_mode_ever_enabled" = true; # Always enable HTTPS only mode
          "signon.rememberSignons" = false; # Don't ask to save passwords
          "general.autoScroll" = true; # Enable auto scroll
          "accessibility.typeaheadfind.enablesound" = false; # Disable sound effect on failed "Find in page"
          "identity.fxaccounts.toolbar.enabled" = false; # Disable firefox accounts icon in toolbar
          "browser.tabs.hoverPreview.enabled" = false; # Disable preview tab on hover
        };
    };
  };
}
