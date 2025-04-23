{ config, ... }:

let
	paperless = config.services.paperless;

in {

	services = {
		paperless = {
			enable = true;
			address = "127.0.0.1";
			port = 28981;
			passwordFile = config.sops.secrets."services/paperless".path;
			settings = {
				PAPERLESS_APP_TITLE = "Archives";
				PAPERLESS_ADMIN_USER = "root";
				PAPERLESS_OCR_LANGUAGE = "deu";
				PAPERLESS_OCR_USER_ARGS = {
					optimize = 1;
					pdfa_image_compression = "lossless";
				};
				PAPERLESS_EMPTY_TRASH_DELAY = 15;

				PAPERLESS_TIKA_ENABLED = true;
				PAPERLESS_TIKA_ENDPOINT = "http://localhost:${toString config.services.tika.port}";
				PAPERLESS_TIKA_GOTENBERG_ENDPOINT = "http://localhost:${toString config.services.gotenberg.port}";
			};
			consumptionDirIsPublic = true;
		};
		tika = {
			enable = true;
			port = 9998;
		};
		gotenberg = {
			enable = true;
			port = 3000;
		};
	};

}
