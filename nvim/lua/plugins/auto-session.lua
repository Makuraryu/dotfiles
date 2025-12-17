vim.pack.add({
    { src = "https://github.com/rmagatti/auto-session" }
})
require("auto-session").setup({
    auto_restore_enabled = false, -- start on dashboard instead of restoring last session
})
