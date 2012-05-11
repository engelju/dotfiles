" ===========================================================
" == vimrc (c) by Julie Engel, 2010
" == modified version from www.vi-improved.org/vimrc.php
" ===========================================================

" Source the vimrc file after saving it (make sense, doesn't it)
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" for the pathogen plugin
call pathogen#infect()
call pathogen#helptags()

" for the rather annoying html plugin
:let g:no_html_tab_mapping  = 'yes' "disables the annoying tab mapping
:let g:no_html_map_override = 'yes' "disables any mapping overrides
:let g:html_tag_case = 'lowercase'   "inserts lowercase tags
:let g:html_map_entities_leader = '\' "sets leader back to backslash

" for the vimpress plugin
let VIMPRESS=[{'username':'jengtron',
              \'password':'masowanda',
              \'blog_url':'http://tvandcode.wordpress.com/'
              \}]

" Basics ----------------------------------------------------
    set t_Co=256
    set title                   " gives | page.html (~) - VIM
    set nocompatible            " get out of vi-compatible mode
    set confirm                 " instead of silent failing, check it
    syntax on                   " syntax highlighting on
    set formatoptions=l         " for proper word wrapping
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

" General ---------------------------------------------------
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

" Vim UI  ---------------------------------------------------
    set laststatus=2            " always show the status line
    set incsearch               " do highlight as you type
    set hlsearch                " do not highlight searched for phrases
    set showmatch               " show matching brackets
    set matchtime=3             " blinking time for matching brackets
    set nostartofline           " leave my cursor where it was
    set novisualbell            " don't blink annoyngly
    set number                  " turn on line numbers
    set numberwidth=5           " We are good up to 99999 lines
    set report=0                " tell when anything is changed via :...
    set ruler                   " Always show current positions
    set scrolloff=10            " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT         " shortens messages to avoid 'press a key'
    set showcmd                 " show the command being typed
    set sidescrolloff=10        " Keep 5 lines at the size

" Text Formatting/Layout ------------------------------------
    set wrapmargin=15           " wrap too long sentences
    set autoindent              " file specific indent for newlines
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
    set tabstop=8               " real tabs should be 8

    command Preview :!firefox %<CR> "neat firefox preview

    "highlights the background of text that is > 80 columns wide "
    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%81v.\+/

    if exists('+colorcolumn')
        set colorcolumn=80
    else
        "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
        match ErrorMsg '\%>80v.+'
    endif

" Folding  --------------------------------------------------
    set foldenable              " Turn on folding
    set foldmethod=manual       " But do it manually
    set foldmethod=marker       " Fold on the marker
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements
                                                      " open folds
    function SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }
    set foldtext=SimpleFoldText() " Custom fold text function
                                  " (cleaner than default)

" Mappings --------------------------------------------------

    " == FUNCTION KEYS MAPPINGS =============================
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
    " == END FUNCTION KEYS MAPPINGS =========================

    " space / shift-space scroll in normal mode
    noremap <S-space> <C-y>
    noremap <space> <C-e>

    " improve up/down movement on wrapped lines
    nnoremap j gj
    nnoremap k gk

    " faster navigation
    nnoremap <C-e> 3<C-e>
    nnoremap <C-y> 3<C-y>
    vnoremap <C-e> 3<C-e>
    vnoremap <C-y> 3<C-y>

    " map firefox keybindings
    ":map <C-S-tab> :tabprevious<CR>
    "map <C-tab> :tabnext<CR>
    "map <C-t> :tabnew<CR>

    " yank to EOL when with Y
    map Y y$

    " Set html creation to use style sheets
    let html_use_css = 1

    " fix common typos"
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

    " remap coomand-line trigger
    nore , :

    " Buffer management
    nmap <C-tab> :bn<CR>
    imap <C-tab> <ESC>:bn<CR>i
    "nmap <TAB> :b#<CR>
    nmap <C-h> :bp<CR>
    nmap <C-l> :bn<CR>
    nmap <C-q> :bd<CR>
    nmap <C-d> :bw<CR>
    vmap <C-d> :bw<CR>

    " enable visual shifting
    vnoremap < <gv
    vnoremap > >gv

" Gui Settings ==============================================
if has("gui_running")
    win 83 50
    colorscheme asmdev " my color scheme (only works in GUI)
    set guioptions=e   "use GUI tabs, not console style tabs
    "set go-=m go-=T go-=r go-=l
    "set guifont=DejaVu\ LGC\ Sans\ Mono\ 9
    set guifont=Monospace\ 9
else
    syntax enable
    set background=dark
    "colorscheme Mustang_Vim_Colorscheme_by_hcalves
    "colorscheme wombat256mod
    colorscheme default
    "colorscheme xoria256
    set nocursorline
endif
" ===========================================================
