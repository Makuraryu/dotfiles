# Repository Guidelines

## Project Structure & Module Organization
- `init.lua` bootstraps options, keymaps, LSP, and loads per-plugin specs.
- Core config lives in `lua/config` (options, autocmds, statusline pieces, helpers); `lsp/` holds server overrides such as `lsp/lua_ls.lua`.
- Plugins are declared in `lua/plugins/*.lua` via `vim.pack.add`; add new plugins in their own file with a minimal `setup`.
- Filetype tweaks live in `after/ftplugin/<ft>.lua`; snippets sit in `snippets/*.json`; plugin pins are tracked in `nvim-pack-lock.json`.

## Build, Test, and Development Commands
- `nvim --headless "+qa"` verifies the config boots without runtime errors (non-zero exit means a Lua failure).
- `nvim --headless "+checkhealth" +qa` runs health checks for core Neovim and installed providers.
- `nvim --headless "+MasonUpdate" +qa` refreshes Mason registries; `nvim --headless "+TSUpdateSync" +qa` updates Treesitter parsers after grammar changes.

## Coding Style & Naming Conventions
- Options default to `expandtab`, `tabstop=4`, and `shiftwidth=4`; match this spacing in Lua and plugin configs.
- Prefer `vim.keymap.set` with `desc` metadata, and keep module/file names snake_case.
- Shared helpers belong in `lua/config/utils.lua`; filetype logic belongs in `after/ftplugin`, guarded by a `did_my_ftplugin` flag to stay idempotent.
- Use `stylua` (enabled in `after/ftplugin/lua.lua`) before committing Lua changes.

## Testing Guidelines
- Smoke-test new keymaps and plugins by launching `nvim` and exercising the feature; pair with a headless `+checkhealth` run for CI-style validation.
- When touching snippets or ftplugins, open matching filetypes to ensure autocommands and LSP enablement still trigger as expected.
- Avoid regressions for large files: test with a file over ~1.5 MB so the `bigfile` fallback remains responsive.

## Commit & Pull Request Guidelines
- Use concise, imperative commit subjects (e.g., `config: tune folding`, `plugin: add oil`). Group related config changes together.
- Note user-facing impact in PR descriptions: keybindings added/changed, defaults altered, or new dependencies introduced.
- Link any issue/ticket, include before/after screenshots for UI touches (dashboard, statusline), and mention if `nvim-pack-lock.json` changed.
