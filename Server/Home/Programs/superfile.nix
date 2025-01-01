{ pkgs, ... }:

{

	home.file.".config/superfile/config.toml".text = ''
		theme = 'gruvbox'
		editor = "nvim"
		auto_check_update = true
		cd_on_quit = true
		default_open_file_preview = false
		default_directory = "."
		file_size_use_si = true
		nerdfont = true
		transparent_background = false
		# File preview width allow '0' (this mean same as file panel),'x' x must be less than 10 and greater than 1 (This means that the width of the file preview will be one xth of the total width.)
		file_preview_width = 0
		# The length of the sidebar. If you don't want to display the sidebar, you can input 0 directly. If you want to display the value, please place it in the range of 3-20.
		sidebar_width = 20
		# Border style
		border_top = '─'
		border_bottom = '─'
		border_left = '│'
		border_right = '│'
		border_top_left = '╭'
		border_top_right = '╮'
		border_bottom_left = '╰'
		border_bottom_right = '╯'
		border_middle_left = '├'
		border_middle_right = '┤'
		# ==========PLUGINS========== #
		# 
		# Show more detailed metadata, please install exiftool before enabling this plugin!
		metadata = false
		#
		# Enable MD5 checksum generation for files
		enable_md5_checksum = false
	'';

	home.file.".config/superfile/theme/gruvbox.toml".text = ''
		# Gruvbox
		# Theme create by: https://github.com/yorukot
		# If you want to make border display just set it same as sidebar background color
		code_syntax_highlight = "gruvbox"
		# ========= Border =========
		file_panel_border = "#868686"
		sidebar_border = "#282828"
		footer_border = "#868686"
		# ========= Border Active =========
		file_panel_border_active = "#FFF1C5"
		sidebar_border_active = "#D79921"
		footer_border_active = "#D79921"
		modal_border_active = "#868686"
		# ========= Background (bg) =========
		full_screen_bg = "#282828"
		file_panel_bg = "#282828"
		sidebar_bg = "#282828"
		footer_bg = "#282828"
		modal_bg = "#282828"
		# ========= Foreground (fg) =========
		full_screen_fg = "#EBDBB2"
		file_panel_fg = "#EBDBB2"
		sidebar_fg = "#EBDBB2"
		footer_fg = "#EBDBB2"
		modal_fg = "#EBDBB2"
		# ========= Special Color =========
		cursor = "#8EC07C"
		correct = "#8ec07c"
		error = "#FF6969"
		hint = "#468588"
		cancel = "#838383"
		# Gradient color can only have two color!
		gradient_color = ["#689d6a", "#fb4934"]
		# ========= File Panel Special Items =========
		file_panel_top_directory_icon = "#8EC07C"
		file_panel_top_path = "#458588"
		file_panel_item_selected_fg = "#D3869B"
		file_panel_item_selected_bg = "#282828"
		# ========= Sidebar Special Items =========
		sidebar_title = "#CC241D"
		sidebar_item_selected_fg = "#E8751A"
		sidebar_item_selected_bg = "#282828"
		sidebar_divider = "#868686"
		# ========= Modal Special Items =========
		modal_cancel_fg = "#EBDBB2"
		modal_cancel_bg = "#6D6D6D"
		modal_confirm_fg = "#EBDBB2"
		modal_confirm_bg = "#FF4D00"
		# ========= Help Menu =========
		help_menu_hotkey = "#8EC07C"
		help_menu_title = "#FF4D00"
	'';

}
