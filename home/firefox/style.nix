{ ... }:

{

	programs.firefox.profiles.default.userContent = ''
		a[href$=".pdf"]:after {
			font-size: smaller;
			content: " [pdf]";
		}
		a[href$=".mp4"]:after {
			font-size: smaller;
			content: " [mp4]";
		}
		a[href$=".webp"]:after {
			font-size: smaller;
			content: " [webp]";
		}
		a[href$=".zip"]:after {
			font-size: smaller;
			content: " [zip]";
		}
	'';

}
