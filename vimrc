set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" Initialize plugin system
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/Gundo'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'

Plug 'Valloric/YouCompleteMe'

Plug 'altercation/vim-colors-solarized'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'davidhalter/jedi-vim'
Plug 'klen/python-mode'

Plug 'w0rp/ale'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'morhetz/gruvbox'

Plug 'majutsushi/tagbar'

Plug 'rust-lang/rust.vim'
Plug 'mattn/webapi-vim'
call plug#end()

let g:deoplete#enable_at_startup = 1

let g:rustfmt_autosave = 1

syntax on
filetype plugin indent on    " required

set backspace=2
set cursorline
set expandtab
set hidden
set hlsearch
set laststatus=2
set list
set listchars=tab:▸\ ,eol:·,trail:⊔
set mouse=a
set number
set ruler
set showcmd
set sts=4
set sw=4
set ts=4
set tags=../tags,tags;
set background=dark

""set viewdir=$HOME\.vim_view\\
""au BufWritePost,BufLeave,WinLeave ?* mkview " for tabs
""au BufWinEnter ?* silent loadview
set gfn=Lucida_Console:h14:cANSI

vmap <C-C> "+y

" Persistent Undo
set undofile
set undodir=~/vim/undodir

" Use fuzzy logic
set rtp+=/usr/local/opt/fzf

au! BufRead,BufNewFile *.tex setlocal spell spelllang=en_us

let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 0
" configure outside of vimrc
let g:ale_pattern_options_enabled = 1
let g:ale_lint_on_save = 1
" use the .clang-tidy configuration file
let g:ale_cpp_clangtidy_checks = []
" read compile_commands.jsonn
let g:ale_linters = {
            \   'cpp': ['clangtidy', 'clang-format'],
            \   'latex': ['writegood'],
            \}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:deoplete#enable_at_startup = 1

nmap <F8> :Tagbar<CR>

"
" Folding functions
"
function! GoToOpenFold(direction)
    let start = line('.')
    if (a:direction == "next")
        while (foldclosed(start) != -1)
            let start = start + 1
        endwhile
    else
        while (foldclosed(start) != -1)
            let start = start - 1
        endwhile
    endif
    call cursor(start, 0)
endfunction
nmap ]z :cal GoToOpenFold("next")
nmap [z :cal GoToOpenFold("prev")

" set ]z and [z go to find open folds
function! GoToOpenFold(direction)
    if (a:direction == "next")
        normal zj
        let start = line('.')
        while foldclosed(start)
            != -1
            let start = start +
            1
        endwhile
    else
        normal zk
        let
        start
        =
        line('.')
        while
            foldclosed(start)
            !=
            -1
            let
            start
            =
            start
            -
            1
        endwhile
    endif
    call
    cursor(start,
    0)
endfunction

"
" Allow netrw to remove non-empty local directories
"
let g:netrw_localrmdir='rm -r'
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0

"
" Plugin settings
"
let g:NERDTreeChDirMode=2

nmap <C-P> :FZF<CR>

colorscheme gruvbox
set bg=dark
set termguicolors
