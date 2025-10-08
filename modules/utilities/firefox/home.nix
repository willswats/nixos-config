{ pkgs, globals, ... }:

{
  home.packages = with pkgs; [
    web-ext
  ];

  xdg.mimeApps = {
    defaultApplications = {
      # Set firefox as the default browser
      "application/pdf" = [ "firefox.desktop" ]; # pdf
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];
    };
  };

  catppuccin.firefox.enable = true;

  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;

      # Extensions
      # Find extensions here: https://nur.nix-community.org/repos/rycee/
      # Request new extensions here: https://gitlab.com/rycee/nur-expressions/
      extensions.force = true;
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        # QoL
        ublock-origin
        consent-o-matic
        darkreader
        bitwarden
        vimium
        mal-sync
        translate-web-pages
        libredirect
        firefox-color
        # Zotero
        zotero-connector
        # YouTube
        youtube-alternative-switch
        # Wayback Machine
        wayback-machine
        # nyaa.si
        nyaa-linker
      ];

      # about:config
      settings =
        let
          base = "#${globals.colours.base}";

          newTabPageBlocked = ''
            {"R8wYCmScoyV0xHr6e1KJng==":1,"c/GpBaAESHY/bXEx/uourw==":1,"Z3sawLcfnygbilXeU5fdHg==":1,"6qTsCBZaEVXWrWxdXn5pmQ==":1,"+CUypgsitL9L0VmPZ0t22g==":1,"c9lsKElwtRd9PbcOXhz3dA==":1,"otFC2oJcatFNwWRBjMU7YA==":1,"26UbzFJ7qT9/4DhodHKA1Q==":1,"4gPpjkxgZzXPVtuEoAL9Ig==":1,"gLv0ja2RYVgxKdp0I5qwvA==":1,"0GuysDfjFIJXq6QVZ2C5YA==":1,"FX7dGM0Jj2q2tTyEv9oaUQ==":1,"BRX66S9KVyZQ1z3AIk0A7w==":1,"eV8/WsSLxHadrTL1gAxhug==":1}
          '';

          uiCustomizationState = ''
            {"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["ublock0_raymondhill_net-browser-action","sponsorblocker_ajay_app-browser-action","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","_036a55b4-5e72-4d05-a06c-cba2dfcc134a_-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","_d66c8515-1e0d-408f-82ee-2682f2362726_-browser-action","_c84d89d9-a826-4015-957b-affebd9eb603_-browser-action","7esoorv3_alefvanoon_anonaddy_me-browser-action","addon_darkreader_org-browser-action","gdpr_cavi_au_dk-browser-action","metacor_code_gmail_com-browser-action","wayback_machine_mozilla_org-browser-action","zotero_chnm_gmu_edu-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","vertical-spacer","urlbar-container","downloads-button","fxa-toolbar-menu-button","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"vertical-tabs":[],"PersonalToolbar":["personal-bookmarks"]},"seen":["developer-button","screenshot-button","_036a55b4-5e72-4d05-a06c-cba2dfcc134a_-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","_d66c8515-1e0d-408f-82ee-2682f2362726_-browser-action","_c84d89d9-a826-4015-957b-affebd9eb603_-browser-action","7esoorv3_alefvanoon_anonaddy_me-browser-action","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","addon_darkreader_org-browser-action","gdpr_cavi_au_dk-browser-action","metacor_code_gmail_com-browser-action","sponsorblocker_ajay_app-browser-action","wayback_machine_mozilla_org-browser-action","zotero_chnm_gmu_edu-browser-action","ublock0_raymondhill_net-browser-action"],"dirtyAreaCache":["nav-bar","vertical-tabs","unified-extensions-area","TabsToolbar","toolbar-menubar","PersonalToolbar"],"currentVersion":23,"newElementCount":3}
          '';
        in
        {
          # Enable features
          ## Enable auto scroll
          "general.autoScroll" = true;
          ## Enable ability to play DRM controlled content
          "media.eme.enabled" = true;
          # Enable history (clear it on shutdown later)
          "places.history.enabled" = true;
          # Enable form history (clear it on shutdown later)
          "browser.formfill.enable" = true;

          # Disable Features
          ## Disable firefox view
          "browser.tabs.firefox-view" = false;
          ## Disable search suggestions
          "browser.search.suggest.enabled" = false;
          "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;
          ## Disable pocket
          "extensions.pocket.enabled" = false;
          ## Disable autofill credit cards
          "extensions.formautofill.creditCards.enabled" = false;
          ## Disable Firefox accounts
          "identity.fxaccounts.enabled" = false;
          ## Disable desktop notifications by default
          "permissions.default.desktop-notification" = 2;
          ## Disable "ask to save passwords"
          "signon.rememberSignons" = false;
          ## Disable about:config warning
          "browser.aboutConfig.showWarning" = false;
          ## Disable about welcome
          "browser.aboutwelcome.enabled" = false;
          ## Disable containers
          "privacy.userContext.enabled" = false;
          ## Disable hover preview
          "browser.tabs.hoverPreview.enabled" = false;
          # Disable middle mouse paste
          "middlemouse.paste" = false;

          # Customizations
          ## General
          "browser.toolbars.bookmarks.visibility" = "newtab"; # Only show toolbar on new tab
          "browser.startup.page" = 3; # Open previous windows and tabs
          "browser.contentblocking.category" = "strict"; # Content blocking strict
          "browser.newtabpage.blocked" = newTabPageBlocked; # Remove the default pinned websites from the new tab page (appears in search)
          "browser.uiCustomization.state" = uiCustomizationState; # Save UI customizations
          ## Sidebar
          "sidebar.verticalTabs" = false;
          "sidebar.revamp" = false;
          "sidebar.main.tools" = "history,bookmarks";
          ## New Tab Page
          "browser.newtabpage.activity-stream.showSearch" = false; # Don't show search on new tab page
          "browser.newtabpage.activity-stream.feeds.topsites" = false; # Disable new tab page top sites
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false; # Disable new tab page recommended by pocket
          "browser.newtabpage.activity-stream.showSponsored" = false; # Disable new tab page sponsored
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false; # Disable new tab page sponsored top sites
          "browser.newtabpage.activity-stream.newtabWallpapers.wallpaper" = "solid-color-picker-${base}"; # Set wallpaper
          ## Privacy
          "privacy.globalprivacycontrol.enabled" = true; # Tell websites not to sell or share my data
          ### Clear data on shutdown
          "privacy.clearOnShutdown_v2.formdata" = true;
          "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = true;
          "privacy.clearOnShutdown_v2.siteSettings" = false;
          "privacy.clearOnShutdown_v2.cache" = false;
          "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
          "privacy.clearOnShutdown_v2.sessions" = false;
          "privacy.sanitize.sanitizeOnShutdown" = true;
          ## Security
          "dom.security.https_only_mode" = true; # Enable HTTPS only mode
          "dom.security.https_only_mode_ever_enabled" = true; # Always enable HTTPS only mode
          ## Misc
          "app.shield.optoutstudies.enabled" = false; # Opt out of studies
          "datareporting.healthreport.uploadEnabled" = false; # Disable health report
          "accessibility.typeaheadfind.enablesound" = false; # Disable sound effect on failed "Find in page"
        };

      # Search Engines
      search = {
        force = true;
        default = "ddg";
        privateDefault = "ddg";
        order = [
          "ddg"
          "wikipedia"
          "Dictionary"
          "Thesaurus"
          "Nix Packages"
          "Nix Options"
          "NixOS Wiki"
          "MDN"
        ];
        engines = {
          # Defaults
          "google".metaData.hidden = true;
          "bing".metaData.hidden = true;
          "Amazon.co.uk".metaData.hidden = true;
          "ebay".metaData.hidden = true;
          "wikipedia".metaData.hidden = false;
          # Custom
          "Dictionary" = {
            urls = [ { template = "https://www.dictionary.com/browse/{searchTerms}"; } ];
            icon = "https://www.dictionary.com/94e56a525da4e9fe0cda.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@d" ];
          };
          "Thesaurus" = {
            urls = [ { template = "https://www.thesaurus.com/browse/{searchTerms}"; } ];
            icon = "https://www.thesaurus.com/0d297be7e698b98c9da8.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@t" ];
          };
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages?channel=unstable";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "Nix Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options?channel=unstable";
                params = [
                  {
                    name = "type";
                    value = "options";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };
          "NixOS Wiki" = {
            urls = [ { template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; } ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nw" ];
          };
          "MDN" = {
            urls = [ { template = "https://developer.mozilla.org/en-US/search?q={searchTerms}"; } ];
            icon = "https://developer.mozilla.org/favicon-48x48.bc390275e955dacb2e65.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@mdn" ];
          };
        };
      };

      # Bookmarks
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
                    name = "Drive";
                    url = "https://drive.google.com";
                  }
                ];
              }
              {
                name = "Proton";
                bookmarks = [
                  {
                    name = "Mail";
                    url = "https://mail.proton.me";
                  }
                  {
                    name = "Calendar";
                    url = "https://calendar.proton.me";
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
                    name = "ChatReplay";
                    url = "https://chatreplay.stream/subscriptions";
                  }
                  {
                    name = "iBroadcast";
                    url = "https://media.ibroadcast.com/";
                  }
                  {
                    name = "radioMii";
                    url = "https://radiomii.com/";
                  }
                  {
                    name = "BookFusion";
                    url = "https://www.bookfusion.com/bookshelf";
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
                    name = "last.fm";
                    url = "https://www.last.fm";
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
                    name = "Codeberg";
                    url = "https://codeberg.org/";
                  }
                  {
                    name = "Element";
                    url = "https://app.element.io/";
                  }
                  {
                    name = "feddit.uk";
                    url = "https://feddit.uk/";
                  }
                  {
                    name = "progamming.dev";
                    url = "https://programming.dev";
                  }
                  {
                    name = "pixelfed.social";
                    url = "https://pixelfed.social";
                  }
                  {
                    name = "mastodon.social";
                    url = "https://mastodon.social";
                  }
                  {
                    name = "LinkedIn";
                    url = "https://www.linkedin.com/";
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
                    name = "Ebay";
                    url = "https://www.ebay.co.uk/";
                  }
                  {
                    name = "Ocado";
                    url = "https://www.ocado.com/";
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
                    name = "Netlify";
                    url = "https://app.netlify.com/";
                  }
                  {
                    name = "Hover";
                    url = "https://www.hover.com/";
                  }
                ];
              }
              {
                name = "Research";
                bookmarks = [
                  {
                    name = "Google Scholar";
                    url = "https://scholar.google.co.uk/";
                  }
                  {
                    name = "Scopus";
                    url = "https://www.scopus.com/";
                  }
                  {
                    name = "Ebsco";
                    url = "https://research.ebsco.com/c/qgabbp/search";
                  }
                ];
              }
              {
                name = "University";
                bookmarks = [
                  {
                    name = "Outlook";
                    url = "https://outlook.office.com/mail/";
                  }
                  {
                    name = "OneDrive";
                    url = "https://portdotacdotuk-my.sharepoint.com/";
                  }
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
                    name = "Moodle Archive";
                    url = "https://moodlearchive.port.ac.uk";
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
                  {
                    name = "Learnworlds";
                    url = "https://cmp.learnworlds.com/start";
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
                  {
                    name = "Tesco Insurance";
                    url = "https://www.tescobank.com/";
                  }
                ];
              }
            ];
          }
        ];
      };
    };
  };
}
