--     __ __
--    / //_/__  __  ______ ___  ____ _____  _____
--   / ,< / _ \/ / / / __ `__ \/ __ `/ __ \/ ___/
--  / /| /  __/ /_/ / / / / / / /_/ / /_/ (__  )
-- /_/ |_\___/\__, /_/ /_/ /_/\__,_/ .___/____/
--           /____/               /_/

-- TODO Convert all these functions to Lua
vim.api.nvim_exec(
  [[

function Jump_middle()
  execute "normal ^"
  let b:column = col('.')
  let b:loc = (virtcol('$') + b:column)/2
  call cursor(0, b:loc)
endfunction

if has('wsl')
    let g:clipboard = {
          \   'name': 'wslclipboard',
          \   'copy': {
          \      '+': '/mnt/c/Users/larry/scoop/apps/neovim/0.6.1/bin/win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': '/mnt/c/Users/larry/scoop/apps/neovim/0.6.1/bin/win32yank.exe -i --crlf',
          \   },
          \   'cache_enabled': 1,
          \ }
endif

let g:focusup_md = 0
function FocusUpToggle()
    if (g:focusup_md == 0)
        let g:focusup_md = 1
        :Goyo
        set wrap | set linebreak | set winbar=
        nnoremap j gj
        nnoremap k gk
        nnoremap A g$a
        nnoremap I g^i
        nnoremap ( g^
        nnoremap ) g$
        vnoremap ( g^
        vnoremap ) g$
    else
        let g:focusup_md = 0
        :Goyo
        set nowrap | set linebreak | set winbar="%=%m%f",
        unmap j
        unmap k
        unmap A
        unmap I
        nnoremap ) g_
        nnoremap ( ^
        vnoremap ) g_
        vnoremap ( ^
    endif
endfunction
]] , true)

-- KEYBOARD SHORTCUTS --
local opts = { noremap = true, silent = true }
local nopts = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

--Set Leader Key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save Sessions
keymap("n", "<leader>ss", ":Obsession<CR>", opts)
keymap("n", "<leader>sl", ":source Session.vim<CR>", opts)
keymap("n", "<leader>qq", ":qa!<CR>", opts)

-- Copy paste
keymap("v", "<C-c>", '"+y', opts)

-- Focus Up Mode
keymap("n", "<leader>z", ":call FocusUpToggle()<CR>", opts)

-- Buffers
keymap("n", "<C-s>", "<C-^>", opts)
keymap("n", "]b", ":bnext<CR>", opts)
keymap("n", "[b", ":bprevious<CR>", opts)
keymap("n", "<leader>oo", ":bd!<CR>", opts)
keymap("n", "<leader>oa", ":%bd! | e# |bd#<CR>", opts)

-- Tabs
keymap("n", "<C-t>", ":tabnew<CR>", opts)
keymap("n", "<C-w>", ":tabclose<CR>", opts)
keymap("n", "<leader>mm", ":tabnew %<CR>", opts)
keymap("n", "<leader>mx", ":tabclose<CR>", opts)

