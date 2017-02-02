"  .vimrc

" Preamble ----------------------------------------------------------------- {{{

let name = "Eculide"          " Set my name in to the name variable
set nocompatible              " be iMproved, required
filetype plugin indent on     " required for vundle plugins
colorscheme ir_black
syntax on
set encoding=utf-8
let $LANG='sv_SE'

" }}}
" Basic options ------------------------------------------------------------ {{{

syntax enable
set number                             " Line numbering
set ruler                              " Cursor position
set hidden
set wildmenu                           " Better command completion
set wildignore=*.o,*~,*.pyc,*.DS_Store,*.pdf,*.doc*,*.cdx*,*.ppt*,*.xls*,*.tif*,*.iso,*.plist
set showcmd                            " Show partial commands
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set autoread
set nostartofline
set laststatus=2
set confirm
set notimeout ttimeout ttimeoutlen=200
" set paste
set shiftwidth=4
set softtabstop=4
set expandtab
set clipboard=unnamed                  " Make vim work with system clipboard
set foldmethod=marker
set linebreak
set cursorline                         " Underscore cursorline
set spelllang=en_us,sv
set path+=**                           " Search down subfolders + tab-completion
" set rtp+=~/.fzf                        " Use of fzf in vim
" setf language
" Highlight misspelled words in red
hi SpellBad ctermfg=9 ctermbg=NONE

hi CursorLine   ctermbg=236
" hi CursorColumn cterm=NONE ctermbg=236
hi Comment cterm=italic
hi Search cterm=NONE ctermfg=22 ctermbg=14
"
" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=18
" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=236

" show non-breaking space characters (activated by "set list"; unactivated by " "set nolist"
set listchars+=nbsp:=

" set .md and .txt extensions to markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.txt set filetype=markdown
" autocmd BufNewFile,BufReadPost . set filetype=txt

" use ':Marked' to open Marked2
command! Marked silent !open -a "Marked2.app" "%:p"

let mapleader = ","
let maplocalleader = ";"
" remap jj to escape
inoremap jj <esc>
nnoremap j gj
nnoremap k gk
" remap shift-space to za to expand folded section doesn't work by
" itself. Can instead be fixed in iTerm2's 'keys' configurator
" remap ää to expand folded sections
nnoremap ää za

" remap space to cancel highlighted text
nnoremap <space> :nohl<Cr>
" remap ,z to go to next misspelled word and add it to dictionary
nnoremap <leader>z ]szg

" nnoremap <C-w><C-w> <tab>

" set guifont=InconsolataPowerline
let g:airline_powerline_fonts = 1
let g:calendar_google_calendar = 1
" let g:calendar_time_zone = '+0200'
" let g:calendar_locale='sv'
let g:calendar_first_day = 'monday'

let g:table_mode_separator = '|'
" let g:table_mode_corner = '+'
" let g:table_mode_corner_corner = '+'
" let g:table_mode_header_fillchar = '='
let g:table_mode_map_prefix = '<localleader>t'
nnoremap <localleader>tr :TableModeRealign<CR>

" MRU file exclusion (mutt-files)
let MRU_Exclude_Files='.*\/\.mutt\/temp\/mutt-.*'
nnoremap <leader>m :MRU<Cr>

" vimwiki
let g:vimwiki_hl_headers = 1
let g:vimwiki_list_ignore_newline = 0
let g:vimwiki_list = [ 
    \ {'path': '/Volumes/DATA/Users/euclide/vimwiki'},
    \ {'path': '/Volumes/DATA/Users/euclide/Dropbox/vimwiki'}]

" w3m
let g:w3m#homepage = 'https://duckduckgo.com/'
let g:w3m#search_engine = 'https://duckduckgo.com/?q=%s'
let g:w3m#external_browser = 'firefox'
let g:w3m#lang = 'en_US'

