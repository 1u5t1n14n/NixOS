{ pkgs, lib, ... }:

{

	home.file.".config/wezterm/wezterm.lua".text = lib.fileContents ../files/wezterm.lua;

}
