local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize Windows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Window Management
keymap("n", "<leader>qq", ":call ExitVim()<CR>", opts)
-- :call ExitVim()<CR>
local result = vim.api.nvim_exec(
[[
function LoadSession(name)
    let b:sesh = join(["./.sessions/",a:name],"")
    if filereadable(b:sesh)
        silent! execute 'source ' b:sesh
    endif
endfunction

function MakeSession(name)
    tabdo NERDTreeClose
    tabdo TagbarClose
    let b:sesh = join(["./.sessions/",a:name],"")
    if !isdirectory("./.sessions")
        call mkdir("./.sessions", "p")
        silent! execute 'mksession! ' b:sesh
    else
        silent! execute 'mksession! ' b:sesh
    endif
endfunction

function ExitVim()
    call MakeSession('lastsession.vim')
    silent! execute 'qa!'
endfunction
]],
true)

-- Navigate Lines
keymap("n", "<S-l>", "g_", opts)
keymap("n", "<S-h>", "^", opts)
keymap("v", "<S-l>", "g_", opts)
keymap("v", "<S-h>", "^", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal Bindings

-- Navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- Escaping
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)

-- -------------------------------------------------------------------------------
-- Plugin Mappings
-- -------------------------------------------------------------------------------
-- Nvim-Tree
keymap("n", "<leader>nt", ":NERDTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope<CR>", opts)

-- Gitsigns
keymap("n", "]h", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "[h", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", opts)

-- Move Nvim
keymap('n', '<A-j>', ":MoveLine(1)<CR>", opts)
keymap('n', '<A-k>', ":MoveLine(-1)<CR>", opts)
keymap('v', '<A-j>', ":MoveBlock(1)<CR>", opts)
keymap('v', '<A-k>', ":MoveBlock(-1)<CR>", opts)
keymap('n', '<A-l>', ":MoveHChar(1)<CR>", opts)
keymap('n', '<A-h>', ":MoveHChar(-1)<CR>", opts)
keymap('v', '<A-l>', ":MoveHBlock(1)<CR>", opts)
keymap('v', '<A-h>', ":MoveHBlock(-1)<CR>", opts)
