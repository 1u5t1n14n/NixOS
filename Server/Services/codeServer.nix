{ userName, config, ... }:

let
	code = config.services.code-server;

in {

	services.code-server = {
		enable = true;
		host = "0.0.0.0";
		port = 8080;
		user = userName;
		group = config.users.users.${code.user}.group;
		disableTelemetry = true;
		auth = "password";
	};

	let
		configFile = "${config.users.users.${code.user}.home}/.config/code-server/config.yaml";
		configDir = config.users.users.${code.user}.home;
	in system.activationScripts.codeServerConfigCreate = ''
		mkdir -p ${configDir}
		if [ ! -f "${configFile}" ]; then
			cat <<EOF> ${configFile}
bind-addr: ${code.host}:${toString code.port}
auth: ${code.auth}
hashed-password:
"$(cat ${config.sops.secrets."services/codeServer".path})"
cert: false
EOF
			chown -R ${code.user}:${code.group} ${configFile}
		fi
	'';

	networking.firewall.allowedTCPPorts = [ code.port ];

}
