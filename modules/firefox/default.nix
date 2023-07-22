{ config, pkgs, ... }:

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
      settings = {
        "extensions.pocket.enabled" = false; # Disable pocket
        "extensions.formautofill.creditCards.enabled" = false; # Disable autofill credit cards
        "browser.contentblocking.category" = "strict"; # Content blocking strict
        "browser.tabs.firefox-view" = false; # Disable firefox view
        "browser.aboutConfig.showWarning" = false; # Disable about config warning
        "browser.newtabpage.activity-stream.showSearch" = false; # Don't show search on new tab page
        "browser.newtabpage.activity-stream.feeds.topsites" = false; # Disable new tab page top sites
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false; # Disable new tab page recommended by pocket
        "browser.newtabpage.activity-stream.showSponsored" = false; # Disable new tab page sponsored
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false; # Disable new tab page sponsored top sites
        "browser.newtabpage.blocked" = "{\"R8wYCmScoyV0xHr6e1KJng==\":1,\"c/GpBaAESHY/bXEx/uourw==\":1,\"Z3sawLcfnygbilXeU5fdHg==\":1,\"6qTsCBZaEVXWrWxdXn5pmQ==\":1,\"+CUypgsitL9L0VmPZ0t22g==\":1,\"c9lsKElwtRd9PbcOXhz3dA==\":1,\"otFC2oJcatFNwWRBjMU7YA==\":1,\"26UbzFJ7qT9/4DhodHKA1Q==\":1,\"4gPpjkxgZzXPVtuEoAL9Ig==\":1,\"gLv0ja2RYVgxKdp0I5qwvA==\":1,\"0GuysDfjFIJXq6QVZ2C5YA==\":1,\"FX7dGM0Jj2q2tTyEv9oaUQ==\":1,\"BRX66S9KVyZQ1z3AIk0A7w==\":1}"; # Remove the default pinned websites from the new tab page (appears in search)
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
      };
    };
  };
}
