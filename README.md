# Essential Luavim

## My Config
All the essential configurations needed to run Neovime like an IDE. None of the fluff. It should be noted however I will be transitioning to Lua-Vim in the near future.

## Table of Contents
1. [Installation](#installation)
2. [Terminal](#terminal)
3. [Keybindings](#keybindings)
5. [Plugins](#plugins)
    - [IDE Features](#ide-features)
    - [Language Support](#language-support)
    - [Git Integration](#git-integration)
    - [Themes](#themes)
    - [Aesthetics](#aesthetics)
    - [Add-Ons](#add-ons)

## Installation
Clone this repo to your `~/.config` directory and add rename it to `nvim` to use it as your Neovim config. If you have another folder names `nvim` in your `~/.config/` make sure you move or rename it to something like `nvim.old`.
```
git clone https://github.com/larry-lime/nvim-config-lua.git
```

## Terminal 
- Windows Terminal running Ubuntu 20.04 LTS in WSL 2
- Preferred font is Hack Nerdfont

## Keybindings
...

## Plugins
Packer is my plugin manager

### IDE Features
- nvim-dap -> Graphical Debugger
- nvim-tree -> Filetree
- Autosave -> Auto Save
- Tagbar -> Tag Bar
- Telescope -> Fuzzy Finder
- Anyfold -> Folding Manager
- Neoterm -> Terminal Emulator
- NERDCommenter -> Commenter
- Vim-Move -> Shifting Text Tool

### Language Support

```python
def func(arr):
    for i in arr:
        print(i)
    return arr

if __name__ == "__main__":
    func([1,2,3,4,5])
```

- Coc-nvim -> LSP
- Polygot -> Better Syntax Highlighting
- Vim-Json -> JSON Support

### Git Integration
- NERDTree Git -> Git integration for NERDTree
- Git Branch -> Git Statusline Integratino
- Git Gutter -> Git signs
- Vim Fugitive -> Git commands

### Themes
- Onedark
- Onehalf Light/Dark
### Aesthetics
- Nvim-Transparent -> Transparent Background
- Nerdtree Syntax Highlighting -> Syntax Highlighting for NERDTree
- Coc-FZF -> FZF Preview Window for Coc 
- Devicons -> Nerdfont Icons for Vim

### Add Ons
- Vimwiki -> Personal Wiki
- Github Copilot -> Github's AI Autocomplete
- Goyo

