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
      settings = {
        "accessibility.typeaheadfind.flashBar" = 0;
        "app.normandy.first_run" = false;
        "app.normandy.migrationsApplied" = 12;
        "app.shield.optoutstudies.enabled" = false;
        "browser.bookmarks.editDialog.confirmationHintShowCount" = 3;
        "browser.bookmarks.restore_default_bookmarks" = false;
        "browser.bookmarks.showMobileBookmarks" = false;
        "browser.contentblocking.category" = "strict";
        "browser.download.panel.shown" = true;
        "browser.download.viewableInternally.typeWasRegistered.avif" = true;
        "browser.download.viewableInternally.typeWasRegistered.webp" = true;
        "browser.eme.ui.firstContentShown" = true;
        "browser.newtab.extensionControlled" = true;
        "browser.newtab.privateAllowed" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "";
        "browser.newtabpage.activity-stream.showSearch" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.policies.applied" = true;
        "browser.protections_panel.infoMessage.seen" = true;
        "browser.rights.3.shown" = true;
        "browser.search.region" = "GB";
        "browser.search.suggest.enabled" = false;
        "browser.startup.couldRestoreSession.count" = 2;
        "browser.tabs.inTitlebar" = 0;
        "browser.topsites.blockedSponsors" = "[\"amazon\",\"vodafone\"]";
        "browser.uiCustomization.state" = "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"gdpr_cavi_au_dk-browser-action\",\"addon_darkreader_org-browser-action\",\"_c84d89d9-a826-4015-957b-affebd9eb603_-browser-action\",\"firefoxcolor_mozilla_com-browser-action\",\"_036a55b4-5e72-4d05-a06c-cba2dfcc134a_-browser-action\"],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"customizableui-special-spring1\",\"urlbar-container\",\"customizableui-special-spring2\",\"downloads-button\",\"unified-extensions-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"personal-bookmarks\"]},\"seen\":[\"save-to-pocket-button\",\"developer-button\",\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"gdpr_cavi_au_dk-browser-action\",\"addon_darkreader_org-browser-action\",\"_c84d89d9-a826-4015-957b-affebd9eb603_-browser-action\",\"firefoxcolor_mozilla_com-browser-action\",\"_036a55b4-5e72-4d05-a06c-cba2dfcc134a_-browser-action\"],\"dirtyAreaCache\":[\"nav-bar\",\"PersonalToolbar\",\"toolbar-menubar\",\"TabsToolbar\",\"unified-extensions-area\"],\"currentVersion\":19,\"newElementCount\":2}";
        "browser.urlbar.quicksuggest.migrationVersion" = 2;
        "browser.urlbar.quicksuggest.scenario" = "history";
        "browser.urlbar.tipShownCount.searchTip_onboard" = 4;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;
        "doh-rollout.doneFirstRun" = true;
        "doh-rollout.home-region" = "GB";
        "dom.forms.autocomplete.formautofill" = true;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
        "fission.experiment.max-origins.qualified" = true;
        "general.autoScroll" = true;
        "media.eme.enabled" = true;
        "media.videocontrols.picture-in-picture.video-toggle.has-used" = true;
        "network.dns.disablePrefetch" = true;
        "network.http.referer.disallowCrossSiteRelaxingDefault.top_navigation" = true;
        "network.http.speculative-parallel-limit" = 0;
        "network.predictor.enabled" = false;
        "network.prefetch-next" = false;
        "pdfjs.enabledCache.state" = true;
        "pdfjs.migrationVersion" = 2;
        "permissions.default.desktop-notification" = 2;
        "privacy.annotate_channels.strict_list.enabled" = true;
        "privacy.clearOnShutdown.cache" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "privacy.donottrackheader.enabled" = true;
        "privacy.history.custom" = true;
        "privacy.partition.network_state.ocsp_cache" = true;
        "privacy.purge_trackers.date_in_cookie_database" = "0";
        "privacy.query_stripping.enabled" = true;
        "privacy.query_stripping.enabled.pbmode" = true;
        "privacy.sanitize.pending" = "[{\"id\":\"shutdown\",\"itemsToClear\":[\"history\",\"formdata\",\"downloads\",\"sessions\"],\"options\":{}},{\"id\":\"newtab-container\",\"itemsToClear\":[],\"options\":{}}]";
        "privacy.sanitize.sanitizeOnShutdown" = true;
        "privacy.trackingprotection.emailtracking.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.userContext.enabled" = true;
        "privacy.userContext.extension" = "tridactyl.vim@cmcaine.co.uk";
        "privacy.userContext.ui.enabled" = true;
        "signon.rememberSignons" = false;
        "storage.vacuum.last.index" = 2;
        "toolkit.telemetry.pioneer-new-studies-available" = true;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "trailhead.firstrun.didSeeAboutWelcome" = true;
      };
    };
  };
}
