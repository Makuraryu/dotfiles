# AGENTS.md

This repository is a Neovim configuration based on kickstart.nvim. Follow these guidelines when working with this codebase.

## Commands

### Linting and Formatting
- **Check formatting**: `stylua --check .` (runs automatically in CI on PRs)
- **Format code**: `stylua .`
- **Linting**: `nvim-lint` runs automatically on file save; configure in `lua/kickstart/plugins/lint.lua`

### Health Check
- Run `:checkhealth` in Neovim to verify configuration and external dependencies
- Run `:checkhealth kickstart` for configuration-specific health checks

### Plugin Management
- List plugins: `:Lazy`
- Update plugins: `:Lazy update`
- Clean plugins: `:Lazy clean`
- Sync plugins: `:Lazy sync`

### LSP and Tools
- Open Mason: `:Mason` to view/manage installed LSP servers and tools
- Restart LSP: `:LspRestart`
- Start LSP: `:LspStart`
- Stop LSP: `:LspStop`

### Testing
This is a Neovim config without formal tests. Verify changes by:
1. Starting Neovim in a clean instance (`nvim --clean`) and checking for errors
2. Running `:checkhealth kickstart`
3. Testing affected features manually
4. Running `stylua --check .` before committing

## Code Style Guidelines

### Formatting (Stylua)
See `.stylua.toml` for exact configuration:
- **Indentation**: 2 spaces
- **Line width**: 160 characters
- **Quotes**: AutoPreferSingle (auto-select but prefer single quotes)
- **Parentheses**: None for function calls (e.g., `require 'module'`)
- **Line endings**: Unix (LF)

### Imports and Requires
- Use `local module = require 'module.name'` for clarity
- Lazy load modules when appropriate (inside functions or config blocks)
- Keep requires close to where they're used
- Use `vim.fn.stdpath 'config'` for config paths
- Use `vim.uv or vim.loop` for loop API compatibility

### Naming Conventions
- **Files**: lowercase_with_underscores.lua (e.g., `debug.lua`, `lint.lua`)
- **Variables**: snake_case for locals, PascalCase for modules
- **Functions**: snake_case for local helpers, clear descriptive names
- **Constants**: UPPER_CASE (rarely used in Lua configs)
- **Keymaps**: Use `<leader>` prefix for custom mappings, descriptive labels

### Type Annotations
- Use `---@module` annotations for module declarations when helpful
- Use `---@param`, `---@return`, `---@field` for function signatures
- Example: `---@param bufnr integer` for type hints
- Check `:help lua-annotations` for full syntax

### Plugin Configuration
- Return plugin specs as tables from files in `lua/kickstart/plugins/` or `lua/custom/plugins/`
- Use `opts = {}` for simple plugin configurations (passes to `setup()`)
- Use `config = function() ... end` for complex setups
- Use `event`, `cmd`, or `keys` for lazy loading plugins
- Include `dependencies = {}` when needed
- Never use `main = '...'` in plugin specs (lazy.nvim auto-detects)

### Keymaps
- Always include `desc` field for documentation
- Use `{ mode = 'n', '<key>', func, opts }` format or `vim.keymap.set()`
- Group related keymaps (e.g., `<leader>s` for search, `<leader>t` for toggle)
- Use buffer-local keymaps with `{ buffer = bufnr }` when appropriate
- Test keymaps after adding them

### Comments and Documentation
- Use `--` for single-line comments
- Use `--[=[ ... ]=]` for multi-line comments (header blocks)
- Comment complex logic and non-obvious configurations
- Include `:help` references for Neovim APIs and options
- Document plugin configuration choices that may be unclear

### Error Handling
- Use `pcall(require, 'module')` for optional dependencies
- Wrap error-prone code in `pcall()` or `xpcall()` when needed
- Check return values from `vim.api.nvim_*` functions
- Use `vim.notify()` or `vim.api.nvim_echo()` for user-facing messages
- Use `vim.health.ok()`, `vim.health.warn()`, `vim.health.error()` for health checks

### LSP Configuration
- Add LSPs to `servers` table in `init.lua`
- Configure LSPs in `settings` table within each server entry
- Use `capabilities` to enable/disable LSP features
- Add tools to `ensure_installed` in Mason tool installer
- Test LSP features after adding new servers
- Use `client:supports_method()` for Neovim 0.11+, `client.supports_method()` for 0.10

### Autocommands
- Create augroups with `vim.api.nvim_create_augroup(name, { clear = true })`
- Use descriptive group names (e.g., `kickstart-highlight-yank`, `kickstart-lsp-attach`)
- Pass `clear = true` to avoid duplicate autocommands
- Include autocmds in config blocks or plugin specs
- Use `{ buffer = bufnr }` for buffer-local autocmds

### File Organization
- Main config: `init.lua` (entry point, core configuration)
- Plugin specs: `lua/kickstart/plugins/*.lua` (optional plugins)
- Custom plugins: `lua/custom/plugins/*.lua` (user plugins)
- Health check: `lua/kickstart/health.lua` (system verification)
- Keep related functionality together

### Neovim API
- Prefer `vim.keymap.set()` over `vim.api.nvim_set_keymap()`
- Use `vim.api.nvim_create_autocmd()` for autocommands
- Use `vim.schedule()` for deferred operations (e.g., clipboard setup)
- Check Neovim version with `vim.version()` or `vim.fn.has 'nvim-0.11'` when using new APIs
- Reference `:help` documentation for unfamiliar APIs

### Module Structure
- Return tables from plugin spec files
- Use `return {}` for empty plugin lists
- Keep files focused and modular
- Load custom plugins with `{ import = 'custom.plugins' }` in lazy.nvim setup

### Gitignore Patterns
Ignored files (see `.gitignore`):
- `tags` - ctags file
- `test.sh` - test scripts
- `.luarc.json` - Lua LSP configuration
- `nvim` - symlink or test nvim directory
- `spell/` - custom spell files
- `lazy-lock.json` - plugin lock file

### Additional Guidelines
- Test configuration changes in a clean Neovim instance (`nvim --clean`)
- Avoid hardcoding paths; use `vim.fn.stdpath()` where appropriate
- Use `vim.g` for global variables (e.g., `vim.g.mapleader = ' '`)
- Use `vim.o` for options, `vim.opt` for option tables
- Keep `init.lua` readable; consider splitting into modules as config grows
- Use `vim.version.ge(vim.version(), '0.10-dev')` for version checks
- Check executables with `vim.fn.executable('program') == 1`
- **Plugin Documentation**: When adding, removing, or modifying plugins, update `PLUGINS.md` to keep documentation synchronized with the configuration
