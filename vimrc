"=============================================================================
"     FILE:  .vimrc
"   AUTHOR:  Julie Engel (jeng) jeng@null.net
"  CREATED:  first version was somewhen in 2010
"
"   this is a modified version based off www.vi-improved.org/vimrc.php
"   and from Dr.-Ing. Fritz Mehner, the dude of the c.vim plugin.
"=============================================================================

" Source the vimrc file after saving it (make sense, doesn't it)
""if has("autocmd")
""  autocmd bufwritepost .vimrc source $MYVIMRC
""endif

let mapleader = ","             " remap leader trigger
"nore , :                       " remap coomand-line trigger

" in case you forgot sudo
cnoremap w!! w !sudo dd of=%

" source most common mistakes
"source ~/.vim/abbrv

" vim grep tipps
"   https://gist.github.com/3626719
"   https://github.com/toupeira/dotfiles/blob/master/vim/vimrc#L456-L515

" Vundle ----------------------------------------------------"{{{
"
" Brief help
"   :PluginList          - list configured plugins
"   :PluginInstall(!)    - install(update) plugins
"   :PluginSearch(!) foo - search(or refresh cache first) for foo
"   :PluginClean(!)      - confirm(or auto-approve) removal of unused plugins
" see :h vundle for more details or wiki for FAQ
"
" NOTE: now it seems its more like s/Bundle/Plugin/
"       therefore: :PluginInstall
"
" NOTE: comments after Bundle command are not allowed..

    filetype off                    " required!

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle      " required! 
    Plugin 'gmarik/vundle'

    " -- My Plugins here:
    "
    " original repos on github
    
    " vim-powerline:    powerful statusline
    "Plugin 'Lokaltog/vim-powerline'
    
    " vim-surround:     quoting/parenthesizing made simple
    Plugin 'tpope/vim-surround'
    " vim-repeat:       repeat motions (.) improved
    Plugin 'tpope/vim-repeat'
    " emmet-vim:        hi-speed html&css editing
    Plugin 'mattn/emmet-vim'
    " longline.vim:     helps with long lines
    Plugin 'Soares/longline.vim'
    " butane.vim:       del/close buffer without changing layout
    Plugin 'Soares/butane.vim'
    " vim-autoclose:    Intelligent autoclose plugin
    Plugin 'Townk/vim-autoclose'

    " vim-easytags
    Plugin 'xolox/vim-easytags'

    " vim-misc:
    Plugin 'xolox/vim-misc'
    " vim-notes:
    Plugin 'xolox/vim-notes'

    " vim-quicktask:
    Plugin 'aronbieber/vim-quicktask'
    
    " vim-markdown:     makes markdown a recognized ftype
    Plugin 'tpope/vim-markdown'
    " xmledit:          xml edit support
    Plugin 'sukima/xmledit'

    Plugin 'b4b4r07/vim-buftabs'

    ""Plugin 'tpope/vim-fugitive'
    ""Plugin 'Lokaltog/vim-easymotion'

    " vim-scripts repos
    Plugin 'buftabs'
    "Plugin 'c.vim'
    "Plugin 'fluxbox.vim'
    "Plugin 'fluxkeys.vim'
    "Plugin 'gtk-vim-syntax'
    "Plugin 'matrix.vim'
    " searchComplete:   Tab completion while searching
    Plugin 'SearchComplete'
   
    " non github repos
    ""Plugin 'http://git.wincent.com/command-t.git'

    call vundle#end()
    filetype plugin indent on     " required!
"}}}
" Plugin Configuratiion -------------------------------------"{{{

    " Butane: remap bclose
    nnoremap <leader>bd :Bclose<cr>
     
    " Easytags: Disable autoupdate
    "let g:easytags_auto_update = 0
    
    " Longline: Disabled till explicitly called
    let g:loaded_longline = 1
    let g:longline_autohl = 0
    let g:longline_maxlength = 80

    " Quicktask: default settings
    autocmd BufNewFile,BufRead *.qt setf quicktask
    let g:quicktask_snip_default_filetype = 'qt'
    let g:quicktask_snip_win_split_direction = 'vertical'
    
    " Vimnotes: Set notes plugin settings
    "let g:notes_directories = ['~/Documents/Notes', 
    "                           '~/Dropbox/Shared Notes']
    let g:notes_directories = ['~/notes']
    "let g:notes_directory = '~/notes/'
    let g:notes_suffix = '.txt'

    " Emmet: use <zen-leader>, for zencoding
    let g:user_emmet_install_global = 0
    let g:user_emmet_leader_key='<C-E>'
    autocmd FileType html,css EmmetInstall
"}}}
" Basics ----------------------------------------------------"{{{
    set t_Co=256                " set 256 term colors
    set title                   " gives | page.html (~) - VIM
    set nocompatible            " get out of vi-compatible mode
    set confirm                 " instead of silent failing, check it
    syntax on                   " syntax highlighting on
    ""set formatoptions=l       " for proper word wrapping
    ""set formatoptions=aron1
    set formatoptions=ron
    set wrap
    set lbr
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor
    "             |||||||      between joined lines
    "             |||||||+-- When a new match is created (showmatch)
    "             ||||||      pause for .5
    "             ||||||+-- Set buffer options when entering the
    "             |||||      buffer
    "             |||||+-- :write command updates current file name
    "             ||||+-- Automatically add <CR> to the last line
    "             |||      when using :@r
    "             |||+-- Searching continues at the end of the match
    "             ||      at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+t- :write updates alternative file name
    "             +-- :read updates alternative file name

    filetype plugin indent on   " load filetype plugins/indent settings
    set autochdir               " always switch to the current file dir
    set backspace=indent,eol,start " make backspace a more flexible
    set clipboard+=unnamed      " share windows clipboard
    set fileformats=unix,dos,mac " support all three, in this order
    set hidden                  " you can change buffers without saving
    set iskeyword+=_,$,@,%,#    " none of these are word dividers
    set mouse=a                 " use mouse everywhere
    set noerrorbells            " don't make noise

    set wildmenu                " turn on command line completion
                                " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    set wildmode=list:longest   " turn on wild mode huge list

    set backupdir=~/.vim/tmp,~/.tmp,/var/tmp,/tmp
    set directory=~/.vim/tmp,~/.tmp,/var/tmp,/tmp
"}}}
" Vim UI  ---------------------------------------------------"{{{
    set laststatus=2            " always show the status line
    set number                  " turn on line numbers
    set numberwidth=5           " We are good up to 99999 lines
    set ruler                   " Always show current positions
    set report=0                " tell when anything is changed via :...

    set nostartofline           " leave my cursor where it was
    set novisualbell            " don't blink annoyngly
    set scrolloff=10            " Keep 10 lines (top/bottom) for scope
    set sidescrolloff=10        " Keep 5 lines at the size
    set shortmess=aOstT         " shortens messages to avoid 'press a key'
    set showcmd                 " show the command being typed

    set fillchars=vert:│        " that's a vertical box-drawing character
                                " useful for split views ala :vsplit
    " Searching
    set incsearch               " do highlight as you type
    set hlsearch                " do not highlight searched for phrases

    set showmatch               " show matching brackets
    set matchtime=3             " blinking time for matching brackets
    "set timeoutlen=500          " time waiting for next char in command

    "if has('gui_running')
    "    set list
    "    set listchars=tab:▶\ ,eol:★
    "    set listchars+=trail:◥
    "    set listchars+=extends:❯
    "    set listchars+=precedes:❮
    "endif
    "set listchars=tab:»·,trail:«,eol:¶
    set listchars=tab:»·,trail:·,eol:¶
    "nmap <silent> <leader>s :set nolist!<CR>
    "}}}
" Text Formatting/Layout ------------------------------------"{{{
    set wrapmargin=15           " wrap too long sentences
    set wrapscan                " search scan wraps around file
    set autoindent              " file specific indent for newlines
    set autoread                " read open files again when changed outside Vim
    set expandtab               " no real tabs please!
    set ignorecase              " case insensitive by default
    set infercase               " case inferred by default
    set shiftround              " when at 3 spaces, and I hit > ...
                                " go to 4, not 5
    set smartcase               " if there are caps, go case-sensitive
    set shiftwidth=4            " auto-indent amount when using cindent,
                                " >>, << and stuff like that
    set softtabstop=4           " when hitting tab or backspace, how
                                " many spaces should a tab be
    set tabstop=4               " real tabs should be 8
    ""set virtualedit=block       " make it possible to select everything
    set virtualedit=all         " make it possible to select everything

    "neat firefox preview
    command Preview :!firefox %<CR>

    "highlights the background of text that is > 80 columns wide "
    "highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    "match OverLength /\%81v.\+/

    "if exists('+colorcolumn')
        "set colorcolumn=80
    "else
        ""au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
        "match ErrorMsg '\%>80v.+'
    "endif
"}}}
" Folding  --------------------------------------------------"{{{
    set foldenable              " Turn on folding
    set foldmethod=manual       " But do it manually
    
    " Generates \{\{\{ as fold markers -> ugly but saves folding
    set foldmethod=marker       " Fold on the marker
    " Otherwise you'd have to use :mkview & :loadview
    "au BufWinLeave * mkview
    ""au BufWinEnter * silent loadview
    
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements
                                                      " open folds
    function SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction "}
    set foldtext=SimpleFoldText() " Custom fold text function
                                  " (cleaner than default)
                                  "}}}
" Powerline / Statusline ------------------------------------"{{{
    autocmd VimEnter,BufRead,BufNewFile * highlight StatusLineGray  
        \   cterm=bold ctermfg=231 ctermbg=241 gui=bold guifg=white guibg=#666666
    autocmd VimEnter,BufRead,BufNewFile * highlight StatusLineRed
        \   cterm=bold ctermfg=231 ctermbg=88 gui=bold guifg=white guibg=#913d3b
    autocmd VimEnter,BufRead,BufNewFile * highlight StatusLineGreen
        \   cterm=bold ctermfg=231 ctermbg=28 gui=bold guifg=white guibg=#368736
 
    set statusline=
    set stl+=%#StatusLineGray#\ %n\ %*              " buffer number
    "set stl+=%#StatusLineGreen#%{fugitive#statusline()[4:-2]}%* " Git status
    set stl+=%#StatusLineRed#%r%*                   " read-only flag
    set stl+=%#StatusLineRed#%m%*                   " modified flag "
    set stl+=\ %<\"%f\"\                            " file name
    set stl+=%y                                     " file type
    set stl+=[%{strlen(&fenc)?&fenc:&enc}           " file encoding
    set stl+=%{&bomb?',BOM':''}                     " BOM flag
    set stl+=%{&ff!='unix'?','.toupper(&ff):''}]\   " file format
    set stl+=%=                                     " left/right separator
    set stl+=%-20.(%l/%L,%c%)\ %P                   " cursor position
 
    let Powerline_cache_enabled = 1
    if Powerline_cache_enabled == 0
        call system('rm -f ~/.vim/tmp/powerline.*.cache')
    end
 
    let Powerline_theme = 'desertink'
    let Powerline_colorscheme = 'desertink'
 
    if has('gui_running')
        let Powerline_cache_file = expand('~/.vim/tmp/powerline.gui.cache')
        let Powerline_symbols = 'fancy'
    else
        let Powerline_cache_file = expand('~/.vim/tmp/powerline.term.cache')
        let Powerline_symbols = 'unicode'
    end
"}}}
" Vimroom ---------------------------------------------------"{{{
" turn-on distraction free writing mode for all txt files
"au BufNewFile,BufRead *.{txt,rst,md,mdown,mkd,mkdn,markdown,mdwn} call VimRoom()

function VimRoom()
    ""set fullscreen                " go to fullscreen editing mode
    ""set background=light
    ""set lines=40 columns=100        " size of the editable area
    set laststatus=0                " don't show status line
    set showtabline=0               " don't tab bar
    set noruler                     " don't show ruler
    set nonumber                    " dont show numbers
    set foldcolumn=8                " add left margin
    highlight! link FoldColumn Normal
    highlight NonText ctermfg=235
    set wrapmargin=10               " Add a right margin, sort of
    set linebreak                   " break the lines on words

    " from write.vim
    setlocal spell wrap display+=lastline nolist noruler linebreak showtabline=0
    setlocal tw=0 nonu foldcolumn=8 wrapmargin=8 laststatus=0
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
endfunction

function VimRoomUnset()
    setlocal tw< nonu< nornu<
    setlocal spell< wrap< display< list< linebreak<
    silent! unmap <buffer> k
    silent! unmap <buffer> j
endfunction

command! WriteOn  call VimRoom()
command! WriteOff call VimRoomUnset()
"}}}
" Key Remapping ---------------------------------------------"{{{
"   :map     ==> recursive mapping
"     Recursive means that the mapping is expanded to a result,
"     then the result is expanded to another result, and so on,
"     until the result is no longer mapped to anything else,
"     or a non-recursive mapping has been applied.
"   :noremap ==> non-recursive mapping
"     Non-recursive means the mapping is only expanded once, 
"     and that result is applied/executed.
" Mode letters:
"   n --> normal mode only                  nmap, nnoremap
"   v --> visual and select mode            vmap, vnoremap
"   o --> operator pending                  omap, onoremap
"   x --> visual mode only                  vmap, vnoremap
"   s --> select mode only                  smap, snoremap
"   i --> insert mode only                  imap, inoremap
"   c --> command line mode                 cmap, cnoremap
"   i --> insert/command line/regexp-search imap, inoremap

    " == FUNCTION KEYS MAPPINGS ============================="{{{
    " F1: Vim-Help by default "
    " F2: Show/Hide hidden Chars
    map <silent> <F2> :set invlist<CR>
    " F3: how/Hide found pattern (After search)
    map <silent> <F3> :set invhlsearch<CR>
    " F4: Remove whitespace from end of lines
    map <silent> <F4> :%s/\s\+$//g<CR>
    " F5: ROT13 - fun
    map <F5> ggVGg?
    " F6: Make F5 reload .vimrc
    map <silent> <F5> :source ~/.vimrc<CR>
    " F7: Do a word count
    map <silent> <F7> g<C-G>
    " F8: Format paragraph
    map <silent> <F8> gwap
    " F9: Mapping for creating HTML of current buffer
    map <silent> <F9> :runtime! syntax/2html.vim<CR>
    " == END FUNCTION KEYS MAPPINGS ========================="}}}
     
    " == LEADER KEY MAPPINGS ================================"{{{
    " Yank Visual selection as a single line to system clipboard
    " Command: ,y
    vnoremap <silent><Leader>y "+y:let @+ = 
        \ join(map(split(@+, '\n'), 'substitute(v:val, "^\\s\\+", "", "")'), " ")<CR>

    " vim as a hex editor :)
    " Command: ,hex and ,nhex
    map <leader>hex :%!xxd<CR>
    map <leader>nhex :%xxd -r<CR>
    
    " make a line the same length as the line your currently on
    " Command: ,= and ,-
    nnoremap <leader>= yypVr=
    nnoremap <leader>- yypVr-

    " unset syntax for only one buffer
    " Command: ,soff
    nnoremap <leader>soff :set syntax=<CR>
    
    " toggle long line marker
    " Command: ,lt and ,ln and ,lp
    noremap <leader>lt :LongLineToggle<CR>
    noremap <leader>ln :LongLineNext<CR>
    noremap <leader>lp :LongLinePrev<CR>

    " == END LEADER KEY MAPPINGS ============================"}}}

    " space / shift-space scroll in normal mode
    nnoremap <space> <C-e>
    nnoremap <S-space> <C-y>
    
    " faster navigation
    nnoremap <C-e> 3<C-e>
    nnoremap <C-y> 3<C-y>
    
    " also allow scroll in insert mode
    inoremap <C-e> <C-o><C-e>
    inoremap <C-y> <C-o><C-y>
    
    " improve up/down movement on wrapped lines
    nnoremap j gj
    nnoremap k gk

    " remap cw & dw
    nnoremap cw ciw
    nnoremap dw daw

    " remap bd to Bclose from the butane plugin
    nnoremap bd :Bclose<CR>
    
    " original f is pretty useless, map it to search
    "nnoremap f /
    "nnoremap ff :nohlsearch<CR>

    "set window movement leading char to 's' so you dont get emacs fingers
    nnoremap s <C-W>

    "clear highlighted search result after a search
    map // :nohlsearch<CR>

    " map firefox keybindings
    "map <c-s-tab> :tabprevious<CR>
    "map <C-tab> :tabnext<CR>
    "map <C-t> :tabnew<CR>
    " tab navigation like firefox
    "nmap <c-s-tab> :tabprevious<cr>
    "nmap <c-tab> :tabnext<cr>
    "map <c-s-tab> :tabprevious<cr>
    "map <c-tab> :tabnext<cr>
    "imap <c-s-tab> <esc>:tabprevious<cr>i
    "imap <c-tab> <esc>:tabnext<cr>i
    "nmap <c-t> :tabnew<cr>:e<space>
    "imap <c-t> <esc>:tabnew<cr>:e<space>"

    " yank to EOL when with Y
    map Y y$

    " fix common typos
    :map :W :w
    cabbrev Wq wq
    cabbrev W w
    cabbrev Q q

    " vim as a hex editor :)
     map <leader>hex :%!xxd<CR>
     map <leader>nhex :%xxd -r<CR>

    " rempaping ` to '
    " 'a will jump to the line marked with ma
    " `a will jump to the line AND column so it's better
    nnoremap ' `
    nnoremap ` '

    " Buffer management
    nmap <C-tab> :bn<CR>
    imap <C-tab> <ESC>:bn<CR>i
    nmap <C-h> :bp<CR>
    nmap <C-l> :bn<CR>

    " enable visual shifting
    vnoremap < <gv
    vnoremap > >gv

    " set undo point after typing one of these characters
    inoremap , ,<C-g>u
    inoremap . .<C-g>u
    inoremap ! !<C-g>u
    inoremap ? ?<C-g>u
    inoremap : :<C-g>u

    " map CTRL+] to ctrl J (follow link in help file)
    noremap <C-j> <C-]>
"}}}
" Gui Settings =============================================="{{{
" some useful vim colorscheme generators:
"   http://www.villustrator.com/
"   http://bytefluent.com/vivify/
if has("gui_running")
    "win 83 50

    " colorscheme blackdust
    " colorscheme darktango
    " colorscheme dw_*
    " colorscheme jellybeans
    colorscheme kellys
    " matrix, molokai
    " colorscheme asmdev " my color scheme (only works in GUI)
    "colorscheme BusyBee

    "set go-=m go-=T go-=r go-=l
    set guioptions=e   "use GUI tabs, not console style tabs
    set guifont=PT\ Mono:h13
else
    syntax enable
    set background=dark
    "colorscheme Mustang_Vim_Colorscheme_by_hcalves
    "colorscheme wombat256mod
    "colorscheme xoria256
    "colorscheme newsprint
    "colorscheme default
    colorscheme jeng-256
    set nocursorline
endif
" ==========================================================="}}}
