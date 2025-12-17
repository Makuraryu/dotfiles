vim.pack.add({
	{ src = "https://github.com/nvimdev/dashboard-nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

local header = {
"",
"",
"▓█████ ▓█████▄  ██▓▄▄▄█████▓ ▒█████   ██▀███",
"▓█   ▀ ▒██▀ ██▌▓██▒▓  ██▒ ▓▒▒██▒  ██▒▓██ ▒ ██▒",
"▒███   ░██   █▌▒██▒▒ ▓██░ ▒░▒██░  ██▒▓██ ░▄█ ▒",
"▒▓█  ▄ ░▓█▄   ▌░██░░ ▓██▓ ░ ▒██   ██░▒██▀▀█▄",
"░▒████▒░▒████▓ ░██░  ▒██▒ ░ ░ ████▓▒░░██▓ ▒██▒",
"░░ ▒░ ░ ▒▒▓  ▒ ░▓    ▒ ░░   ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░",
" ░ ░  ░ ░ ▒  ▒  ▒ ░    ░      ░ ▒ ▒░   ░▒ ░ ▒░",
"   ░    ░ ░  ░  ▒ ░  ░      ░ ░ ░ ▒    ░░   ░",
"   ░  ░   ░     ░               ░ ░     ░",
"",
"Welcome to Neovim",
"",
"",
}

local function footer()
	local version = vim.version()
	local datetime = os.date("%Y-%m-%d %H:%M")
	return {
		string.format("Neovim v%d.%d.%d | %s", version.major, version.minor, version.patch, datetime),
	}
end

require("dashboard").setup({
	theme = "doom",
	config = {
		header = header,
		center = {
			{ icon = " ", desc = "New file", key = "n", action = "ene | startinsert" },
			{ icon = "󰈞 ", desc = "Find file", key = "f", action = "lua Snacks.picker.smart()" },
			{ icon = " ", desc = "Recent files", key = "r", action = "lua Snacks.picker.recent()" },
			{ icon = " ", desc = "Restore session", key = "s", action = "SessionRestore" },
			{ icon = " ", desc = "Config files", key = "c", action = "lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })" },
			{ icon = " ", desc = "Quit", key = "q", action = "qa" },
		},
		footer = footer,
	},
})
