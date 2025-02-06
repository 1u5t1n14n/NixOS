{ ... }:

{

	programs.firefox.preferences = {
		# New Tab Page
		"browser.aboutConfig.showWarning" = false;
		"browser.startup.page" = 0;
		"browser.startup.homepage" = "about:blank";
		"browser.newtabpage.enabled" = false;
		"browser.newtabpage.activity-stream.showSponsored" = false;
		"browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
		"browser.newtabpage.activity-stream.default.sites" = "";
		"browser.newtabpage.activity-stream.feeds.snippets" = false;

		# Geolocation
		"geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
		"geo.provider.use_geoclue" = false;
		"browser.region.network.url" = "";
		"browser.region.update.enabled" = false;

		# Make Firefox more quiet
		"extensions.getAddons.showPane" = false;
		"extensions.htmlaboutaddons.recommendations.enabled" = false;
		"browser.discovery.enabled" = false;
		"browser.shopping.experience2023.enabled" = false;

		# Telemetry
		"datareporting.policy.dataSubmissionEnabled" = false;
		"datareporting.healthreport.uploadEnabled" = false;
		"toolkit.telemetry.unified" = false;
		"toolkit.telemetry.enabled" = false;
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
		"browser.newtabpage.activity-stream.feeds.telemetry" = false;
		"browser.newtabpage.activity-stream.telemetry" = false;

		# Studies
		"app.shield.optoutstudies.enabled" = false;
		"app.normandy.enabled" = false;
		"app.normandy.api_url" = "";

		# Crash Reports
		"breakpad.reportURL" = "";
		"browser.tabs.crashReporting.sendReport" = false;
		"browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
		"browser.crashReports.unsubmittedCheck.enabled" = false;
		"browser.sessionstore.resume_from_crash" = false;

		# Network
		"captivedetect.canonicalURL" = "";
		"network.captive-portal-service.enabled" = false;
		"network.connectivity-service.enabled" = false;

		"network.prefetch-next" = false;
		"network.dns.disablePrefetch" = true;
		"network.dns.disablePrefetchFromHTTPS" = true;
		"network.predictor.enabled" = false;
		"network.predictor.enable-prefetch" = false;
		"network.http.speculative-parallel-limit" = 0;
		"browser.send_pings" = false;

		# Safe Browsing
		"browser.safebrowsing.downloads.remote.enabled" = false;
		"browser.safebrowsing.allowOverride" = false;

		# Proxy
		"network.proxy.socks_remote_dns" = true;
		"network.file.disable_unc_paths" = true;
		"network.gio.supported-protocols" = "";

		# Search
		"browser.urlbar.placeholderName" = "Search the Web";
		"browser.urlbar.speculativeConnect.enabled" = false;
		"browser.urlbar.quicksuggest.enabled" = false;
		"browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
		"browser.urlbar.suggest.quicksuggest.sponsored" = false;
		"browser.search.suggest.enabled" = false;
		"browser.urlbar.suggest.searches" = false;
		"browser.urlbar.trending.featureGate" = false;
		"browser.urlbar.addons.featureGate" = false;
		"browser.urlbar.fakespot.featureGate" = false;
		"browser.urlbar.mdn.featureGate" = false;
		"browser.urlbar.pocket.featureGate" = false;
		"browser.urlbar.weather.featureGate" = false;
		"browser.urlbar.yelp.featureGate" = false;
		"browser.urlbar.clipboard.featureGate" = false;
		"layout.css.visited_links_enabled" = false;

		# Fill
		"browser.formfill.enable" = false;
		"signon.autofillForms" = false;
		"signon.formlessCapture.enabled" = false;
		"signon.rememberSignons" = false;
		/*
			Maybe isn't possible when syncing (im trying)
			"network.auth.subresource-http-auth-allow" = 1;
		*/

		# Disk
		"browser.cache.disk.enable" = false;
		"browser.privatebrowsing.forceMediaMemoryCache" = true;
		"browser.sessionstore.privacy_level" = 2;
		"browser.shell.shortcutFavicons" = false;

		# HTTPS
		"security.ssl.require_safe_negotiation" = true;
		"security.tls.enable_0rtt_data" = false;
		"security.OCSP.enabled" = 1;
		"security.OCSP.require" = true;

		"security.cert_pinning.enforcement_level" = 2;
		"security.remote_settings.crlite_filters.enabled" = true;
		"security.pki.crlite_mode" = 2;

		"dom.security.https_only_mode" = true;
		"dom.security.https_only_mode_send_http_background_request" = false;

		# User Interface
		"security.ssl.treat_unsafe_negotiation_as_broken" = true;
		"browser.xul.error_pages.expert_bad_cert" = true;
		"layout.css.prefers-color-scheme.content-override" = 0;
		"ui.key.menuAccessKeyFocuses" = false;
		"cookiebanners.bannerClicking.enabled" = 2;

		# Referers
		"network.http.referer.XOriginTrimmingPolicy" = 2;
		"media.autoplay.default" = 5;

		# Containers
		"privacy.userContext.enabled" = true;
		"privacy.userContext.ui.enabled" = true;
		"privacy.userContext.newTabContainerOnLeftClick.enabled" = true;
		"browser.link.force_default_user_context_id_for_external_opens" = true;

		# Miscellaneous
		"dom.disable_window_move_resize" = true;
		"browser.uitour.enabled" = false;
		"devtools.debugger.remote-enabled" = false;
		"permissions.manager.defaultsUrl" = "";
		"network.IDN_show_punycode" = true;
		"pdfjs.disabled" = false;
		"pdfjs.enableScripting" = false;
		"browser.tabs.searchclipboardfor.middleclick" = false;
		"browser.contentanalysis.enabled" = false;
		"browser.contentanalysis.default_result" = 0;

		# Downloads
		"browser.download.useDownloadDir" = false;
		"browser.download.alwaysOpenPanel" = false;
		"browser.download.manager.addToRecentDocs" = false;
		"browser.download.always_ask_before_handling_new_types" = true;
		"browser.download.start_downloads_in_tmp_dir" = true;
		"browser.helperApps.deleteTempFileOnExit" = true;

		# Extensions
		"extensions.enabledScopes" = 5;
		"extensions.postDownloadThirdPartyPrompt" = false;
		"extensions.pocket.enabled" = false;

		# ETP
		"browser.contentblocking.category" = "strict";

		# Sanitizing
		"privacy.clearOnShutdown.cookies" = true;
		"privacy.clearOnShutdown.offlineApps" = true;
		"privacy.clearOnShutdown.cache" = true;
		"privacy.clearOnShutdown_v2.cache" = true;
		"privacy.clearOnShutdown.downloads" = true;
		"privacy.clearOnShutdown.formdata" = true;

		# Fingerprinting
		"privacy.resistFingerprinting.block_mozAddonManager" = true;
		"browser.link.open_newwindow" = 1;
		"browser.link.open_newwindow.restriction" = 0;
		"widget.non-native-theme.use-theme-accent" = false;
	};

}
