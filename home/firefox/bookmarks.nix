{ osConfig, ... }:

{

	programs.firefox.profiles.default.bookmarks = {
		force = true;
		settings = [
			{
				name = "Archived?";
				url = "javascript:void(window.open('https://web.archive.org/web/*/'+location.href))";
			}
			{
				name = "Translate";
				url = "javascript:d=''+(window.getSelection?window.getSelection():document.getSelection?document.getSelection():document.selection.createRange().text);d=d.replace(/\r\n|\r|\n/g,'%20,');if(!d)d=prompt('Word:',%20'');if(d!=null)location='https://libretranslate.com/?source=auto&target=${osConfig.services.xserver.xkb.layout}&q='+escape(d).replace(/%20/g,'+');void(0);";
			}
			{
				name = "Was letztes Wort?";
				url = "javascript:d=''+(window.getSelection?window.getSelection():document.getSelection?document.getSelection():document.selection.createRange().text);d=d.replace(/\r\n|\r|\n/g,'%20,');if(!d)d=prompt('Letztes%20Wort:',%20'');if(d!=null)location='https://www.dwds.de/wb/'+escape(d).replace(/%20/g,'+');void(0);";
			}
		];
	};

}
