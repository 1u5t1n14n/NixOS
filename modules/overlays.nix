{ ... }:

{

	# Newest Version of morewaita-icon-theme
	nixpkgs.overlays = [
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
