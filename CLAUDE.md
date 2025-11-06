# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Architecture

This is a Neovim configuration built with lazy.nvim plugin manager. The configuration follows a modular structure:

- `init.lua` - Entry point that loads core modules
- `lua/core/plugins.lua` - Plugin definitions and lazy.nvim setup
- `lua/core/keymaps.lua` - All key mappings
- `lua/core/options.lua` - Neovim options and settings
- `lua/core/plugin_config/` - Individual plugin configurations

### Plugin Loading Order
1. Plugins are defined in `lua/core/plugins.lua` using lazy.nvim
2. Plugin configurations are loaded via `lua/core/plugin_config/init.lua`
3. NvimTree automatically opens on startup via autocmd

### Key Plugin Integrations

**AI/Code Generation:**
- Avante.nvim (Claude integration) - Leader key: `<leader>a`
- Claude Code plugin - Mapped to `<leader>cc`
- GitHub Copilot
- Gen.nvim for AI code generation

**Development Tools:**
- Mason + LSP for language servers
- Telescope for fuzzy finding
- Treesitter for syntax highlighting
- Conform.nvim for formatting
- Fugitive + LazyGit for Git operations

**Database:**
- vim-dadbod suite for database operations

## Key Mappings

### Leader Keys
- `<Space>` - Main leader key
- `,` - Local leader key

### Navigation
- `<C-k/j/h/l>` - Window navigation
- `<leader>k/j` - Resize windows vertically (+/-10)
- `jk` - Exit insert mode
- `fd` - Save file (works in insert and normal mode)

### File Operations
- `<C-p>` - Find files (Telescope)
- `fo` - Old files history
- `fb` - Find buffers
- `ff` - Grep string under cursor
- `fw` - Live grep
- `fg` - Git commits for buffer

### Terminal
- `t1-t4` - Open numbered ToggleTerm instances
- `lg` - Open LazyGit

### AI Tools
- `<leader>aa` - Avante Ask
- `<leader>ac` - Avante Chat
- `<leader>ae` - Avante Edit
- `<leader>at` - Avante Toggle
- `<leader>cc` - Claude Code

### Database
- `<leader>db` - Toggle DBUI
- `<leader>ds` - Save query

## Configuration Details

### Avante Configuration
- Uses Claude Sonnet 4 (`claude-sonnet-4-20250514`)
- Window width: 35% on the right side
- Escape key disabled for closing to prevent accidental closure
- Alternative close keys: `<C-c>`, `<C-q>`, `q`

### Editor Settings
- 2-space indentation
- Case-insensitive search with smart case
- Scrolloff of 7 lines
- Split windows to right
- Undo persistence in `~/.config/nvim/undodir`

### Development Workflow
- Auto-opens NvimTree on startup
- Multiple terminal instances supported
- Git integration through both Fugitive and LazyGit
- Database development support through dadbod suite