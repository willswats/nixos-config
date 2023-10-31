{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      cfg = {
        # Tridactyl native connector
        enableTridactylNative = true;
      };
    };
    profiles.default = {
      id = 0;
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
                name = "Bitwarden";
                url = "https://vault.bitwarden.com/";
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
                name = "myNoise";
                url = "https://mynoise.net/";
              }
              {
                name = "AniWave";
                url = "https://aniwave.to/";
              }
              {
                name = "MangaDex";
                url = "https://mangadex.org";
              }
              {
                name = "movie-web";
                url = "https://movie-web.app/";
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
            name = "Social";
            bookmarks = [
              {
                name = "Discord";
                url = "https://discord.com/app";
              }
              {
                name = "Element";
                url = "https://app.element.io";
              }
              {
                name = "GitHub";
                url = "https://github.com/";
              }
              {
                name = "LinkedIn";
                url = "https://www.linkedin.com/";
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
            name = "Nix";
            bookmarks = [
              {
                name = "NixOS Search";
                url = "https://search.nixos.org/packages";
              }
              {
                name = "Home Manager";
                url =
                  "https://nix-community.github.io/home-manager/options.html";
              }
              {
                name = "nixvim docs";
                url = "https://nix-community.github.io/nixvim/";
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
                url = "https://portal.myport.ac.uk/student/timetable";
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
            name = "Education";
            bookmarks = [
              {
                name = "Harvard Referencing";
                url =
                  "https://librarydevelopment.group.shef.ac.uk/referencing/harvard.html";
              }
              {
                name = "Scribbr";
                url = "https://www.scribbr.co.uk/referencing/generator/";
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
            name = "Other";
            bookmarks = [{
              name = "williamwatson.dev";
              url = "https://williamwatson.dev";
            }];
          }
        ];
      }];
      settings = {
        "extensions.pocket.enabled" = false; # Disable pocket
        "extensions.formautofill.creditCards.enabled" =
          false; # Disable autofill credit cards
        "browser.contentblocking.category" = "strict"; # Content blocking strict
        "browser.tabs.firefox-view" = false; # Disable firefox view
        "browser.aboutConfig.showWarning" =
          false; # Disable about config warning
        "browser.toolbars.bookmarks.visibility" =
          "newtab"; # Only show toolbar on new tab
        "browser.newtabpage.activity-stream.showSearch" =
          false; # Don't show search on new tab page
        "browser.newtabpage.activity-stream.feeds.topsites" =
          false; # Disable new tab page top sites
        "browser.newtabpage.activity-stream.feeds.section.topstories" =
          false; # Disable new tab page recommended by pocket
        "browser.newtabpage.activity-stream.showSponsored" =
          false; # Disable new tab page sponsored
        "browser.newtabpage.activity-stream.showSponsoredTopSites" =
          false; # Disable new tab page sponsored top sites
        "browser.newtabpage.blocked" = ''
          {"R8wYCmScoyV0xHr6e1KJng==":1,"c/GpBaAESHY/bXEx/uourw==":1,"Z3sawLcfnygbilXeU5fdHg==":1,"6qTsCBZaEVXWrWxdXn5pmQ==":1,"+CUypgsitL9L0VmPZ0t22g==":1,"c9lsKElwtRd9PbcOXhz3dA==":1,"otFC2oJcatFNwWRBjMU7YA==":1,"26UbzFJ7qT9/4DhodHKA1Q==":1,"4gPpjkxgZzXPVtuEoAL9Ig==":1,"gLv0ja2RYVgxKdp0I5qwvA==":1,"0GuysDfjFIJXq6QVZ2C5YA==":1,"FX7dGM0Jj2q2tTyEv9oaUQ==":1,"BRX66S9KVyZQ1z3AIk0A7w==":1}''; # Remove the default pinned websites from the new tab page (appears in search)
        "browser.uiCustomization.state" = ''
          {"placements":{"PersonalToolbar":["personal-bookmarks"]}}''; # Remove "Import bookmarks"
        "browser.search.suggest.enabled" = false; # Disable search suggestions
        "media.eme.enabled" = true; # Play DRM controlled content
        "permissions.default.desktop-notification" =
          2; # Disable desktop notifications by default
        "privacy.donottrackheader.enabled" =
          true; # Always send do not track header
        "privacy.history.custom" = true; # Custom history settings
        "privacy.clearOnShutdown.cache" = false; # Don't clear cache on shutdown
        "privacy.clearOnShutdown.cookies" =
          false; # Don't clear cookies on shutdown
        "privacy.sanitize.sanitizeOnShutdown" = true; # Clear on shutdown
        "datareporting.healthreport.uploadEnabled" =
          false; # Disable health report
        "app.shield.optoutstudies.enabled" = false; # Opt out of studies
        "dom.security.https_only_mode" = true; # Enable HTTPS only mode
        "dom.security.https_only_mode_ever_enabled" =
          true; # Always enable HTTPS only mode
        "signon.rememberSignons" = false; # Don't ask to save passwords
        "general.autoScroll" = true; # Enable auto scroll
        "accessibility.typeaheadfind.enablesound" =
          false; # Disable sound effect on failed "Find in page"
        "layout.css.has-selector.enabled" = true; # Required by Enhancer for YouTube's "Hide Shorts" setting
      };
    };
  };
}
