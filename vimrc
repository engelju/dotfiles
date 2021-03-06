"=============================================================================
"     FILE:  .vimrc
"   AUTHOR:  Julie Engel (jeng) jeng@null.net
"  CREATED:  first version was somewhen in 2010
"
"   this is a modified version based off www.vi-improved.org/vimrc.php
"   and from Dr.-Ing. Fritz Mehner, the dude of the c.vim plugin.
"=============================================================================

" source the vimrc file after saving it (make sense, doesn't it)
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" remap leader trigger
nnoremap <SPACE> <Nop>
let mapleader = " "
" remap command-line trigger
nore , :

cnoremap w!! w !sudo dd of=%
" in case you forgot sudo

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

    filetype off                    " required!

    " Autoinstall Vundle {{{
    if empty(glob('~/.vim/bundle/Vundle.vim'))
        silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        autocmd VimEnter * PluginInstall
    endif
    " }}}

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle      " required!
    Plugin 'VundleVim/Vundle.vim'

    " -- My Plugins here:

    " -- GUI
    " lightline:        powerful statusline
    Plugin 'itchyny/lightline.vim'
    " vim-bufferline:   display bufferlist in cmdline
    Plugin 'bling/vim-bufferline'
    " vim-bufkill:      del/close buffer without changing layout
    Plugin 'qpkorr/vim-bufkill'
    " vim-gitgutter:    display git changes in gutter
    Plugin 'airblade/vim-gitgutter'
    " vim-signature:    show markers in gutter
    Plugin 'kshenoy/vim-signature'
    " vim-css-color:    show the colors (ie. #fff)
    Plugin 'ap/vim-css-color'
    " nerdtree:         left hand side file explorer
    Plugin 'scrooloose/nerdtree'

    " -- text navigation / text manipulation
    " vim-surround:     quoting/parenthesizing (ds, cs, ys)
    Plugin 'tpope/vim-surround'
    " vim-commentary:   gc{motion} to add comments
    Plugin 'tpope/vim-commentary'
    " vim-repeat:       repeat motions (.) improved
    Plugin 'tpope/vim-repeat'
    " clever-f.vim:     better handling of 'f'
    Plugin 'rhysd/clever-f.vim'
    " vim-eunuch:       add :Remove, :Rename et al.
    Plugin 'tpope/vim-eunuch'
    " vim-characterize: ga (dec/oc/hex on a char) + unicode, vim, emoji, html
    Plugin 'tpope/vim-characterize'
    " targets.vim:      faster/better ciw/cib etc
    Plugin 'wellle/targets.vim'
    "Plugin 'kana/vim-textobj-user'
    "Plugin 'kana/vim-textobj-indent'
    "Plugin 'kana/vim-textobj-function'
    "Plugin 'kana/vim-textobj-datetime'

    " -- programming helpers
    " vim-easytags:     autogenerate ctags
    Plugin 'xolox/vim-misc'
    Plugin 'xolox/vim-easytags'
    " ultisnips:        snippet manager
    " see http://vimcasts.org/episodes/meet-ultisnips/
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    " vimagit:          emacs magit in vim
    Plugin 'jreybert/vimagit'
    " vim-gitbranch:    get current branch with gitbranch#name()
    Plugin 'itchyny/vim-gitbranch'
    " vim-autoclose:    intelligent autoclose plugin
    Plugin 'Townk/vim-autoclose'

    " -- additional filetype support
    " emmet-vim:        hi-speed html&css editing
    "Plugin 'mattn/emmet-vim'
    "Plugin 'sheerun/vim-polyglot'
    Plugin 'spf13/PIV'
    "Plugin 'othree/javascript-libraries-syntax'
    Plugin 'tpope/vim-markdown'
    Plugin 'tpope/vim-jdaddy'
    Plugin 'sukima/xmledit'
    Plugin 'qbbr/vim-twig'
    Plugin 'ekalinin/Dockerfile.vim'

    Plugin 'xolox/vim-notes'

    " plugins to test:
    " ----------------
    " tpope/vim-sleuth      --> adjust shiftwidth and expandtab based on project
    " tommcdo/vim-lion      --> algin text; gl & gL ==> glip= / 4gLi(
    " samsonw/vim-task      --> simple todo.txt task list formatter
    " dhruvasagar/vim-table-mode
    "   --> <leader>tm = create tables, <leader>tt with existing text
    "   --> <leader>tdd delete table row, <leader>tdc delete table column
    "   --> add text obj: i| a| & [| move left ]| move right {| & }| - up & down
    " textobjects:
    "   coderifous/textobj-word-column.vim  --> ic / ac, iC / aC
    "
    " vim-instant-markdown: instantly preview md files
    "Plugin 'suan/vim-instant-markdown'

    call vundle#end()
    filetype plugin indent on     " required!
