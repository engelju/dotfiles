" Vim color file
" Based on:     256-gravim by Piotr Husiatyński <phusiatynski@gmail.com>
" Maintainer:	Julie Engel (jeng@null.net)

set background=dark
set t_Co=256
let g:colors_name="jeng-256"

let python_highlight_all = 1
let c_gnu = 1

" == Text; Miscellaneous ==================================================
hi Normal	ctermfg=253         ctermbg=235        cterm=None
hi SpecialKey	ctermfg=87          ctermbg=None       cterm=Bold
hi VertSplit    ctermfg=247         ctermbg=234        cterm=Bold
""hi SignColumn ctermbg=234         ctermfg=141        cterm=none
hi NonText	ctermfg=247         ctermbg=None       cterm=None
hi Directory	ctermfg=76          ctermbg=None       cterm=None
""hi Title      ctermbg=234         ctermfg=84         cterm=bold

" == Cursor ===============================================================
hi Cursor       ctermfg=Red         ctermbg=None       cterm=None
""hi CursorIM   ctermbg=227         ctermfg=234        cterm=none
""hi CursorColumn   ctermbg=0                          cterm=none
""hi CursorLine     ctermbg=0                          cterm=none

" == Folding ==============================================================
hi Folded       ctermfg=247         ctermbg=234       cterm=None
hi FoldColumn	ctermfg=247         ctermbg=233       cterm=Bold
    
" == Line Info ============================================================
"hi LineNr	ctermfg=247         ctermbg=235        cterm=Bold
hi LineNr	ctermfg=238         ctermbg=244        cterm=None
hi LineNr	ctermfg=247         ctermbg=236        cterm=None
hi StatusLine   ctermfg=247         ctermbg=233        cterm=Bold
hi StatusLineNC ctermfg=247         ctermbg=238        cterm=None
    
" == Messages =============================================================
hi ErrorMsg     ctermfg=124         ctermbg=White      cterm=None
""hi Question   ctermbg=234         ctermfg=214        cterm=none
""hi WarningMsg ctermbg=214         ctermfg=0          cterm=none
""hi MoreMsg    ctermbg=234         ctermfg=214        cterm=none
""hi ModeMsg    ctermbg=234         ctermfg=214        cterm=none

" == Search ===============================================================
"hi Search      ctermfg=0           ctermbg=111         cterm=None
""call s:X("Search","f0a0c0","302028","underline","Magenta","")
hi Search	ctermfg=253         ctermbg=DarkGrey   cterm=underline
hi IncSearch    ctermbg=253         ctermfg=DarkGrey   cterm=underline
    
" == Diff =================================================================
hi DiffText	ctermfg=88          ctermbg=250        cterm=None
""hi DiffAdd    ctermbg=22          ctermfg=208        cterm=none
""hi DiffChange ctermbg=235         ctermfg=130        cterm=none
""hi DiffDelete ctermbg=234         ctermfg=208        cterm=none

" == Menu =================================================================
hi Pmenu        ctermfg=White       ctermbg=DarkGray   cterm=None
hi PmenuSel     ctermfg=None        ctermbg=Gray       cterm=Bold
hi PmenuSbar    ctermfg=DarkGray    ctermbg=DarkGray   cterm=None
hi PmenuThumb   ctermfg=Gray        ctermbg=Gray       cterm=None

" == Tabs =================================================================
""hi TabLine    ctermbg=233         ctermfg=234        cterm=none
""hi TabLineFill    ctermbg=0                          cterm=none
""hi TabLineSel ctermbg=234         ctermfg=252        cterm=bold 

" == Visual Mode ==========================================================
""hi Visual     ctermbg=0           ctermfg=215        cterm=none 
""hi VisualNOS  ctermbg=0           ctermfg=241        cterm=none

" == Code =================================================================
hi Comment      ctermfg=244         ctermbg=None       cterm=None
"hi Constant	ctermfg=160         ctermbg=None       cterm=Bold
hi Constant	ctermfg=208         ctermbg=None       cterm=None
""hi Delimiter  ctermbg=234         ctermfg=204        cterm=none
hi Error	ctermfg=233         ctermbg=124        cterm=Bold
""hi Exception  ctermbg=234         ctermfg=203        cterm=none 
"hi Function     ctermbg=234         ctermfg=117        cterm=none
hi Function     ctermfg=None        ctermbg=None       cterm=underline
hi Identifier	ctermfg=111         ctermbg=None       cterm=Bold
hi Ignore       ctermfg=220         ctermbg=None       cterm=Bold
""hi MatchParen ctermbg=214         ctermfg=234        cterm=none
""hi Operator   ctermbg=234         ctermfg=204        cterm=none
hi PreProc	ctermfg=246         ctermbg=None       cterm=Bold
hi Special	ctermfg=160         ctermbg=None       cterm=Bold
hi Statement	ctermfg=75          ctermbg=None       cterm=None
hi String	ctermfg=1           ctermbg=None       cterm=None
"hi Todo        ctermfg=0           ctermbg=11         cterm=None
hi Todo         ctermfg=0           ctermbg=1          cterm=None
hi Type		ctermfg=75          ctermbg=None       cterm=Bold
""hi Underlined ctermbg=234         ctermfg=203        cterm=underline
hi Underline    ctermfg=244         ctermbg=None       cterm=None
 
" == Code; HTML Specfici ==================================================
""hi htmlBold                 ctermbg=234  ctermfg=252   cterm=bold
""hi htmlBoldItalic           ctermbg=234  ctermfg=252   cterm=bold,italic
""hi htmlBoldUnderline        ctermbg=234  ctermfg=252   cterm=bold,underline
""hi htmlBoldUnderlineItalic  ctermbg=234  ctermfg=252   cterm=bold,underline,italic
""hi htmlItalic               ctermbg=234  ctermfg=252   cterm=italic
""hi htmlUnderline            ctermbg=234  ctermfg=252   cterm=underline
""hi htmlUnderlineItalic      ctermbg=234  ctermfg=252   cterm=underline,italic
