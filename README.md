# Neovim Configuration

This Neovim setup is built around [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management and aims to provide a modern, productive development environment with sensible defaults and powerful features.

## Features

- **Plugin Management:** Uses `lazy.nvim` for fast, lazy-loaded plugins.
- **Keymaps:** Leader key is set to `<Space>`. Includes window navigation (`<C-h/j/k/l>`) and search highlight clearing (`<leader>h`).
- **Completion:** GitHub Copilot integration (`copilot.lua`), CopilotChat, and [blink.cmp](https://github.com/saghen/blink.cmp) for fast, fuzzy completion.
- **LSP & Mason:** Automatic installation and configuration of LSP servers via `mason.nvim` and `mason-lspconfig.nvim`.
- **Treesitter:** Syntax highlighting, code folding, and context via `nvim-treesitter` and `nvim-treesitter-context`.
- **File Browser:** [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) for file navigation.
- **UI Enhancements:** 
  - [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) for statusline.
  - [incline.nvim](https://github.com/b0o/incline.nvim) for buffer tabs.
  - [noice.nvim](https://github.com/folke/noice.nvim) for improved notifications and LSP UI.
  - [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) theme.
- **Editing Tools:** 
  - [Comment.nvim](https://github.com/numToStr/Comment.nvim) for easy commenting.
  - [splitjoin.vim](https://github.com/AndrewRadev/splitjoin.vim) for splitting/joining code structures.
  - [inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim) for incremental renaming.
  - [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) and [ultimate-autopair.nvim](https://github.com/altermo/ultimate-autopair.nvim) for autopairing and autotagging.
- **Git Integration:** 
  - [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) for git signs.
  - Optional: [diffview.nvim](https://github.com/sindrets/diffview.nvim) for diff views.
- **Markdown:** [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) for enhanced markdown rendering.
- **Highlighting:** [nvim-colorizer.lua](https://github.com/catgoose/nvim-colorizer.lua) for color highlighting.
- **Todo Comments:** [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) for highlighting and searching TODOs.
- **Trouble:** [trouble.nvim](https://github.com/folke/trouble.nvim) for diagnostics, quickfix, and location lists.
- **Snacks:** [snacks.nvim](https://github.com/folke/snacks.nvim) for explorer, picker, dashboard, and more.
- **Flash:** [flash.nvim](https://github.com/folke/flash.nvim) for fast navigation and search.

## Getting Started

1. **Clone your config:**
   ```sh
   git clone <your-repo> ~/.config/nvim
   ```

2. **Install Neovim (v0.10+ recommended).**

3. **Install required system packages:**  
Some plugins and LSP servers require extra binaries. Recommended packages:
- `git` (for plugin management)
- `curl` or `wget` (for Mason downloads)
- `ripgrep` (`rg`, for Snacks and fast searching)
- `fd` (for Snacks and file finding)
- `node` and `npm` (for many LSP servers, Treesitter, Copilot)
- `python3` (for Python LSP and plugins)
- `lazygit` (required for lazygit integration)
   Install on Ubuntu/Debian:
   ```bash
   sudo apt install git curl ripgrep fd-find nodejs npm python3 
   ```
   On Arch:
   ```bash
   sudo pacman -S git curl ripgrep fd nodejs npm python python-pip
   ```
4. **Start Neovim:**  
   On first launch, plugins will be installed automatically.

5. **Install Treesitter parsers:**  
   Inside Neovim, run:
   ```bash
   :TSInstall bash html lua typescript javascript
   ```

6. **Check LSP servers:**  
   ```bash
   :Mason
   ```

## Key Bindings

- NMode: `<C-h>`/`<C-j>`/`<C-k>`/`<C-l>` — Window navigation
- NMode: `<leader>d` — Toggle file browser (Neo-tree)
- NMode: `<leader>gg` — Toggle git blame (Gitsigns)
- NMode: `<leader>co` — Open CopilotChat
- VMode: `<leader>co` — Open CopilotChat with selected text as prompt
- VMode: `<leader>ci` — Open CopilotChat prompts
- NMode: `<leader>fb` — List buffers (Snacks)
- NMode: `<leader><space>` — Smart file finder (Snacks)
- NMode: `<leader>/` — Grep (Snacks)
- NMode: `<leader>t` — Toggle terminal (Snacks)
- NMode: `<leader>rn` — Incremental rename (IncRename)
- NMode: `gr` — LSP references (Snacks)
- NMode: `gd` — LSP definition (Snacks)
- NMode: `gD` — LSP declaration (Snacks)
- NMode: `<A-c>` — Close buffer (Snacks)
- NMode: `<leader>gb` — Git branches (Snacks)
- NMode: `<leader>gG` — Git blame line (Snacks)
- NMode: `<leader>gr` — Git log (Snacks)
- NMode: `<leader>gh` — LazyGit (Snacks)
- NMode: `<leader>gl` — LazyGit log (Snacks)
- NMode: `<leader>gL` — LazyGit log file (Snacks)
- NMode: `<leader>xx` — Trouble diagnostics
- NMode: `<leader>xX` — Trouble buffer diagnostics
- NMode: `<leader>cs` — Trouble symbols
- NMode: `<leader>cl` — Trouble LSP definitions/references
- NMode: `<leader>xL` — Trouble location list
- NMode: `<leader>xQ` — Trouble quickfix list
- NMode: `K` — LSP hover (Noice)
- NMode: `<leader>rn` — Incremental rename (IncRename)
- NMode: `<leader>gg` — Toggle git blame (Gitsigns)
- See plugin docs for more.

## Structure

- `lua/core/` — Core configuration (keymaps, lazy.nvim setup)
- `lua/plugins/` — Plugin specifications and configs
- `init.lua` — Entry point

## Credits

See each plugin's repository for more information.
