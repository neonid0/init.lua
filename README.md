# neonid0's Neovim Configuration

This is my personal Neovim (nvim) configuration, managed as a standalone repository. It is designed to be used as a submodule within my main [.dotfiles repository](https://github.com/neonid0/.dotfiles) but can also be used as a standalone config.

This setup is built to be a fast, modern, and productive IDE-like experience, heavily integrated with tools like `mcp-hub`.

---

## 📸 Preview

(This is the perfect place to put a screenshot of your Neovim setup, showing off your theme, LSPs, and file tree.)



---

## ✨ Features

* **Plugin Manager:** [Lazy.nvim](https://github.com/folke/lazy.nvim)
* **LSP-Ready:** Pre-configured for:
    * Web (TypeScript, Next.js, HTML, CSS)
    * .NET (C#)
    * Java (Spring Boot)
    * Python (AI/ML)
* **Core Integration:** Relies on [mcp-hub](https://www.npmjs.com/package/mcp-hub) for enhanced functionality.
* **UI:** Clean, minimal, and functional. (e.g., Lualine, Telescope, Nvim-Tree)
* **Syntax & Theming:** (e.g., Treesitter for syntax, Nightfox theme)

---

## 📋 Prerequisites

Before installing, make sure you have the following dependencies.

* **Neovim (v0.11.0+)**
* **A Nerd Font:** This config is designed to use **Caskaydia Cove Nerd Font**. But you can use any Nerd Font of your choice. Download from [Nerd Fonts](https://www.nerdfonts.com/).
* **`git`:** Required for plugin management.
* **`npm`:** Required for `mcp-hub`.
* **`cargo`:** Required by many Neovim plugins (e.g., Telescope, ripgrep).
* **`mcp-hub`:** Must be installed globally:
    ```bash
    npm install -g mcp-hub@latest
    ```

---

## 🚀 Installation

There are two ways to install this configuration.

### Method 1: Standalone (Recommended)

If you *only* want this Neovim configuration:

1.  **Backup your old config** (if you have one):
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    ```

2.  **Clone this repository:**
    ```bash
    git clone https://github.com/neonid0/init.lua.git ~/.config/nvim
    ```

3.  **Launch Neovim:**
    ```bash
    nvim
    ```
    Your plugin manager (e.g., Lazy.nvim) should automatically run and install all the plugins.

### Method 2: As part of my Dotfiles (Intended Use)

This repository is managed as a submodule by my main [dotfiles](https://github.com/neonid0/dotfiles).

To install my complete setup (including this nvim config, `zsh`, `i3`, etc.), please follow the instructions in that repository's `README.md`.
