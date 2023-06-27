set background=dark
highlight clear
if exists('syntax_on')
    syntax reset
endif
let g:colors_name = 'darkman'

highlight Normal       cterm=none    ctermfg=7                gui=none    guifg=#d3d3d3 guibg=#000000
highlight Visual       cterm=reverse             ctermbg=none gui=reverse
highlight Comment      cterm=none    ctermfg=33               gui=none
highlight Constant     cterm=none    ctermfg=106
highlight Identifier   cterm=bold    ctermfg=10
highlight Statement    cterm=none    ctermfg=184
highlight PreProc      cterm=none    ctermfg=170
highlight Type         cterm=none    ctermfg=45
highlight Special      cterm=none    ctermfg=106
highlight Todo         cterm=bold    ctermfg=15  ctermbg=8
highlight StatusLine   cterm=none    ctermfg=15  ctermbg=12
highlight Pmenu        cterm=none    ctermfg=0   ctermbg=13
highlight PmenuSel     cterm=none    ctermfg=15  ctermbg=93
highlight Search       cterm=none    ctermfg=0   ctermbg=11
highlight Directory    cterm=none    ctermfg=15
highlight SpecialKey   cterm=none    ctermfg=27
highlight MatchParen   cterm=none    ctermfg=15  ctermbg=43
highlight DiffAdd      cterm=bold    ctermfg=252 ctermbg=166
highlight DiffChange   cterm=none                ctermbg=128
highlight DiffDelete   cterm=none    ctermfg=232 ctermbg=234
highlight DiffText     cterm=bold    ctermfg=252 ctermbg=166
highlight QuickFixLine cterm=reverse ctermfg=42  ctermbg=none
highlight SpellBad     cterm=none    ctermfg=15  ctermbg=1