" trying to use vim-pandoc folding (doesn't work)
" let g:pandoc#folding#fold_yaml = 1
let g:pandoc#modules#disabled = ["folding"]
" let g:pandoc#folding#mode = 'syntax'
" let g:pandoc#syntax#codeblocks#embeds#langs = ['r', 'json', 'sh']
" let g:pandoc_extensions_table = {
"             \"extra": ["text", "txt"],
"             \"html": ["html", "htm"],
"             \"json" : ["json"],
"             \"latex": ["latex", "tex", "ltx"],
"             \"markdown" : ["markdown", "mkd", "md"],
"             \"pandoc": ["pandoc", "pdk", "pd", "pdc"],
"             \"rmarkdown" : ["Rmd", "rmd"],
"             \"native" : ["hs"],
"             \"rst" : ["rst"],
"             \"textile": ["textile"] }
" let g:pandoc#filetypes#handled = [
"             \"pandoc",
"             \"rst",
"             \"rmarkdown",
"             \"textile"]

" UltiSnips - use tab and shift-tab to move between tabstops
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Fix the bug in the LogiPat plugin: http://tinyurl.com/jgwez8a
let g:loaded_logipat = 1

" ---- R tmux integration Nvim-R plugin ---
let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
let R_objbr_w = 135

" ----

" Remap Alt-k to move the line up one notch
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <leader>j <Esc>:m .+1<CR>==gi
inoremap <leader>k <Esc>:m .-2<CR>==gi
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

nnoremap <leader>h :TCommentAs html<cr>
vnoremap <leader>h :TCommentAs html<cr>
vnoremap <leader>H <Del>i<!-- <esc>pa --><esc>

nnoremap <leader>r :! open -a /Applications/RStudio.app %<cr><cr>

command! Todo :e /Volumes/DATA/Users/euclide/Dropbox/Documents/txt-files/todo.txt
highlight default link TodoPriorityA Todo
highlight default link TodoPriorityB Type
highlight default link TodoPriorityC String
highlight default link TodoPriorityD Keyword
highlight default link TodoPriorityE Constant
highlight default link TodoPriorityS Number
highlight default link TodoPriorityW Function
highlight default link TodoProject   LineNr

command! Daily :e /Volumes/DATA/Users/euclide/Dropbox/Documents/Markdown/DailyPhrases.md
command! Train :e /Volumes/DATA/Users/euclide/Dropbox/Documents/PROJECTS/RMisc/TrainData.txt
command! Ideas :e /Volumes/DATA/Users/euclide/Dropbox/DOCUMENTS/RESEARCH/Project_ideas.Rmd

command! Moore :! open '/Volumes/DATA/Users/euclide/Dropbox/CLOUD/Mendeley/Venkataraman et al._1997_Journal of Chemical Education.pdf'

" Show highlighting groups for current word
nnoremap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" }}}
" Plugins------------------------------------------------------------------- {{{

filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'             " let Vundle manage Vundle, required

" Keep Plugin commands between vundle#begin/end.
" The following are examples of different formats supported.

" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
" Plugin 'vim-pandoc/vim-pandoc-after'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'jeetsukumaran/vim-filebeagle'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
" Plugin 'Vim-R-plugin'
Plugin 'jalvesaq/Nvim-R'
Plugin 'chrisbra/csv.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'beloglazov/vim-online-thesaurus'
Plugin 'junegunn/goyo.vim'
Plugin 'adaszko/chbuf.vim'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'vifm/vifm.vim'
Plugin 'itchyny/calendar.vim'
Plugin 'vim-scripts/VOoM'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'athom/HexHighlight'
Plugin 'BufOnly.vim'
Plugin 'dbeniamine/todo.txt-vim'
Plugin 'vim-scripts/mru.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'yuratomo/w3m.vim'
Plugin 'wting/rust.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" Plugin 'junegunn/vim-emoji'
" Plugin 'rking/ag.vim'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'scrooloose/nerdtree'
" Plugin 'joequery/Stupid-EasyMotion'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-shell'
" Plugin 'xolox/vim-notes'
" Plugin 'Shougo/unite.vim'
" Plugin 'Shougo/vimfiler.vim'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'tpope/vim-markdown'
" Plugin 'gabrielelana/vim-markdown'
" Plugin 'vim-scripts/bib_autocomp.vim'    " only for .bib-files

" All of your Plugins must be added before the following line
call vundle#end()                      " required
filetype plugin indent on              " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after the next line

" }}}
" -----------------------------------------------------------------------------
