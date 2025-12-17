vim.pack.add({
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
})

local ok, typst_preview = pcall(require, "typst-preview")
if ok then
	local data_dir = vim.fn.stdpath("data") .. "/typst-preview"
	local writable = vim.fn.filewritable(data_dir) == 2
	if not writable then
		local ok_mkdir = pcall(vim.fn.mkdir, data_dir, "p")
		if ok_mkdir then
			writable = vim.fn.filewritable(data_dir) == 2
		end
	end

	if writable then
		typst_preview.setup({})
	else
		vim.notify(
			string.format("typst-preview skipped: data dir not writable (%s)", data_dir),
			vim.log.levels.WARN
		)
	end
end
