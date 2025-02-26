{ ... }:

{

	programs.firefox.enable = true;

	environment.sessionVariables = {
		MOZ_USE_XINPUT2 = "1";
		MOZ_ENABLE_WAYLAND = "1";
	};

}
