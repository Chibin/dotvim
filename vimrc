set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" Initialize plugin system
call plug#begin('~/.vim/plugged')
"Plug 'tpope/vim-fugitive'
"
"Plug 'vim-scripts/Gundo'
"Plug 'w0rp/ale'
"
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"
"Plug 'majutsushi/tagbar'
"
"Plug 'mattn/webapi-vim'
call plug#end()


syntax on
filetype plugin indent on    " required

set backspace=2
set cursorline
set expandtab
set hidden
set hlsearch
set laststatus=2
set list
"set listchars=tab:▸\ ,eol:·,trail:⊔
set mouse=a
set number
set ruler
set showcmd
set sts=4
set sw=4
set ts=4
set tags=../tags,tags;
set background=dark

colorscheme desert
""set viewdir=$HOME\.vim_view\\
""au BufWritePost,BufLeave,WinLeave ?* mkview " for tabs
""au BufWinEnter ?* silent loadview
set gfn=Lucida_Console:h14:cANSI

vmap <C-C> "+y

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
