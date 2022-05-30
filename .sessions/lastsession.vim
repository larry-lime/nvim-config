let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/.config/nvim/.gitignore
badd +7 ~/.config/nvim/lua/user/autocmd.lua
badd +1 ~/.config/nvim/lua/user/plug/gitsigns.lua
badd +136 lua/user/keymaps.lua
badd +39 /mnt/c/Users/larry/nyu/ics/final_project/chat_client_class.py
badd +1 ~/.config/nvim/lua/user/lsp/handlers.lua
badd +141 ~/.config/nvim/lua/user/cmp.lua
badd +5 ~/.config/nvim/lua/user/plug/autosave.lua
badd +19 ~/.config/nvim/init.lua
argglobal
%argdel
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit lua/user/keymaps.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 30 + 79) / 158)
exe 'vert 2resize ' . ((&columns * 63 + 79) / 158)
exe 'vert 3resize ' . ((&columns * 63 + 79) / 158)
argglobal
enew
file NvimTree_2
balt lua/user/keymaps.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
balt ~/.config/nvim/init.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 136 - ((20 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 136
normal! 048|
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/lua/user/lsp/handlers.lua", ":p")) | buffer ~/.config/nvim/lua/user/lsp/handlers.lua | else | edit ~/.config/nvim/lua/user/lsp/handlers.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/user/lsp/handlers.lua
endif
balt lua/user/keymaps.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 58 - ((16 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 58
normal! 07|
wincmd w
exe 'vert 1resize ' . ((&columns * 30 + 79) / 158)
exe 'vert 2resize ' . ((&columns * 63 + 79) / 158)
exe 'vert 3resize ' . ((&columns * 63 + 79) / 158)
tabnext
edit ~/.config/nvim/lua/user/plug/autosave.lua
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 5 - ((4 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 029|
tabnext 2
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
