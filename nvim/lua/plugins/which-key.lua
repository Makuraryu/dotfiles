vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim" },
})

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("SetupWhichKey", { clear = true }),
	once = true,
	callback = function()
		local wk = require("which-key")
		wk.setup({
			preset = "modern",
			win = {
				no_overlap = true,
				padding = { 1, 2 },
				title = true,
				title_pos = "center",
				zindex = 1000,
			},
			layout = {
				width = { min = 20 },
				spacing = 3,
			},
			triggers = {
				{ "<leader>", mode = { "n", "v" } },
			},
		})
		wk.add({
			{
				"<leader>?",
				function()
					wk.show({ global = false })
				end,
				desc = "Show buffer-local keymaps",
			},
		})
	end,
})
