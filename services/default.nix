{ ... }:

{

	imports = [
		./codeServer.nix
		./searxng.nix
		./kantomat.nix
		./anki.nix
		./domain.nix
		./nextCloud.nix
		./paperless.nix
		./vaultWarden.nix
	];

	services = {
		paperless.enable = true;
		nextcloud.enable = true;
		vaultwarden.enable = true;
		anki-sync-server.enable = true;
		searx.enable = true;
		kantOMat.enable = false;
	};

}