"}}}
" Plugin Configuration --------------------------------------"{{{

    " Lightline: {{{
    let g:lightline = {
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'filename'],
          \             [ 'gitbranch'], ['gitgutter'] ]
          \ },
          \ 'component_function': {
          \   'gitbranch': 'LightLineFugitive',
          \   'gitgutter': 'LightLineGitGutter',
          \   'readonly': 'LightLineReadonly',
          \   'modified': 'LightLineModified',
          \   'syntastic': 'SyntasticStatuslineFlag',
          \   'filename': 'LightLineFilename',
          \ }
    \ }

    function! LightLineModified()
      if &filetype == "help"
        return ""
      elseif &modified
        return "+"
      elseif &modifiable
        return ""
      else
        return ""
      endif
    endfunction

    function! LightLineReadonly()
      if &filetype == "help"
        return ""
      elseif &readonly
        return "RO"
      else
        return ""
      endif
    endfunction

    function! LightLineFugitive()
      return exists('*gitbranch#name') ? gitbranch#name() : ''
    endfunction

    function! LightLineGitGutter()
        if ! exists('*GitGutterGetHunkSummary')
            \ || ! get(g:, 'gitgutter_enabled', 0)
            \ || winwidth('.') <= 90
        return ''
        endif
        let symbols = [
            \ g:gitgutter_sign_added,
            \ g:gitgutter_sign_modified,
            \ g:gitgutter_sign_removed
            \ ]
        let hunks = GitGutterGetHunkSummary()
        let ret = []
        for i in [0, 1, 2]
        if hunks[i] > 0
            call add(ret, symbols[i] . hunks[i])
        endif
        endfor
        return join(ret, ' ')
    endfunction

    function! LightLineFilename()
      return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
          \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
          \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
    endfunction
    " }}}
    " Lightline: Modified jellybeans theme {{{
    let s:base03    = [ '#151513', 233 ]
    let s:base02    = [ '#30302c', 236 ]
    let s:base01    = [ '#4e4e43', 237 ]
    let s:base00    = [ '#666656', 242 ]
    let s:base0     = [ '#808070', 244 ]
    let s:base1     = [ '#949484', 246 ]
    let s:base2     = [ '#a8a897', 248 ]
    let s:base3     = [ '#e8e8d3', 253 ]
    let s:yellow    = [ '#ffb964', 215 ]
    let s:red       = [ '#cf6a4c', 167 ]
    let s:magenta   = [ '#f0a0c0', 217 ]
    let s:blue      = [ '#7697D6', 4   ]
    let s:orange    = [ '#ffb964', 215 ]
    let s:green     = [ '#99ad6a', 107 ]
    let s:white     = [ '#FCFCFC', 15  ]

    let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'terminal': {}}
    let s:p.normal.left     = [ [ s:white, s:blue ], [ s:base3, s:base02 ] ]
    let s:p.normal.right    = [ [ s:base02, s:base1 ], [ s:base3, s:base02 ] ]
    let s:p.inactive.right  = [ [ s:base02, s:base00 ], [ s:base0, s:base02 ] ]
    let s:p.inactive.left   = [ [ s:base0, s:base02 ], [ s:base00, s:base02 ] ]
    let s:p.insert.left     = [ [ s:base02, s:orange ], [ s:base3, s:base01 ] ]
    let s:p.replace.left    = [ [ s:base02, s:red ], [ s:base3, s:base01 ] ]
    let s:p.visual.left     = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
    let s:p.terminal.left   = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
    let s:p.normal.middle   = [ [ s:base0, s:base03 ] ]
    let s:p.inactive.middle = [ [ s:base00, s:base02 ] ]
    let s:p.tabline.left    = [ [ s:base3, s:base02 ] ]
    let s:p.tabline.tabsel  = [ [ s:white, s:blue ] ]
    let s:p.tabline.middle  = [ [ s:base01, s:base03 ] ]
    let s:p.tabline.right   = [ [ s:base03, s:base03 ], [ s:base03, s:base03 ] ]
    let s:p.normal.error    = [ [ s:red, s:base02 ] ]
    let s:p.normal.warning  = [ [ s:yellow, s:base01 ] ]
    " }}}

    " Bufkill: remap bclose
    nnoremap :bd<CR> :BD<cr>

    " Quicktask: default settings
    autocmd BufNewFile,BufRead *.qt setf quicktask
    let g:quicktask_snip_default_filetype = 'qt'
    let g:quicktask_snip_win_split_direction = 'vertical'

    " Vimnotes: Set notes plugin settings
    "let g:notes_directories = ['~/Documents/Notes',
    "                           '~/Dropbox/Shared Notes']
    let g:notes_directories = ['~/Dropbox/Notizen']
    let g:notes_suffix = '.txt'
    let g:notes_html_template = '~/Dropbox/Notizen/template.html'

    " Emmet: use <zen-leader>, for zencoding
    let g:user_emmet_install_global = 0
    let g:user_emmet_leader_key='<C-E>'
    autocmd FileType html,css EmmetInstall

    " Nerdtree: 
    " Open a NERDTree automatically when vim starts if no files
    " were specified
    "autocmd StdinReadPre * let s:std_in=1
    "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " Open nerdtree with CTRL+N
    map <C-n> :NERDTreeToggle<CR>
    " close vim fully if the only other open buffer is a NT
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " UtilSnips:
    " Trigger configuration. Do not use <tab> if you use github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    " CtrlP:
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

    " PHP.vim, see: https://github.com/StanAngeloff/php.vim/issues/37
    let php_var_selector_is_identifier = 0
    function! PhpSyntaxOverride()
        hi! def link phpDocTags  phpDefine
        hi! def link phpDocParam phpType
        hi! phpFunctions ctermfg=172 ctermbg=NONE cterm=NONE
        hi! phpVarSelector ctermfg=69 ctermbg=NONE cterm=NONE
        hi! phpMemberSelector ctermfg=136 ctermbg=NONE cterm=NONE
    endfunction
    augroup phpSyntaxOverride
        autocmd!
        autocmd FileType php call PhpSyntaxOverride()
    augroup END

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
    set timeoutlen=500          " time waiting for next char in command
    set ttimeoutlen=10          " time waiting for next char in command

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

    " always keep splits 50/50 when resizing window, same as CTRL+W =
    autocmd VimResized * wincmd =
    set equalalways             " always create inner splits of 50/50 size
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

    " Generates \{\{\{ as fold markers -> ugly but saves folding
    set foldmethod=marker       " Fold on the marker

    " Otherwise you'd have to use :mkview & :loadview
    "au BufWinLeave * mkview
    "au BufWinEnter * silent loadview

    set foldopen=block,hor,mark,percent,quickfix,tag " what movements
                                                      " open folds
    function! SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction "}
    set foldtext=SimpleFoldText() " Custom fold text function
                                  " (cleaner than default)
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
    " F5: Make F5 reload .vimrc
    map <silent> <F5> :source ~/.vimrc<CR>
    " F6: ROT13 - fun
    map <F6> ggVGg?
    " F7: Do a word count
    map <silent> <F7> g<C-G>
    " F8: Format paragraph
    map <silent> <F8> gwap
    " F9: Mapping for creating HTML of current buffer
    map <silent> <F9> :runtime! syntax/2html.vim<CR>
    " == END FUNCTION KEYS MAPPINGS ========================="}}}

    " == LEADER KEY MAPPINGS ================================"{{{
    " Yank Visual selection as a single line to system clipboard
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

    " vim as a hex editor :)
     map <leader>hex :%!xxd<CR>
     map <leader>nhex :%xxd -r<CR>

    " map <leader>ev to edit vimrc
    nmap <leader>ev :e ~/.vimrc<CR>

    "laravel specific mappings
    nmap <leader>lr :e app/Http/routes.php<cr>
    nmap <leader>lca :e config/app.php<cr>
    nmap <leader>lcd :e config/database.php<cr>
    nmap <leader>lc :e composer.json<cr>

    " Run PHPUnit tests
    map <Leader>t :!phpunit %<cr>

    " Edit todo list
    nmap <leader>em :e ~/Dropbox/Metanet/todo.txt<cr>

    " Open recent notes
    nmap <leader>ern :RecentNotes<cr>


    " == END LEADER KEY MAPPINGS ============================"}}}

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
    "
    " rempaping ` to '
    " 'a will jump to the line marked with ma
    " `a will jump to the line AND column so it's better
    " and ' is easier to reach, so use that
    nnoremap ' `
    nnoremap ` '

    "set window movement leading char to 's' so you dont get emacs fingers
    nnoremap s <C-W>

    "clear highlighted search result after a search
    map // :nohlsearch<CR>

    " yank to EOL when with Y
    map Y y$

    " fix common typos
    :map :W :w
    cabbrev Wq wq
    cabbrev W w
    cabbrev Q q

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
    noremap <C-m> <C-]>

    " php / laravel abbrvs
    abbrev pft PHPUnit_Framework_TestCase
    abbrev gm !php artisan generate:model
    abbrev gc !php artisan generate:controller
    abbrev gmig !php artisan generate:migration

    " keep cursor in place while joining lines
    nnoremap J mzJ`z

    " keep search terms in the middle of the buffer
    nmap n :norm! nzzzv<CR>
    nmap N :norm! Nzzzv<CR>

    " When using { and } you never want my cursor to be on an empty line,
    " but rather the first or last line of text in a paragraph.
    :nnoremap <expr> { len(getline(line('.')-1)) > 0 ? '{+' : '{-'
    :nnoremap <expr> } len(getline(line('.')+1)) > 0 ? '}-' : '}+'
"}}}
" Gui Settings =============================================="{{{
" some useful vim colorscheme generators:
"   http://www.villustrator.com/
"   http://bytefluent.com/vivify/
if has("gui_running")
    " colorscheme blackdust
    " colorscheme darktango
    " colorscheme dw_*
    colorscheme BusyBee
    " colorscheme asmdev " my color scheme (only works in GUI)
    "colorscheme kellys

    "set go-=m go-=T go-=r go-=l
    set guioptions=e   "use GUI tabs, not console style tabs
    set guifont=PT\ Mono:h13
    set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
else
    " command line vim
    set background=dark
    colorscheme jeng-256
    syntax enable
    set nocursorline
    set t_ut=
endif

" Different cursor for insert mode in iTerm2, with tmux workaround.
" https://gist.github.com/1195581
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" ==========================================================="}}}
