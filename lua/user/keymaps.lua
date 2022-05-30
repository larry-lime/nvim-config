--     __ __
--    / //_/__  __  ______ ___  ____ _____  _____
--   / ,< / _ \/ / / / __ `__ \/ __ `/ __ \/ ___/
--  / /| /  __/ /_/ / / / / / / /_/ / /_/ (__  )
-- /_/ |_\___/\__, /_/ /_/ /_/\__,_/ .___/____/
--           /____/               /_/

-- FUNCTIONS --
vim.api.nvim_exec(
  [[
function LoadSession(name)
    let b:sesh = join(["./.sessions/",a:name],"")
    if filereadable(b:sesh)
        silent! execute 'source ' b:sesh
    endif
endfunction

function MakeSession(name)
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
]] ,
  true)

-- KEYBOARD SHORTCUTS --
local opts = { noremap = true, silent = true }
local nopts = { noremap = true, silent = false }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--Set Leader Key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save Sessions
keymap("n", "<leader>ss", ":call MakeSession('mysession.vim') | tabn<CR>", opts)
keymap("n", "<leader>sl", ":call LoadSession('lastsession.vim')<CR>", opts)
keymap("n", "<leader>qq", ":call ExitVim()<CR>", opts)

-- Buffer Navigation
keymap("n", "<leader>oo", ":bd!<CR>", opts)
keymap("n", "<leader>oa", ":%bd! | e# |bd#<CR>", opts)

-- Open and Close Tabs
keymap("n", "<leader>tn", ":tabnew<CR>", opts)
keymap("n", "<leader>tc", ":tabclose<CR>", opts)
keymap("n", "<leader>mm", ":tab sb %<CR>", opts)
keymap("n", "<leader>mx", ":tabclose<CR>", opts)
keymap("n", "<leader>rn", "*Ncgn", opts)
keymap("n", "<leader>v", "g_v^", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Surround Quotes
keymap("n", [[<leader>']], [[ciw'<C-R>"'<Esc>]], opts)
keymap("n", [[<leader>"]], [[ciw"<C-R>""<Esc>]], opts)
keymap("n", [[<leader>(]], [[ciW(<C-R>")<Esc>F(]], opts)
keymap("n", [[<leader>[]], [[ciW[<C-R>"]<Esc>F[]], opts)
keymap("n", [[<leader>{]], [[ciW{<C-R>"}<Esc>]], opts)
keymap("n", [[<leader>`]], [[ciw`<C-R>"`<Esc>]], opts)
keymap("v", [[<leader>']], [[c'<C-R>"'<Esc>]], opts)
keymap("v", [[<leader>"]], [[c"<C-R>""<Esc>]], opts)
keymap("v", [[<leader>(]], [[c(<C-R>")<Esc>F(]], opts)
keymap("v", [[<leader>[]], [[c[<C-R>"]<Esc>F[]], opts)
keymap("v", [[<leader>{]], [[c{<C-R>"}<Esc>]], opts)
keymap("v", [[<leader>`]], [[c`<C-R>"`<Esc>]], opts)

-- Resize Windows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate Lines
keymap("n", "<S-l>", "g_", opts)
keymap("n", "<S-h>", "^", opts)
keymap("v", "<S-l>", "g_", opts)
keymap("v", "<S-h>", "^", opts)

-- TERMINAL BINDINGS --

-- Open Terminal
keymap("n", "<leader>pp", ":split | set nonu | set nornu | resize -15 | terminal<CR>", term_opts)

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
keymap("n", "<A-n>", ":NvimTreeOpen<CR>", opts)
keymap("n", "<leader>nf", ":NvimTreeFindFile<CR>", opts)
keymap("n", "<leader>nt", ":NvimTreeToggle<CR>", opts)

-- Tagbar
keymap("n", "<leader>tb", ":TagbarToggle<CR>", opts)
keymap("n", "<A-t>", ":TagbarOpen<CR>", opts)


-- Nvim-Dap
keymap("n", "<leader>di", ":aboveleft split ~/.config/nvim/dap-instructions.md<CR>", nopts)

keymap("n", "<leader>ds", ":lua require'dap'.continue()<CR>", nopts)
keymap("n", "<leader>de", ":lua require'dap'.disconnect()<CR>", opts)
keymap("n", "<leader>.", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>bc", ":lua require'dap'.clear_breakpoints()<CR>", opts)
keymap("n", "<`>`>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F10>", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F11>", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<F12>", ":lua require'dap'.step_back()<CR>", opts)

-- Telescope
keymap("n", "<leader>tl", ":Telescope<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>cl", ":Telescope colorscheme<CR>", opts)
keymap("n", "<leader>bl", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>rg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>mp", ":Telescope keymaps<CR>", opts)

-- Harpoon
keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
-- keymap("n", "<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>", opts)
-- keymap("n", "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>", opts)

-- Fugitive & Gitsigns
keymap("n", "<leader>gaa", ":G add ", nopts)
keymap("n", "<leader>gpo", ":G push origin ", nopts)
keymap("n", "<leader>ga%", ":G add % | echo 'Git Add Current File'<CR>", opts)
keymap("n", "<leader>ga.", ":G add . | echo 'Git Add All Files'<CR>", opts)
keymap("n", "<leader>gr%", ":G reset % | echo 'Git Reset Current File'<CR>", opts)
keymap("n", "<leader>gr.", ":G reset . | echo 'Git Reset All Files'<CR>", opts)
keymap("n", "<leader>gs", ":G status<CR>", opts)
keymap("n", "<leader>gc", ":G commit | startinsert<Cr>", opts)
keymap("n", "<leader>gl", ":G log<CR>", opts)
keymap("n", "<leader>gb", ":G branch<CR>", opts)
keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>", opts)
keymap("n", "]h", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "[h", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", opts)
-- keymap("n","<leader>go",":call Gopen()",nopts)

-- Move Nvim
keymap('n', '<A-j>', ":MoveLine(1)<CR>", opts)
keymap('n', '<A-k>', ":MoveLine(-1)<CR>", opts)
keymap('v', '<A-j>', ":MoveBlock(1)<CR>", opts)
keymap('v', '<A-k>', ":MoveBlock(-1)<CR>", opts)
keymap('n', '<A-l>', ":MoveHChar(1)<CR>", opts)
keymap('n', '<A-h>', ":MoveHChar(-1)<CR>", opts)
keymap('v', '<A-l>', ":MoveHBlock(1)<CR>", opts)
keymap('v', '<A-h>', ":MoveHBlock(-1)<CR>", opts)
