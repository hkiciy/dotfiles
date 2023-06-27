set background=light
highlight clear
if exists('syntax_on')
    syntax reset
endif
let g:colors_name = 'lightman'

highlight Normal     cterm=none ctermfg=0   ctermbg=253
highlight Comment    cterm=none ctermfg=244
highlight Constant   cterm=none ctermfg=1
highlight Identifier cterm=bold ctermfg=22
highlight Statement  cterm=none ctermfg=52
highlight PreProc    cterm=none ctermfg=91
highlight Type       cterm=none ctermfg=19
highlight Special    cterm=none ctermfg=233
highlight Todo       cterm=bold ctermfg=15  ctermbg=0
highlight StatusLine cterm=none ctermfg=7   ctermbg=0
highlight Pmenu      cterm=none ctermfg=0   ctermbg=225
highlight PmenuSel   cterm=none ctermfg=233 ctermbg=176
highlight MatchParen cterm=none ctermfg=15  ctermbg=12
