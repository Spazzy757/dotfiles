# Dotfiles — Claude Context

Personal dotfiles for Brendan Kamp (Spazzy757), managed with [GNU Stow](https://www.gnu.org/software/stow/).
Secrets (work git config, email credentials) are encrypted with [git-crypt](https://github.com/AGWA/git-crypt).

## Repo Layout

```
bash/        Shell config — sourced via stow into ~/
claude/      CLAUDE.md global preferences — stowed into ~/.claude/
ghostty/     Ghostty terminal config — stowed into ~/.config/ghostty/
git/         Git config — stowed into ~/  (some files git-crypt encrypted)
nvim/        Neovim config — stowed into ~/.config/nvim/
tmux/        Tmux config — stowed into ~/
```

## Stow Commands

Each directory is stowed independently:

```bash
stow -v -R -t ~/             git
stow -v -R -t ~/             bash
stow -v -R -t ~/             tmux
stow -v -R -t ~/.config/nvim    nvim/
stow -v -R -t ~/.config/ghostty ghostty/
stow -v -R -t ~/.claude/     claude/
```

## Git Rules

- **Never commit directly to `main`** — always open a PR
- One commit per PR; amend to keep it single
- Conventional commits with a descriptive body
- Rebase only, no merge commits
- Encrypted files: `git/.gitemail`, `git/.gitconfig.work`, `git/.git-credentials`
  — run `git-crypt unlock` (requires GPG key in keychain)

## bash/

| File | Purpose |
|------|---------|
| `.bashrc` | Entry point — sources `.bash_profile` |
| `.bash_profile` | All shell setup: PATH, languages, completions, editor |
| `.aliases` | Aliases and helper functions |
| `.spazzy757.theme.bash` | Custom Bash-it prompt theme |

**Key patterns in `.bash_profile`:**
- Sections: Shell → Bash-it → PATH → Languages → Completions → Editor → Misc
- NVM is lazy-loaded via stubs (`nvm`, `node`, `npm`, `npx`, `yarn`, `pnpm`) to avoid slow startup
- Completions are cached by binary mtime under `~/.cache/` via `_cache_completion`
- `pyenv`, `jenv`, `cargo` initialised conditionally with `command -v` guards

**Key patterns in `.aliases`:**
- Linux clipboard uses `wl-copy`/`wl-paste` (Wayland)
- `k()` wraps `kubectl`; `dc()` wraps `docker compose`; `tf` aliases `terraform`
- `repos <name>` navigates to `~/repos/<name>/`
- `github-actions-update <ref>` pins all Vandebron GitHub Actions to a ref

## git/

| File | Purpose |
|------|---------|
| `.gitconfig` | Main config — aliases, colours, GPG signing, pull rebase |
| `.gitconfig.work` | Work identity override (encrypted) — triggers for `~/repos/vandebron/` |
| `.gitemail` | SMTP credentials for `git send-email` (encrypted) |
| `.gitignore_global` | Global ignores: `.DS_Store`, `.localconfig`, swap files |

**Notable aliases:** `s` (status), `c` (signed commit), `l` (log graph), `hist` (detailed log), `nuke` (delete all non-main branches), `cob` (fzf branch checkout).

## ghostty/

Single file `ghostty/config` — stowed to `~/.config/ghostty/config` (Ghostty only
auto-loads a file named `config`, no extension). Sets a green-on-black colour
scheme mirroring the Terminator profile: foreground `#29ee15` on black with the
standard VGA 16-colour palette. Reload a running Ghostty with `ctrl+shift+,`.

## nvim/

Entry point: `nvim/init.lua` — bootstraps lazy.nvim, loads `plugins`, then `require('spazzy')`.

**Plugin config:** `nvim/lua/plugins.lua`  
**Module config:** `nvim/lua/spazzy/`

On-demand plugins are lazy-loaded from their `plugins.lua` specs (their `.setup()`
lives there): nvim-tree & telescope on `keys`/`cmd`, mason on `:Mason`, nvim-dap on
its `Dap*` commands. LSP servers are enabled explicitly via `vim.lsp.enable()` in
`lspserver.lua` (not mason-lspconfig's `automatic_enable`).

| Module | Purpose |
|--------|---------|
| `init.lua` | Loads all modules in order |
| `options.lua` | Vim settings, autocmds, FreeMarker filetype |
| `keymaps.lua` | Key bindings (folding, diagnostics) |
| `lspserver.lua` | Mason bin on PATH, Treesitter, LSP capabilities, all language servers (`vim.lsp.enable`), nvim-ufo |
| `completion.lua` | nvim-cmp setup with vsnip |
| `claude.lua` | claudecode.nvim key bindings (`<leader>w*`) |
| `comments.lua` | Manual comment/uncomment for multiple syntaxes (`<leader>b` / `<leader>?`) |
| `theme.lua` | Nightfox/carbonfox colour scheme with custom highlights |

**Language servers** (installed via `:Mason`): pylsp, gopls, rust_analyzer, lua_ls, yamlls, helm_ls, sqlls, jsonls, terraformls, dockerls, docker_compose_language_service, bashls, clangd, kotlin_language_server.

**Leader key:** `<Space>`

**Key bindings quick reference:**
- `<leader>n` — focus file tree
- `<leader>ff/fg/fl/fb/fh/fo` — Telescope find/grep/buffers/help/oldfiles
- `<leader>wc/wf/wr/wo` — Claude toggle/focus/resume/continue
- `<leader>wa` — add current buffer to Claude; `<leader>ws` (visual) — send to Claude
- `<leader>wda/wdd` — accept/deny Claude diff
- `zR/zM` — open/close all folds

## tmux/

Config at `tmux/.tmux.conf`. Prefix is `Ctrl+a`.

- Splits: `|` (horizontal), `-` (vertical), both inherit cwd
- Pane nav/resize: vim-style (`h/j/k/l`, `H/J/K/L`)
- Copy mode: vi keys; `y` yanks to Wayland clipboard via `wl-copy`
- `x` kills pane; `T` swaps current pane with top; `r` reloads config

## claude/

`claude/CLAUDE.md` is the global Claude Code preferences file, stowed to `~/.claude/CLAUDE.md`.
Contains coding philosophy, git rules, and Kubernetes safety guidelines.
