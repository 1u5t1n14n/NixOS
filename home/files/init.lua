local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	},
	{ "nvimtools/none-ls.nvim" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
	},
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "OXY2DEV/markview.nvim", lazy = false },
	{ "lervag/vimtex", lazy = false },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
	},
	{ "hrsh7th/nvim-cmp" },
	{ "eandrju/cellular-automaton.nvim" },
	{ "goolord/alpha-nvim", dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" } },
	{ "rebelot/kanagawa.nvim" },
	{ "m4xshen/autoclose.nvim" },
}
local opts = {}
require("lazy").setup(plugins, opts)

-- Alpha
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                     ]],
	[[       ████ ██████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      █████████ ███████████████████ ███   ███████████   ]],
	[[     █████████  ███    █████████████ █████ ██████████████   ]],
	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
}
alpha.setup(dashboard.opts)
-- Vimtex
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_format_enabled = 1
vim.g.vimtex_compiler_method = "latexmk"
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'
vim.g.vimtex_syntax_conceal = {
	accents = 1,
	ligatures = 1,
	cites = 1,
	fancy = 1,
	spacing = 1,
	greek = 1,
	math_bounds = 1,
	math_delimiters = 1,
	math_fracs = 1,
	math_super_sub = 1,
	math_symbols = 1,
	sections = 1,
	styles = 1,
}
require("markview")
-- LSP
require("autoclose").setup()
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ltex", "clangd" },
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
	capabilities = capabilities,
})
lspconfig.ltex.setup({
	capabilities = capabilities,
})
lspconfig.clangd.setup({
	capabilities = capabilities,
})

-- CMP
local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})
-- Lualine
require("lualine").setup({
	options = {
		theme = "gruvbox_dark",
	},
})
-- None
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
	},
})
-- Treesitter
require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { "html", "nix" },
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
})
-- Noice
require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
	views = {
		notify = {
			backend = "notify",
			fallback = "mini",
			format = "notify",
			replace = false,
			merge = false,
			level = nil,
			position = "bottom_left",
			relative = "editor",
			border = {
				style = "rounded",
			},
		},
	},
})
-- Telescope.nvim
local builtin = require("telescope.builtin")
require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
require("telescope").load_extension("ui-select")

-- General Settings
vim.cmd("set noexpandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd("set cursorline")

vim.o.list = true
vim.o.listchars = "tab:→ ,space:·,trail:-,nbsp:·"

vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.mouse = ""
vim.opt.mousescroll = "ver:0,hor:0"

vim.keymap.set("n", "<leader>fu", "<cmd>:CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>:CellularAutomaton game_of_life<CR>")
vim.keymap.set("n", "<C-o>", builtin.find_files, {})
vim.keymap.set("n", "<leader><leader>", builtin.live_grep, {})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
vim.keymap.set("n", "<C-M-n>", ":Neotree filesystem toggle right<CR>", {})
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>", {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

local hardmode = true
if hardmode then
	local msg = [[<cmd>echohl Error | echo "KEY DISABLED" | echohl None<CR>]]
	vim.api.nvim_set_keymap("i", "<Up>", "<C-o>" .. msg, { noremap = true, silent = false })
	vim.api.nvim_set_keymap("i", "<Down>", "<C-o>" .. msg, { noremap = true, silent = false })
	vim.api.nvim_set_keymap("i", "<Left>", "<C-o>" .. msg, { noremap = true, silent = false })
	vim.api.nvim_set_keymap("i", "<Right>", "<C-o>" .. msg, { noremap = true, silent = false })
	vim.api.nvim_set_keymap("n", "<Up>", msg, { noremap = true, silent = false })
	vim.api.nvim_set_keymap("n", "<Down>", msg, { noremap = true, silent = false })
	vim.api.nvim_set_keymap("n", "<Left>", msg, { noremap = true, silent = false })
	vim.api.nvim_set_keymap("n", "<Right>", msg, { noremap = true, silent = false })
end

vim.cmd("colorscheme kanagawa-dragon")
