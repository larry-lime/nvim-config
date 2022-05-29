local options = {
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  cursorline = true,                       -- highlight the current line
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  tabstop = 2,                             -- insert 2 spaces for a tab
  shiftwidth = 2,                          -- the number of spaces inserted for each indentatioN
  relativenumber = true,                  -- set relative numbered lines
  backup = false,                          -- creates a backup file
  number = true,                           -- set numbered lines
  expandtab = true,                        -- convert tabs to spaces
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  laststatus = 3,
  fileencoding = "utf-8",                  -- the encoding written to a file
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = true,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  swapfile = false,                        -- creates a swapfile
  timeoutlen = 1000,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  wrap = false,                            -- display lines as one long line
  scrolloff = 4,                           -- is one of my fav
  sidescrolloff = 4,
  mouse=a,
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  hidden = true,
  hlsearch = false,                        -- highlight all matches on previous search pattern
  --guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end
 vim.opt.statusline = ''..
'%#TablineSel# ' ..
'Git %#CursorLine# ' ..
'%f 😊 ' ..
'%= ' ..
'%y ' ..
'%{&fileencoding?&fileencoding:&encoding}' ..
'[%{&fileformat}] ' ..
'%#TablineSel# ' ..
'%p%% ' ..
'%l/%L ' ..

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
