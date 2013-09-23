cd ~\Projects
execute pathogen#infect('~\Projects\vim\{}')

set nocompatible
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
behave mswin

syntax on            " turn syntax highlighting on
colorscheme koehler  " whee colors

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
set wildignore+=*\\target\\*,**\.git\\*,*.class

" backspace in Visual mode deletes selection
vnoremap <BS> d

" Set up copy/paste:
"   Cut:   Shift-Del
"   Copy:  Ctrl-Del
"   Paste: Shift-Insert
vnoremap <S-Del>    "+x
vnoremap <C-Del>    "+y
map <S-Insert>      "+gP
cmap <S-Insert>     <C-R>+
imap <S-Insert>     <C-V>
vmap <S-Insert>     <C-V>

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" Movement while centering cursor
map <C-j> jzz
map <C-k> kzz

" Make tabs easy to navigate from center keys
map <C-t> :tabnew<Enter>
map tt :tabnext<Enter>
map TT :tabprev<Enter>

" Buffer explorer
let g:bufExplorerDefaultHelp=0 " Do not show default help.
" change mapping to open
map <C-b> :BufExplorer<Enter>

" toggle things
map \n :set relativenumber!<Enter>
map \p :set paste!<Enter>
map \w :set wrap!<Enter>

if has("autocmd")
    filetype plugin indent on
    augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    augroup END

    " add scala support
    au filetypedetect BufNewFile,BufRead *.scala setf scala
else
    set autoindent
endif
