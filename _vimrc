execute pathogen#infect('~\Projects\vim-config\plugins\{}')
cd ~\Projects

let g:go_fmt_autosave = 0

set nocompatible
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
behave mswin

syntax on              " turn syntax highlighting on
colorscheme desert     " whee colors
set gfn=consolas:h10.5 " set more readable font

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set incsearch      " do incremental searching
set hlsearch       " hilight search results
set relativenumber " relative line numbering
set ic             " case insensitive search
set autoindent     " automatically indent to the same line
set expandtab      " insert spaces instead of tabs
set ts=2           " tab stop = 2
set shiftwidth=2   " shift right/left by 2
set laststatus=2   " always show a status line
" define the status line
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" configure things to get ignored while loading files
" let g:ctrlp_custom_ignore = '\v.*\.class|.*\\.git\\.*'
let g:ctrlp_working_path_mode = 'rc'
set wildignore+=*\\target\\*,**\.git\\*,*.class

" backspace in Visual mode deletes selection
vnoremap <BS> d

" Set up copy/paste:
"   Cut:   Shift-Del
"   Copy:  Ctrl-Del
"   Paste: Shift-Insert
vnoremap <S-Del>     "+x
vnoremap <C-Del>     "+y
noremap  <S-Insert>  "+gP
cnoremap <S-Insert>  <C-R>+
inoremap <S-Insert>  <C-V>
vnoremap <S-Insert>  <C-V>

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" Movement while centering cursor
noremap <C-j> jzz
noremap <C-k> kzz

" Make tabs easy to navigate from center keys
noremap <C-t> :tabnew<Enter>
noremap tt :tabnext<Enter>
noremap TT :tabprev<Enter>

" Reclaim our :pop binding since <C-t> was used
" nnoremap <C-[> <esc>:pop<cr>

" Buffer explorer
let g:bufExplorerDefaultHelp=0 " Do not show default help.
" change mapping to open
noremap <C-b> :BufExplorer<Enter>

" toggle things
noremap \n :set relativenumber!<Enter>
noremap \p :set paste!<Enter>
noremap \w :set wrap!<Enter>

if has("autocmd")
    filetype plugin indent on
    augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    augroup END

    au filetypedetect BufNewFile,BufRead *.scala setf scala     " scala!
    au filetypedetect BufNewFile,BufRead *.json setf javascript " json as javascript
    au filetypedetect BufNewFile,BufRead *.sbs setf python      " stupid build system files parse as python
    au filetypedetect BufNewFile,BufRead *.md setf markdown     " md are markdown
    au filetypedetect BufNewFile,BufRead *.service setf sh      " unit files as shell
    au filetypedetect BufNewFile,BufRead *.genny setf go        " genny templates as go
else
    set autoindent
endif
