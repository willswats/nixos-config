{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ web-ext ];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      nativeMessagingHosts = [
        # Tridactyl native connector
        pkgs.tridactyl-native
      ];
    };
    profiles.default = {
      id = 0;
      # Find extensions here: https://nur.nix-community.org/repos/rycee/
      # Request new extensions here: https://gitlab.com/rycee/nur-expressions/
      extensions = with config.nur.repos.rycee.firefox-addons; [
        ublock-origin
        consent-o-matic
        sponsorblock
        darkreader
        tridactyl
        bitwarden
        translate-web-pages
        wayback-machine
        mal-sync
        return-youtube-dislikes
        betterttv
        youtube-alternative-switch
        (
          buildFirefoxXpiAddon
            {
              pname = "zotero-connector";
              version = "5.0.114";
              addonId = "zotero@chnm.gmu.edu";
              url = "https://download.zotero.org/connector/firefox/release/Zotero_Connector-5.0.114.xpi";
              sha256 = "1g9d991m4vfj5x6r86sw754bx7r4qi8g5ddlqp7rcw6wrgydhrhw";
              meta = { };
            }
        )
      ];
      search = {
        force = true;
        default = "DuckDuckGo";
        engines = {
          "Google".metaData.hidden = true;
          "Bing".metaData.hidden = true;
          "Amazon.co.uk".metaData.hidden = true;
          "eBay".metaData.hidden = true;
          "Wikipedia (en)".metaData.hidden = true;
        };
      };
      bookmarks = [{
        toolbar = true;
        bookmarks = [
          {
            name = "Utilities";
            bookmarks = [
              {
                name = "Gmail";
                url = "https://mail.google.com/";
              }
              {
                name = "Calendar";
                url = "https://calendar.google.com/";
              }
              {
                name = "Contacts";
                url = "https://contacts.google.com/";
              }
              {
                name = "Maps";
                url = "https://maps.google.com/";
              }
              {
                name = "Drive";
                url = "https://drive.google.com/";
              }
              {
                name = "Dropbox";
                url = "https://www.dropbox.com/home";
              }
              {
                name = "Paypal";
                url = "https://www.paypal.com/myaccount/summary";
              }
              {
                name = "AnonAddy";
                url = "https://app.anonaddy.com/";
              }
              {
                name = "Reactive Resume";
                url = "https://rxresu.me/dashboard";
              }
            ];
          }
          {
            name = "Media";
            bookmarks = [
              {
                name = "YouTube";
                url = "https://www.youtube.com/feed/subscriptions";
              }
              {
                name = "Twitch";
                url = "https://www.twitch.tv/";
              }
              {
                name = "ChatReplay";
                url = "https://chatreplay.stream/subscriptions";
              }
              {
                name = "Aniwave";
                url = "https://aniwave.to/";
              }
              {
                name = "MangaDex";
                url = "https://mangadex.org";
              }
              {
                name = "Google Play Books";
                url = "https://play.google.com/books";
              }
              {
                name = "myNoise";
                url = "https://mynoise.net";
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
                name = "TMDB";
                url = "https://www.themoviedb.org/";
              }
              {
                name = "Goodreads";
                url = "https://www.goodreads.com/";
              }
              {
                name = "AlternativeTo";
                url = "https://alternativeto.net/";
              }
              {
                name = "ProtonDB";
                url = "https://www.protondb.com/";
              }
            ];
          }
          {
            name = "Development";
            bookmarks = [
              {
                name = "NixOS Search";
                url = "https://search.nixos.org/packages";
              }
              {
                name = "Home Manager";
                url =
                  "https://nix-community.github.io/home-manager/options.xhtml";
              }
              {
                name = "nixvim";
                url = "https://nix-community.github.io/nixvim/";
              }
              {
                name = "Hyprland";
                url = "https://wiki.hyprland.org/";
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
                url = "https://lemmy.world/";
              }
            ];
          }
          {
            name = "Gaming";
            bookmarks = [
              {
                name = "osu!";
                url = "https://osu.ppy.sh/home";
              }
              {
                name = "TETR.IO";
                url =
                  "https://tetr.io/";
              }
              {
                name = "lichess.org";
                url = "https://lichess.org/";
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
            name = "Learn";
            bookmarks = [
              {
                name = "Wikipedia";
                url = "https://www.wikipedia.org/";
              }
              {
                name = "Dictionary";
                url = "https://www.dictionary.com/";
              }
              {
                name = "Thesaurus";
                url = "https://www.thesaurus.com/";
              }
            ];
          }
          {
            name = "Downloads";
            bookmarks = [
              {
                name = "Vimm's Lair";
                url = "https://vimm.net/";
              }
              {
                name = "Anna's Archive";
                url = "https://annas-archive.org/";
              }
              {
                name = "Nyaa";
                url = "https://nyaa.si/";
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
                name = "Learning Catalytics";
                url = "https://learningcatalytics.com/class_sessions";
              }
              {
                name = "Virtual Machine";
                url = "https://uop-1-server-per-student-prod.appspot.com/instance/get";
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
                name = "Spotify Dedup";
                url = "https://spotify-dedup.com/";
              }
            ];
          }
        ];
      }];
      settings = {
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
        "browser.newtabpage.blocked" = ''{"R8wYCmScoyV0xHr6e1KJng==":1,"c/GpBaAESHY/bXEx/uourw==":1,"Z3sawLcfnygbilXeU5fdHg==":1,"6qTsCBZaEVXWrWxdXn5pmQ==":1,"+CUypgsitL9L0VmPZ0t22g==":1,"c9lsKElwtRd9PbcOXhz3dA==":1,"otFC2oJcatFNwWRBjMU7YA==":1,"26UbzFJ7qT9/4DhodHKA1Q==":1,"4gPpjkxgZzXPVtuEoAL9Ig==":1,"gLv0ja2RYVgxKdp0I5qwvA==":1,"0GuysDfjFIJXq6QVZ2C5YA==":1,"FX7dGM0Jj2q2tTyEv9oaUQ==":1,"BRX66S9KVyZQ1z3AIk0A7w==":1}''; # Remove the default pinned websites from the new tab page (appears in search)
        "browser.uiCustomization.state" = ''{"placements":{"PersonalToolbar":["personal-bookmarks"]}}''; # Remove "Import bookmarks"
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
      };
    };
  };

  xdg.mimeApps = {
    defaultApplications = {
      "application/pdf" = [ "firefox.desktop" ]; # pdf
      # Set firefox as the default browser
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];
    };
  };
}
