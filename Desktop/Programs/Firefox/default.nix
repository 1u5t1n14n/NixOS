{ pkgs, inputs, ... }:

{

	programs.firefox.enable = true;

	environment.systemPackages = [
		inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
	];

	environment.sessionVariables = {
		MOZ_USE_XINPUT2 = "1";
		MOZ_ENABLE_WAYLAND = "1";
	};

}
