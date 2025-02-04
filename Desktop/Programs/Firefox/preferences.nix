{ ... }:

{

	programs.firefox.preferences = {
		# Basic
		"browser.aboutConfig.showWarning" = false;
		"browser.startup.page" = 0;

		# Preferences
		"browser.startup.homepage" = "about:blank";
		"browser.link.open_newwindow" = 1;
		"browser.toolbars.bookmarks.visibility" = "never";
		"browser.tabs.closeWindowWithLastTab" = false;
		"cookiebanners.bannerClicking.enabled" = 2;
		"browser.ctrlTab.recentlyUsedOrder" = true;
		"accessibility.browsewithcaret" = true;
		"browser.tabs.tabmanager.enabled" = false;
		"browser.tabs.searchclipboardfor.middleclick" = false;
		"privacy.userContext.newTabContainerOnLeftClick.enabled" = true;
		"ui.key.menuAccessKeyFocuses" = false;
		"browser.uitour.enabled" = false;
		"browser.download.start_downloads_in_tmp_dir" = true;
		"browser.ctrlTab.sortByRecentlyUsed" = true;
		"browser.tabs.hoverPreview.enabled" = true;
		"browser.tabs.hoverPreview.showThumbnails" = true;
		"browser.tabs.closeTabByDblclick" = true;
		"browser.tabs.warnOnCloseOtherTabs" = false;
		"browser.tabs.unloadTabInContextMenu" = true;
		
		# Disable Activity Stream on new windows and tab pages
		"browser.newtabpage.enabled" = false;
		"browser.newtab.preload" = false;
		"browser.newtabpage.activity-stream.feeds.telemetry" = false;
		"browser.newtabpage.activity-stream.telemetry" = false;
		"browser.newtabpage.activity-stream.feeds.snippets" = false;
		"browser.newtabpage.activity-stream.feeds.section.topstories" = false;
		"browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
		"browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
		"browser.newtabpage.activity-stream.showSponsored" = false;
		"browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
		"browser.newtabpage.activity-stream.default.sites" = false;

		# Geolocation
		"geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
		"geo.provider.use_gpsd" = false;
		"geo.provider.use_geoclue" = false;
		"browser.region.network.url" = "";
		"browser.region.update.enabled" = false;

		# Recommendations
		"app.update.auto" = false;
		"extensions.getAddons.showPane" = false;
		"extensions.htmlaboutaddons.recommendations.enabled" = false;
		"browser.discovery.enabled" = false;

		# Telemetry
		"datareporting.policy.dataSubmissionEnabled" = false;
		"datareporting.healthreport.uploadEnabled" = false;
		"toolkit.telemetry.enabled" = false;
		"toolkit.telemetry.unified" = false;
		"toolkit.telemetry.server" = "data:,";
		"toolkit.telemetry.archive.enabled" = false;
		"toolkit.telemetry.newProfilePing.enabled" = false;
		"toolkit.telemetry.shutdownPingSender.enabled" = false;
		"toolkit.telemetry.updatePing.enabled" = false;
		"toolkit.telemetry.bhrPing.enabled" = false;
		"toolkit.telemetry.firstShutdownPing.enabled" = false;
		"toolkit.telemetry.coverage.opt-out" = true;
		"toolkit.coverage.opt-out" = true;
		"toolkit.coverage.endpoint.base" = "";
		"browser.ping-centre.telemetry" = false;
		"beacon.enabled" = false;

		## Studies
		"app.shield.optoutstudies.enabled" = false;
		"app.normandy.enabled" = false;
		"app.normandy.api_url" = "";

		## Crash Reports
		"breakpad.reportURL" = "";
		"browser.tabs.crashReporting.sendReport" = false;

		## Network Checks
		"captivedetect.canonicalURL" = "";
		"network.captive-portal-service.enabled" = false;

		# Safebrowsing
		"browser.safebrowsing.malware.enabled" = false;
		"browser.safebrowsing.phishing.enabled" = false;
		"browser.safebrowsing.blockedURIs.enabled" = false;
		"browser.safebrowsing.provider.google4.gethashURL" = "";
		"browser.safebrowsing.provider.google4.updateURL" = "";
		"browser.safebrowsing.provider.google.gethashURL" = "";
		"browser.safebrowsing.provider.google.updateURL" = "";
		"browser.safebrowsing.provider.google4.dataSharingURL" = "";
		"browser.safebrowsing.downloads.enabled" = false;
		"browser.safebrowsing.downloads.remote.enabled" = false;
		"browser.safebrowsing.downloads.remote.url" = "";
		"browser.safebrowsing.downloads.remote.block_potentially_unwanted" = false;
		"browser.safebrowsing.downloads.remote.block_uncommon" = false;
		"browser.safebrowsing.allowOverride" = false;

		# Network
		"network.prefetch-next" = false;
		"network.dns.disablePrefetch" = true;
		"network.predictor.enabled" = false;
		"network.http.speculative-parallel-limit" = 0;
		"browser.places.speculativeConnect.enabled" = false;
		"network.dns.disableIPv6" = true;
		"network.gio.supported-protocols" = "";
		"network.file.disable_unc_paths" = true;
		"permissions.manager.defaultsUrl" = "";
		"network.IDN_show_punycode" = true;

		# Search Bar
		"browser.search.suggest.enabled" = false;
		"browser.urlbar.suggest.searches" = false;
		"browser.fixup.alternate.enabled" = false;
		"browser.urlbar.trimURLs" = false;
		"browser.urlbar.speculativeConnect.enabled" = false;
		"browser.formfill.enable" = false;
		"extensions.formautofill.addresses.enabled" = false;
		"extensions.formautofill.available" = "off";
		"extensions.formautofill.creditCards.available" = false;
		"extensions.formautofill.creditCards.enabled" = false;
		"extensions.formautofill.heuristics.enabled" = false;
		"browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
		"browser.urlbar.suggest.quicksuggest.sponsored" = false;
		"browser.urlbar.clipboard.featureGate" = false;

		# Passwords
		"signon.rememberSignons" = false;
		"signon.autofillForms" = false;
		"signon.formlessCapture.enabled" = false;
		"network.auth.subresource-http-auth-allow" = 1;

		# Memory
		"browser.cache.disk.enable" = false;
		"browser.sessionstore.privacy_level" = 2;
		"browser.sessionstore.resume_from_crash" = false;
		"browser.pagethumbnails.capturing_disabled" = true;
		"browser.shell.shortcutFavicons" = false;
		"browser.helperApps.deleteTempFileOnExit" = true;

		# HTTPS
		"dom.security.https_only_mode" = true;
		"dom.security.https_only_mode_send_http_background_request" = false;
		"dom.disable_window_move_resize" = true;
		"browser.xul.error_pages.expert_bad_cert" = true;
		"security.tls.enable_0rtt_data" = false;
		"security.OCSP.require" = true;
		"security.pki.sha1_enforcement_level" = 1;
		"security.cert_pinning.enforcement_level" = 2;
		"security.remote_settings.crlite_filters.enabled" = true;
		"security.pki.crlite_mode" = 2;

		# Headers
		"network.http.referer.XOriginPolicy" = 2;
		"network.http.referer.XOriginTrimmingPolicy" = 2;

		# Media
		"media.autoplay.default" = 5;

		# Download
		"browser.download.useDownloadDir" = false;
		"browser.download.manager.addToRecentDocs" = false;
		"browser.download.alwaysOpenPanel" = false;
		"browser.download.always_ask_before_handling_new_types" = true;

		# Cookies
		"browser.contentblocking.category" = "strict";
		"privacy.partition.serviceWorkers" = true;
		"privacy.partition.always_partition_third_party_non_cookie_storage" = true;
		"privacy.partition.always_partition_third_party_non_cookie_storage.exempt_sessionstorage" = true;

		# UI
		"dom.disable_open_during_load" = true;
		"dom.popup_allowed_events" = "click dblclick mousedown pointerdown";
		"extensions.pocket.enabled" = false;
		"extensions.Screenshots.disabled" = true;
		"pdfjs.enableScripting" = false;
		"pdfjs.disabled" = false;
		"privacy.userContext.enabled" = true;
		"privacy.userContext.ui.enabled" = true;
		"browser.link.force_default_user_context_id_for_external_opens" = true;
		"layout.css.visited_links_enabled" = false;

		# Extensions
		"extensions.enabledScopes" = 5;
		"extensions.webextensions.restrictedDomains" = "";
		"extensions.postDownloadThirdPartyPrompt" = false;

		# Fingerprinting
		"privacy.resistFingerprinting" = true;
		"privacy.resistFingerprinting.block_mozAddonManager" = true;
	};

}
