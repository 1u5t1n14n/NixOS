{ config, lib, ... }:

{

	programs.firefox = {
		enable = true;
		languagePacks = [ "de" "en-GB" ];
	};

	environment.sessionVariables = {
		MOZ_USE_XINPUT2 = "1";
		MOZ_ENABLE_WAYLAND = "1";
	};

}