-- Tab Navigation
keymap("n", "<leader><F1>", "1gt", opts)
keymap("n", "<leader><F2>", "2gt", opts)
keymap("n", "<leader><F3>", "3gt", opts)
keymap("n", "<leader><F4>", "4gt", opts)
keymap("n", "<leader><F5>", "5gt", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Surround Quotes
keymap("n", "<leader>v", "g_<C-v>^", opts)
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

-- Line Navigation
keymap("n", ")", "g_", opts)
keymap("n", "(", "^", opts)
keymap("v", ")", "g_", opts)
keymap("v", "(", "^", opts)
keymap("n", "-", ":call Jump_middle()<CR>", opts)
keymap("v", "-", ":call Jump_middle()<CR>", opts)

-- Renaming words
keymap("n", "<leader>rn", "*Ncgn", opts)

-- TERMINAL BINDINGS --

-- Navigation
keymap("t", "<C-\\>", "<C-\\><C-N>", opts)
keymap("t", "<Esc>", "<Esc>", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)

-- Nvim-Tree
keymap("n", "<A-n>", ":NvimTreeOpen<CR>", opts)
keymap("n", "<leader>nf", ":NvimTreeFindFile<CR>", opts)
keymap("n", "<leader>nt", ":NvimTreeToggle<CR>", opts)

-- Tagbar
keymap("n", "<leader>tb", ":TagbarToggle<CR>", opts)
keymap("n", "<A-t>", ":TagbarOpen['j']<CR>", opts)
keymap("n", "]t", ":TagbarJumpNext<CR>", opts)
keymap("n", "[t", ":TagbarJumpPrev<CR>", opts)

-- Nvim-Dap
keymap("n", "<leader>ds", ":lua require'dap'.continue()<CR>", nopts)
keymap("n", "<leader>de", ":lua require'dap'.disconnect()<CR>", opts)
keymap("n", "<leader>.", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>bc", ":lua require'dap'.clear_breakpoints()<CR>", opts)
keymap("n", "<`>`>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F10>", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F11>", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<F12>", ":lua require'dap'.step_back()<CR>", opts)

-- FUGITIVE
keymap("n", "<leader>gaa", ":G add ", nopts)
keymap("n", "<leader>gpp", ":G push origin ", nopts)
keymap("n", "<leader>ga%", ":G add % | echo 'Git Add Current File'<CR>", opts)
keymap("n", "<leader>ga.", ":G add . | echo 'Git Add All Files'<CR>", opts)
keymap("n", "<leader>gr%", ":G reset % | echo 'Git Reset Current File'<CR>", opts)
keymap("n", "<leader>gr.", ":G reset . | echo 'Git Reset All Files'<CR>", opts)
keymap("n", "<leader>gc", ":G commit | startinsert<Cr>", opts)
keymap("n", "<leader>gl", ":G log<CR>", opts)
keymap("n", "<leader>gb", ":G branch | resize -20<CR>", opts)

-- TELESCOPE
keymap("n", "<leader>tl", ":Telescope<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fi", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>cl", ":Telescope colorscheme<CR>", opts)
keymap("n", "<leader>bl", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>rg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>jl", ":Telescope jumplist<CR>", opts)
keymap("n", "<leader>mp", ":Telescope keymaps<CR>", opts)
keymap("n", "<leader>sp", ":Telescope spell_suggest<CR>", opts)
keymap("n", "<leader>td", ":lua require('telescope.builtin').grep_string({prompt_title='TODO List',search='TODO'})<CR>", opts)
keymap("n", "<leader>rs", ":lua require('telescope.builtin').resume()<CR>", opts)
keymap("n", "<leader>gs", ":Telescope git_status<CR>", opts)

-- Harpoon
keymap("n", "<leader>=", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>a", ":echo 'File added to harpoon' |lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<leader>1", ":echo 'Nav File 1'| lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<leader>2", ":echo 'Nav File 2'|lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", "<leader>3", ":echo 'Nav File 3'|lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap("n", "<leader>4", ":echo 'Nav File 4'|lua require('harpoon.ui').nav_file(4)<CR>", opts)
keymap("n", "<leader>5", ":echo 'Nav File 5'|lua require('harpoon.ui').nav_file(5)<CR>", opts)
keymap("n", "<leader>6", ":echo 'Nav File 6'|lua require('harpoon.ui').nav_file(6)<CR>", opts)

-- Gitsigns
keymap("n", "]h", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "[h", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>ha", ":Gitsigns stage_hunk<CR>", opts)
keymap("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", opts)
keymap("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>", opts)

-- Open Github
keymap("n", "<leader>go", ":call Gopen()<CR>", opts)

-- Move Nvim
keymap('n', '<A-j>', ":MoveLine(1)<CR>", opts)
keymap('n', '<A-k>', ":MoveLine(-1)<CR>", opts)
keymap('v', '<A-j>', ":MoveBlock(1)<CR>", opts)
keymap('v', '<A-k>', ":MoveBlock(-1)<CR>", opts)
keymap('n', '<A-l>', ":MoveHChar(1)<CR>", opts)
keymap('n', '<A-h>', ":MoveHChar(-1)<CR>", opts)
keymap('v', '<A-l>', ":MoveHBlock(1)<CR>", opts)
keymap('v', '<A-h>', ":MoveHBlock(-1)<CR>", opts)
