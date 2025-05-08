{ ... }:

{

	programs.firefox.profiles.default.userContent = ''
		/* add '[pdf]' next to links to PDF files */
		a[href$=".pdf"]:after {
			font-size: smaller;
			content: " [pdf]";
		}
	'';

}
