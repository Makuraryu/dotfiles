vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

vim.api.nvim_create_autocmd('BufReadPre', {
    group = vim.api.nvim_create_augroup("SetupTreesitter", { clear = true }),
    once = true,
    callback = function()
        local function is_large_yaml(lang, bufnr)
            return lang == 'yaml' and vim.api.nvim_buf_line_count(bufnr) > 5000
        end

        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                'diff',
                'nim',
                'snakemake',
            },
            ignore_install = {
                'latex',
                'yaml',
                'xml',
            },
            auto_install = true,
            highlight = {
                enable = true,
                disable = function(lang, bufnr)
                    if lang == 'latex' then
                        return true
                    end
                    return is_large_yaml(lang, bufnr)
                end,
                additional_vim_regex_highlighting = { 'ruby' },
            },
            indent = { enable = true, disable = { 'ruby' } },
        }
    end,
})
