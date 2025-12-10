# Neovim Configuration

This directory contains a personal Neovim configuration. It is structured using Lua and managed by the `lazy.nvim` plugin manager.

## Project Overview

*   **Purpose:** A personal Neovim setup tailored for software development.
*   **Main Technologies:** Lua, Neovim, `lazy.nvim`.
*   **Architecture:** The configuration is modular, with settings and plugins clearly separated.
    *   `init.lua`: The main entry point.
    *   `lua/config/options.lua`: Global Neovim options.
    *   `lua/config/lazy.lua`: `lazy.nvim` plugin manager setup.
    *   `lua/plugins/`: Plugin-specific configurations.

## Key Features

*   **Plugin Management:** Uses `lazy.nvim` to manage plugins. The plugin list is implicitly defined by the files in `lua/plugins/`.
*   **LSP:** Integrated Language Server Protocol support via `nvim-lspconfig` for features like code completion, diagnostics, and navigation. Configured for several languages including Nix, Lua, Python, and Rust.
*   **Syntax Highlighting:** Leverages `nvim-treesitter` for fast and accurate syntax highlighting and parsing.
*   **Fuzzy Finding:** Extensive use of `fzf-lua` for fuzzy finding files, buffers, commands, and more.
*   **Clipboard:** Uses the system clipboard by default.
*   **Undo:** Persistent undo history is enabled and stored in `~/.undodir`.

## Building and Running

This is a Neovim configuration, not a standalone application. To use it, you need to have Neovim installed.

1.  **Clone the repository:**
    ```bash
    git clone <repository-url> ~/.config/nvim
    ```
2.  **Install external dependencies:** The `README.md` mentions that this configuration depends on external tools managed by Nix. You will need to have Nix installed and configured to install these dependencies.
3.  **Run Neovim:**
    ```bash
    nvim
    ```
    The first time you run Neovim, `lazy.nvim` will automatically install the configured plugins.

## Development Conventions

*   **Plugin Configuration:** Each plugin is configured in its own file within the `lua/plugins/` directory.
*   **Keybindings:** Keybindings are set within the plugin configurations, often using the `<leader>` key, which is mapped to the spacebar.
*   **Code Style:** The Lua code is well-formatted and follows standard Lua conventions.
