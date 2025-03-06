{ ... }:

{

	programs.firefox.profiles.Firefox.settings = {
		# This is just copied from the arkenfox Project.
		# Take a look at it for more details.

		# I am going to use the generated user.js on Windows too.
		# So do not wonder as to why I included Windows-specific
		# options.

		"browser.aboutConfig.showWarning" = false;

		# Startup
		"browser.startup.page" = 0;
		"browser.startup.homepage" = "about:blank";
		"browser.newtabpage.enabled" = false;
		"browser.newtabpage.activity-stream.showSponsored" = false;
		"browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
		"browser.newtabpage.activity-stream.default.sites" = false;
		"browser.newtabpage.activity-stream.feeds.telemetry" = false;
		"browser.newtabpage.activity-stream.telemetry" = false;

		# Geolocation
		"geo.provider.ms-windows-location" = false;
		"geo.provider.use_geoclue" = false;

		# Recomendations
		"extensions.getAddons.showPane" = false;
		"extensions.htmlaboutaddons.recommendations.enabled" = false;
		"browser.discovery.enabled" = false;
		"browser.shopping.experience2023.enabled" = false;

		# Telemetry
		"datareporting.policy.dataSubmissionEnabled" = false;
		"datareporting.healthreport.uploadEnabled" = false;
		"toolkit.telemetry.unified" = false;
		"toolkit.telemetry.enabled" = false;
		"toolkit.telemetry.server" = false;
		"toolkit.telemetry.archive.enabled" = false;
		"toolkit.telemetry.newProfilePing.enabled" = false;
		"toolkit.telemetry.shutdownPingSender.enabled" = false;
		"toolkit.telemetry.updatePing.enabled" = false;
		"toolkit.telemetry.bhrPing.enabled" = false;
		"toolkit.telemetry.firstShutdownPing.enabled" = false;
		"toolkit.telemetry.coverage.opt-out" = true;
		"toolkit.coverage.opt-out" = true;
		"toolkit.coverage.endpoint.base" = "";

		# Studies
		"app.shield.optoutstudies.enabled" = false;
		"app.normandy.enabled" = false;
		"app.normandy.api_url" = "";
		
		# Crash Reports
		"breakpad.reportURL" = "";
		"browser.tabs.crashReporting.sendReport" = false;
		"browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

		"captivedetect.canonicalURL" = "";
		"network.captive-portal-service.enabled" = false;
		"network.connectivity-service.enabled" = false;

		"browser.safebrowsing.downloads.remote.enabled" = false;
		"browser.safebrowsing.downloads.remote.url" = "";

		# Implicit Outbound
		network.prefetch-next
		"network.dns.disablePrefetch" = true;
		"network.dns.disablePrefetchFromHTTPS" = true;
		"network.predictor.enabled" = false;
		"network.predictor.enable-prefetch" = false;
		"network.http.speculative-parallel-limit" = 0;
		"browser.places.speculativeConnect.enabled" = false;
		"browser.send_pings" = false;

		# DNS DoH Proxy Socks
		"network.proxy.socks_remote_dns" = true;
		"network.file.disable_unc_paths" = true;
		"network.gio.supported-protocols" = "";

		# Search
		"browser.urlbar.speculativeConnect.enabled" = false;
		#"browser.urlbar.quicksuggest.enabled" = false;
		"browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
		"browser.urlbar.suggest.quicksuggest.sponsored" = false;
		#"browser.search.suggest.enabled" = false;
		#"browser.urlbar.suggest.searches" = false;
		"browser.urlbar.trending.featureGate" = false;
		"browser.urlbar.addons.featureGate" = false;
		"browser.urlbar.fakespot.featureGate" = false;
		"browser.urlbar.mdn.featureGate" = false;
		"browser.urlbar.pocket.featureGate" = false;
		"browser.urlbar.weather.featureGate" = false;
		"browser.urlbar.yelp.featureGate" = false;
		"browser.urlbar.clipboard.featureGate" = false;
		
		"browser.formfill.enable" = false;
		"browser.urlbar.suggest.engines" = false;
		"layout.css.visited_links_enabled" = false;
		
		# Passwords
		"signon.autofillForms" = false;
		"signon.formlessCapture.enabled" = false;
		"network.auth.subresource-http-auth-allow" = 1;

		# Disk Avoidance
		browser.cache.disk.enable
		"browser.privatebrowsing.forceMediaMemoryCache" = true;
		"media.memory_cache_max_size" = 65536;
		"browser.sessionstore.privacy_level" = 2;
		"toolkit.winRegisterApplicationRestart" = false;
		"browser.shell.shortcutFavicons" = false;

		# HTTPS
		"security.ssl.require_safe_negotiation" = true;
		security.tls.enable_0rtt_data

		"security.OCSP.enabled" = 1;
		"security.OCSP.require" = true;

		"security.cert_pinning.enforcement_level" = 2;
		"security.remote_settings.crlite_filters.enabled" = true;
		"security.pki.crlite_mode" = 2;

		"dom.security.https_only_mode" = true;
		"dom.security.https_only_mode_send_http_background_request" = false;
		
		"security.ssl.treat_unsafe_negotiation_as_broken" = true;
		"browser.xul.error_pages.expert_bad_cert" = true;

		# Referers
		"network.http.referer.XOriginTrimmingPolicy" = 2;

		# Containers
		"privacy.userContext.enabled" = true;
		"privacy.userContext.ui.enabled" = true;
		browser.link.force_default_user_context_id_for_external_opens
		"extensions.autoDisableScopes" = 0;

		# Plugins
		"media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
		"media.peerconnection.ice.default_address_only" = true;

		# DOM
		"dom.disable_window_move_resize" = true;

		# Miscellaneous
		"browser.download.start_downloads_in_tmp_dir" = true;
		"browser.helperApps.deleteTempFileOnExit" = true;
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
		"extensions.postDownloadThirdPartyPrompt" = false;
		"extensions.webextensions.restritedDomains" = "";

		# ETP
		"browser.contentblocking.category" = "strict";

		# Sanitize
		"privacy.clearOnShutdown.cache" = true;
		"privacy.clearOnShutdown_v2.cache" = true;
		"privacy.clearOnShutdown.downloads" = true;
		"privacy.clearOnShutdown.formdata" = true;
		"privacy.clearOnShutdown.history" = true;
		"privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = true;
		
		"privacy.clearOnShutdown.cookies" = true;
		"privacy.clearOnShutdown.offlineApps" = true;
		"privacy.clearOnShutdown.sessions" = false;
		"privacy.clearOnShutdown_v2.cookiesAndStorage" = true;
		
		"privacy.clearSiteData.cache" = true;
		"privacy.clearSiteData.cookiesAndStorage" = false;
		"privacy.clearSiteData.historyFormDataAndDownloads" = true;
		
		"privacy.sanitize.timeSpan" = 0;

		# Fingerprinting
		"privacy.resistFingerprinting.block_mozAddonManager" = true;
		"browser.link.open_newwindow" = 1;
		"browser.link.open_newwindow.restriction" = 0;

		# Preferences
		"browser.download.folderList" = 2;
		"dom.popup_allowed_events" = "click dblclick mousedown pointerdown";
		#"keyword.enabled" = false;
		"browser.startup.homepage_override.mstone" = "ignore";
	};

}
