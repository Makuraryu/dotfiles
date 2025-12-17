local cmd = { "nimlangserver" }

if vim.fn.executable(cmd[1]) == 0 and vim.fn.executable("nimlsp") == 1 then
    cmd = { "nimlsp" }
end

return {
    cmd = cmd,
    filetypes = { "nim", "nims" },
    single_file_support = true,
}
