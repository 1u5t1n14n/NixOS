{ pkgs, ... }:

{

	# Gonna move this to home.nix asap

	# programs.mpv = {
	#	enable = true;
	# 	config.profile = "high-quality";
	#
	# 	package = (
	#		pkgs.mpv-unwrapped.wrapper {
	# 			scripts = with pkgs.mpvScripts; [ uosc sponsorblock ];
	#			mpv = pkgs.mpv-unwrapped.override {
	# 				waylandSupport = true;
	#				ffmpeg = pkgs.ffmpeg-full;
	# 			};
	#		}
	#	);
	# };

	environment.systemPackages = [ pkgs.vlc pkgs.mpv ];

}
