# nvim-config

Personal Neovim config, originally spun up following ThePrimeagen's "0 to LSP"
video and adapted over time. Targets Python, TypeScript, and Go as primary
languages.

## Structure

```
init.lua                  -> bootstrap
lua/david/
  init.lua                -> sets, remaps, lazy.nvim bootstrap
  set.lua                 -> options
  remap.lua               -> keymaps
  plugins/                -> one file per plugin (auto-discovered by lazy.nvim)
```

Plugin management is [lazy.nvim](https://github.com/folke/lazy.nvim).

## External dependencies

- `git` — lazy.nvim clones plugin repos
- `ripgrep` — telescope `live_grep`
- `npm` / `node` — mason installs some LSPs/tools via npm; markdown-preview
- `tree-sitter` CLI (optional) — only needed if a parser is missing; treesitter
  is set to `auto_install = true`

Language toolchains you'll want present on PATH for the LSPs/formatters to
actually do work:

- Python: `python3`, `uv` or `pip`, plus `ruff` if not installed via mason
- TypeScript: `node`, `pnpm`/`npm`
- Go: `go` (gopls and goimports install via mason)
- Lua (for editing this config): nothing extra; `lua_ls` installs via mason

## First launch

On first launch, lazy.nvim will clone itself and install plugins. Then run
`:Mason` to verify LSP servers installed (they should, via
`mason-lspconfig.ensure_installed`), and `:checkhealth` to surface missing
system deps.

Treesitter parsers install on demand.
