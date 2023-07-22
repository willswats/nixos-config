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
    profiles.will = {
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
      extraConfig = ''
        user_pref("app.shield.optoutstudies.enabled", false); # Opt out of studies
        user_pref("browser.bookmarks.restore_default_bookmarks", false); # Don't restore default bookmarks
        user_pref("browser.bookmarks.showMobileBookmarks", false); # Don't show mobile bookmarks
        user_pref("browser.contentblocking.category", "strict"); # Strict content blocking
        user_pref("browser.newtab.extensionControlled", true); # Extension controlled new tab page
        user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false); # Disable top stories
        user_pref("browser.newtabpage.activity-stream.feeds.topsites", false); # Disable top sites
        user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned", ""); # Remove pinned top site search shortcuts
        user_pref("browser.newtabpage.activity-stream.showSearch", false); # Disable search on new tab page
        user_pref("browser.newtabpage.activity-stream.showSponsored", false); # Disable sponsored
        user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false); # Disable sponsored top sites
        user_pref("browser.policies.applied", true);
        user_pref("browser.protections_panel.infoMessage.seen", true);
        user_pref("browser.rights.3.shown", true);
        user_pref("browser.search.region", "GB"); # Search region
        user_pref("browser.search.suggest.enabled", false); # Disable search suggestions
        user_pref("browser.startup.couldRestoreSession.count", 2);
        user_pref("browser.tabs.inTitlebar", 0);
        user_pref("browser.topsites.blockedSponsors", "[\"amazon\",\"vodafone\"]");
        user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"gdpr_cavi_au_dk-browser-action\",\"addon_darkreader_org-browser-action\",\"_c84d89d9-a826-4015-957b-affebd9eb603_-browser-action\",\"firefoxcolor_mozilla_com-browser-action\",\"_036a55b4-5e72-4d05-a06c-cba2dfcc134a_-browser-action\"],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"customizableui-special-spring1\",\"urlbar-container\",\"customizableui-special-spring2\",\"downloads-button\",\"unified-extensions-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"personal-bookmarks\"]},\"seen\":[\"save-to-pocket-button\",\"developer-button\",\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"gdpr_cavi_au_dk-browser-action\",\"addon_darkreader_org-browser-action\",\"_c84d89d9-a826-4015-957b-affebd9eb603_-browser-action\",\"firefoxcolor_mozilla_com-browser-action\",\"_036a55b4-5e72-4d05-a06c-cba2dfcc134a_-browser-action\"],\"dirtyAreaCache\":[\"nav-bar\",\"PersonalToolbar\",\"toolbar-menubar\",\"TabsToolbar\",\"unified-extensions-area\"],\"currentVersion\":19,\"newElementCount\":2}");
        user_pref("browser.urlbar.tipShownCount.searchTip_onboard", 4);
        user_pref("datareporting.healthreport.uploadEnabled", false); # Disable health report
        user_pref("doh-rollout.doneFirstRun", true);
        user_pref("doh-rollout.home-region", "GB");
        user_pref("dom.forms.autocomplete.formautofill", true);
        user_pref("dom.security.https_only_mode", true); # HTTPS only mode
        user_pref("dom.security.https_only_mode_ever_enabled", true); # Always HTTPS only mode
        user_pref("extensions.formautofill.creditCards.enabled", false); # Disable auto fill credit cards
        user_pref("general.autoScroll", true); # Enable auto scroll
        user_pref("media.eme.enabled", true);
        user_pref("network.dns.disablePrefetch", true);
        user_pref("network.http.referer.disallowCrossSiteRelaxingDefault.top_navigation", true);
        user_pref("network.http.speculative-parallel-limit", 0);
        user_pref("network.predictor.enabled", false);
        user_pref("network.prefetch-next", false);
        user_pref("permissions.default.desktop-notification", 2); # Disable desktop notifications by default
        user_pref("privacy.annotate_channels.strict_list.enabled", true);
        user_pref("privacy.history.custom", true); # Custom history settings
        user_pref("privacy.clearOnShutdown.cache", false); # Clear cache on shutdown
        user_pref("privacy.clearOnShutdown.cookies", false); # Clear cookies on shutdown
        user_pref("privacy.donottrackheader.enabled", true); # Send do not track header
        user_pref("privacy.partition.network_state.ocsp_cache", true);
        user_pref("privacy.purge_trackers.date_in_cookie_database", "0");
        user_pref("privacy.query_stripping.enabled", true);
        user_pref("privacy.query_stripping.enabled.pbmode", true);
        user_pref("privacy.sanitize.pending", "[{\"id\":\"shutdown\",\"itemsToClear\":[\"history\",\"formdata\",\"downloads\",\"sessions\"],\"options\":{}},{\"id\":\"newtab-container\",\"itemsToClear\":[],\"options\":{}}]");
        user_pref("privacy.sanitize.sanitizeOnShutdown", true);
        user_pref("privacy.trackingprotection.enabled", true); # Tracking protection
        user_pref("privacy.trackingprotection.emailtracking.enabled", true); # Email tracking protection
        user_pref("privacy.trackingprotection.socialtracking.enabled", true); # Social tracking protection
        user_pref("signon.rememberSignons", false);
        user_pref("toolkit.telemetry.pioneer-new-studies-available", true);
        user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
        user_pref("trailhead.firstrun.didSeeAboutWelcome", true);
      '';
    };
  };
}
