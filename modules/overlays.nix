{ ... }:

{

	# Newest Version of morewaita-icon-theme
	nixpkgs.overlays = [
		(self: super: {
			gnomeExtensions = super.gnomeExtensions // {
				valent = super.gnomeExtensions.valent.overrideAttrs (oldAttrs: {
					version = "v1.0.0.alpha.48";
					src = super.fetchFromGitHub {
						owner = "andyholmes";
						repo = "gnome-shell-extension-valent";
						tag = "v1.0.0.alpha.48";
						hash = "sha256-j5590Emcga3Wp7/lC/ni2NpEC3bkR2/vT4Cq/m8GvBM=";
					};
				});
			};
		})
		(self: super: {
			morewaita-icon-theme = super.morewaita-icon-theme.overrideAttrs (old: rec {
				version = "48.4";
				src = super.fetchFromGitHub {
					owner = "somepaulo";
					repo = "MoreWaita";
					rev = "930cf79c0f848a90894241438485847d098c52f4";
					hash = "sha256-hZpZmTmndSHWW2jPgDkS05CI3tuzKI8RPL/bey68BZM=";
				};
			});
		})
	];

}
