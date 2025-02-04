{ userName, ... }:

{

	system.activationScripts.removeHMBackups = {
			text = ''
				echo "Removing Home Manager backups..."
				find /home/${userName}/.config -name '*.HMbackup*' -delete
				'';
			deps = [];
	};

}
