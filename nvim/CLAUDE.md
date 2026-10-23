# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal Neovim configuration (Lua, `lazy.nvim` plugin manager), part of a larger `.dotfiles` repo. This directory is symlinked/pointed to as `~/.config/nvim` on the machine it's used on. There is no build system, package.json, or test suite — this is config, not an application.

## Commands

- Reload config: restart Neovim, or `:source %` / `:Lazy reload <plugin>` for a single file.
- Plugin management: `:Lazy` (open UI), `:Lazy sync` (install/update/clean), `:Lazy update`. `lazy-lock.json` pins plugin commit versions — it's regenerated automatically by `:Lazy` operations, don't hand-edit it.
- LSP status/management: `:LspInfo`, `:Mason` (also bound to `<leader>ma`).
- Syntax highlighting: `:TSUpdate` (treesitter parsers).
- Sanity-check a Lua change without opening Neovim: `nvim --headless -c "lua dofile('lua/config/whatever.lua')" -c q` (only meaningful for files with no dependency on already-loaded plugin state).

## Load order / architecture

`init.lua` is the entrypoint and its require order matters — later files can depend on globals/options set earlier:

```
init.lua
├── require("main")            -- lua/main/init.lua
│   ├── main.remap              -- keymaps (leader = space)
│   ├── main.config             -- core vim.opt settings (tabs, numbers, search, etc.)
│   └── main.scripts             -- user commands (e.g. :TabSize)
└── require("config.lazy")     -- bootstraps lazy.nvim and declares the full plugin spec inline
    (then, in init.lua, one require per plugin's own config module:)
    config.colors, config.treesitter, config.nvim-tree, config.tabby,
    config.autoclose, config.mini-sessions, config.telescope,
    config.eyeliner, config.undotree, config.gitsigns, config.pyrepl,
    config.lsp, config.peek
```

Key points:
- **Plugin specs live in `lua/config/lazy.lua`** as one big inline `spec = {...}` table — this is also where `lazy.nvim` itself is bootstrapped (git-cloned) if missing. There is no `lua/plugins/*.lua` split (the `{ import = "plugins" }` line is commented out).
- **Each plugin's runtime config is a separate file** in `lua/config/`, named after the plugin, and must be explicitly required from `init.lua` — adding a plugin to the spec in `lazy.lua` does not auto-load a config for it.
- **`lua/config/lsp/`** is its own subtree: `init.lua` sets up the global `LspAttach` keymaps (via Telescope builtins) and requires `mason`, `lua`, `java`, `svelte` in that subdirectory. `mason.lua` owns `mason-lspconfig` server installation (`ensure_installed`) and the generic server-setup handler; per-language files (`lua.lua`, `svelte.lua`) just call `vim.lsp.enable(...)`. `java.lua` is currently a no-op (jdtls enable line commented out) — the real jdtls config lives at `ftplugin/disabled_java.lua`, which is *not* wired up (filename prefix `disabled_` — Neovim only auto-runs `ftplugin/<filetype>.lua`, so this file never runs as-is).
- **Colorscheme**: catppuccin (frappe flavour, transparent background), configured in `lua/config/colors.lua`, which also issues `:colorscheme` — order-sensitive, must run after `setup()`.
- **Leader key** is space (`<space>`), set in `lua/main/remap.lua` before anything else loads.

## Conventions when editing

- New plugin → add its spec table to `lua/config/lazy.lua`, then (if it needs setup) create `lua/config/<name>.lua` with the `require("plugin").setup{...}` call, then add `require("config.<name>")` to `init.lua` in the appropriate position relative to other config.
- New keymap → `lua/main/remap.lua` for global/core mappings; LSP-specific keymaps belong in `lua/config/lsp/init.lua`'s `LspAttach` autocmd instead.
- New LSP server → add the server name to `ensure_installed` in `lua/config/lsp/mason.lua`; if it needs config beyond the generic handler, add a per-language file under `lua/config/lsp/` and require it from `lua/config/lsp/init.lua`.
- `Session.vim` is a generated `:mksession` output (bound to `<leader>x` on quit) — don't hand-edit it; it will drift from disk state anyway.
