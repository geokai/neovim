set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Initial_Setup_Instructions:----------------------------------------------{{{1
" Install vim-plug:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" then use :PlugInstall

" Plugin_support:
" pip install neovim flake8 mypy yapf pylint
" powerline fonts: https://github.com/powerline/fonts

" Themes:
" Create a colors directory ~/.config/nvim/colors
" Create a colors directory and then curl them with -o option to write a file

" Vimplug:-----------------------------------------------------------------{{{1

call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'  " multifunction status bar
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'Chiel92/vim-autoformat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sbdchd/vim-run'  " Run current file in a terminal split
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'  " Pairs of handy bracket mappings
Plug 'tpope/vim-fugitive'  " Git functionality from within vim/neovim
Plug 'tpope/vim-surround'  " Plugin for using 'surroundings'
Plug 'tpope/vim-repeat'  "  Provides repeat functionality to other plugins
Plug 'easymotion/vim-easymotion'  " Easier/Powerful vim motions
Plug 'scrooloose/nerdtree'  " Nerdtree file explorer
Plug 'Xuyuanp/nerdtree-git-plugin'  " Adds git status flags to Nerdtree
Plug 'jistr/vim-nerdtree-tabs'  " Nerdtree independent of tabs
Plug 'christoomey/vim-sort-motion'  " Sorting: linewise, character, block etc
" Plug 'vim-syntastic/syntastic'
" Plug 'zchee/deoplete-jedi'
call plug#end()

" Basic Settngs:-----------------------------------------------------------{{{1

syntax enable
set shortmess+=Iw
set number

set list
set showbreak=↳\ 
set listchars=tab:›\ ,trail:–,extends:»,precedes:«,eol:¬
" set visualbell
set cursorline
set title
set scrolloff=5
set noshowmode

" Tabs, spaces and wrapping
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set textwidth=79
set colorcolumn=+1

" Splits - feels more natural
set splitbelow
set splitright

" Themes:------------------------------------------------------------------{{{1
" place in the colors directory ~/.config/nvim/colors using curl -o
" colorscheme badwolf "https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim

set background=dark
colorscheme molokai "https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
highlight cursorline ctermbg=234 ctermfg=none
highlight colorcolumn ctermbg=darkred
highlight! link TermCursor Cursor
highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
highlight nontext ctermfg=darkgrey ctermbg=none " guifg=4a4a59

" Finding And Autocomplete:------------------------------------------------{{{1

set path+=**
set wildmenu
set ignorecase
set smartcase
set showmatch

" SuperTab:----------------------------------------------------------------{{{1

let g:SuperTabDefaultCompletionType = "<c-n>" "set order of options to down

" EasyMotion:--------------------------------------------------------------{{{1

" Remap EasyMotion leader key:
map <leader> <Plug>(easymotion-prefix)

" Character-wise motion
nmap <leader>s <Plug>(easymotion-overwin-f)

" Disable default mappings:
let g:EasyMotion_do_mapping = 0

" line-wise motion:
let g:EasyMotion_startofline = 0

map <leader>j <Plug>(easymotion-j)
map <leader>J <Plug>(easymotion-sol-j)
" nmap <leader>j <Plug>(easymotion-overwin-line)
map <leader>k <Plug>(easymotion-k)
map <leader>K <Plug>(easymotion-sol-k)
" nmap <leader>k <Plug>(easymotion-overwin-line)

" Turn on case insensitive feature:
let g:EasyMotion_smartcase = 1

" Mappings:

" -bd- for bidirectional motion with word-wise
map <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-bd-w)
map <leader>W <Plug>(easymotion-bd-W)

" end-of-word motion
map <leader>e <Plug>(easymotion-bd-e)
map <leader>E <Plug>(easymotion-bd-E)

" Deoplete:----------------------------------------------------------------{{{1

" let g:deoplete#enable_at_startup = 1

" UltiSnips:---------------------------------------------------------------{{{1

let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Ale:---------------------------------------------------------------------{{{1

let g:ale_linters = {'python': ['flake8']}
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1

" VimRun:------------------------------------------------------------------{{{1

" Automatically close the terminal split on completion
let g:run_auto_close = 1

" Open terminal split below
let g:run_split = 'down'

" AIRLINE:-----------------------------------------------------------------{{{1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#ale#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" NERDTree-----------------------------------------------------------------{{{1

nnoremap <leader>ed <ESC>:NERDTreeTabsToggle<CR>

" CtrlP:-------------------------------------------------------------------{{{1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" Virtualenv:--------------------------------------------------------------{{{1

" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

" Remappings:--------------------------------------------------------------{{{1

" remap the Leader key:
let mapleader = ","
let maplocalleader = "\\"

" disable the arrow keys:
" : in NORMAL mode
noremap <up> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
noremap <down> <Nop>

" : in INSERT mode
inoremap <up> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <down> <Nop>

" : in VISUAL mode
vnoremap <up> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <down> <Nop>

" quick pairs in INSERT mode
inoremap <leader>' ''<ESC>i
inoremap <leader>" ""<ESC>i
inoremap <leader>* **<ESC>i
inoremap <leader>( ()<ESC>i
inoremap <leader>[ []<ESC>i
inoremap <leader>t[ [  ]<ESC>hi
inoremap <leader>{ {}<ESC>i
inoremap <leader>< <><ESC>i
" surround a word with ... pairs - Use 'vim-surround'
" nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
" nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
" nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
" nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
" nnoremap <leader>__ viw<esc>a__<esc>hbi__<esc>lel

" exit pair(s) to end of line:
inoremap <c-l> <ESC>A
" exit nested pair to within parent pair:
inoremap <c-k> <ESC>la

" insert blank row - Use 'vim-unimpaired'
" nnoremap <leader>r o<ESC>
" nnoremap <leader>R O<ESC>

" navigating between vim tabs
nnoremap <leader>n <ESC>:tabn<CR>
nnoremap <leader>p <ESC>:tabp<CR>

" use relative numbering - Use 'vim-unimpaired' [or & ]or, to toggle: =or
" nnoremap <silent> <leader>u <ESC>:set relativenumber!<CR><ESC>
" inoremap <silent> <leader>u <ESC>:set relativenumber!<CR><ESC>i

" open vimrc in a split for a quick edit
nnoremap <leader>ev :tabe $MYVIMRC<cr>
" source the vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>
"
" -all-caps & continue in INSERT mode
inoremap <c-u> <esc>viwUea
" -all-caps & continue in NORMAL mode
nnoremap <c-u> viwUea<ESC>
"
" - search & highlighting
nnoremap <silent> <leader>nh :nohl<cr>

" navigate between splits
" - option + h, j, k, l come out as symbols on mac
nnoremap ˙ <C-w>h
nnoremap ∆ <C-w>j
nnoremap ˚ <C-w>k
nnoremap ¬ <C-w>l

tnoremap ˙ <C-\><C-n><C-w>h
tnoremap ∆ <C-\><C-n><C-w>j
tnoremap ˚ <C-\><C-n><C-w>k
tnoremap ¬ <C-\><C-n><C-w>l

" vim-autoformat
nnoremap <F3> :Autoformat<CR>

" vim-run
nnoremap <F5> :Run<CR>

" Terminal:----------------------------------------------------------------{{{1
tnoremap <C-v><Esc> <C-\><C-n>

function! OpenTerm()
    vsp | te
    set nonumber
    startinsert
endfunction

nnoremap <leader>te :call OpenTerm()<cr>

" Folding:-----------------------------------------------------------------{{{1

highlight Foldcolumn ctermfg=Darkgrey ctermbg=0 cterm=BOLD
highlight Folded ctermfg=Darkgrey ctermbg=NONE cterm=none
set foldcolumn=4
set foldmethod=marker
set foldlevelstart=0

function! MyFoldText()  "  {{{2
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  let onetab = strpart('           ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction  "  2}}}

set foldtext=MyFoldText()

" 1}}}
" end of init.vim config file:
