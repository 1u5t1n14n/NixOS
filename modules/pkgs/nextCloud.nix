{ config,config,  ... }:

let
	cfg = config.services.nextcloud;

in
{

	options = {
		services.nextcloud = {
			theming = {
				name = mkOption {
					type = lib.types.str;
					default = null;
					example = "Our Cloud";
					description = ''
						Name of the Instance to be set by the `theming:config`
						command.
					'';
				};
			};
		};
	};

	config = lib.mkIf cfg.enable = {
		systemd.services.nextcloudCustomConfig = {
			path = [ cfg.occ ];
			script = ''
				nextcloud-occ theming:config name "Our Cloud"
				'';
			serviceConfig = {
				WorkingDirectory = cfg.home;

				Type = "oneshot";
				RemainAfterExit = true;

				ProtectHome = true;
				PrivateDevices = true;
				ProtectClock = true;
			};
			after = [ "nextcloud-setup.service" ];
			wantedBy = [ "multi-user.target" ];
		};
	};

}
