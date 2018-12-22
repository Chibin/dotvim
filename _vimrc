set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'

Plug 'vim-scripts/Gundo'
Plug 'w0rp/ale'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'powershell -executionpolicy bypass -File install.ps1',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'majutsushi/tagbar'

Plug 'rust-lang/rust.vim' "{{{2
Plug 'mattn/webapi-vim'
let g:rustfmt_autosave = 1

" Initialize plugin system
call plug#end()
filetype plugin indent on    " required

set number
set ts=4
set sts=4
set sw=4
set expandtab
set backspace=2
set ruler
set hidden
set hlsearch

syntax on

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

let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_autoStart = 1
call deoplete#custom#source('LanguageClient', 'min_pattern_length', 2)
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['D:/Tools/cquery/cquery', '--log-file=D:/tmp/cq.log'],
    \ }
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = 'D:/nvim/settings.json'

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
set completefunc=LanguageClient#complete

nmap <F8> :Tagbar<CR>
