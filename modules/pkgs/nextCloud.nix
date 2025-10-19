{ config, lib, ... }:

let
	cfg = config.services.nextcloud;
	occ = "${cfg.occ}/bin/nextcloud-occ";

in
{

	options = {
		services.nextcloud = {
			extraOCC = lib.mkOption {
				default = "";
				type = lib.types.lines;
				example = "nextcloud-occ app:enable files_external";
				description = ''
					Extra commands to be run through Nextcloud's OCC at
					rebuilding.
				'';
			};
		};
	};

	config = lib.mkIf cfg.enable {
		systemd.services.nextcloudExtraOCC = {
			path = [ cfg.occ ];
			script = ''
				${cfg.extraOCC}
			'';
			serviceConfig = {
				WorkingDirectory = cfg.home;

				Type = "oneshot";
				RemainAfterExit = true;

				NoNewPrivileges = true;
				PrivateDevices = true;
				PrivateTmp = true;
				ProtectClock = true;
				ProtectHome = true;
				ProtectHostname = true;
				ProtectKernelLogs = true;
				ProtectKernelModules = true;
				ProtectKernelTunables = true;
				ProtectSystem = "strict";
				RestrictNamespaces = true;
				SystemCallArchitectures = true;
			};
			after = [ "nextcloud-setup.service" ];
			wantedBy = [ "multi-user.target" ];
		};
	};

}
