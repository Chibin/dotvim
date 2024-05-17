set nocompatible              " be iMproved, required
filetype off                  " required

autocmd BufEnter *.erb :setlocal filetype=md

" set the runtime path to include Vundle and initialize
" Initialize plugin system
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/Gundo'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'

"Plug 'Valloric/YouCompleteMe'

Plug 'altercation/vim-colors-solarized'

"Plug 'ctrlpvim/ctrlp.vim'

"Plug 'davidhalter/jedi-vim'
"Plug 'klen/python-mode'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
"Plug 'w0rp/ale'

" if has('nvim')
"     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"     Plug 'Shougo/deoplete.nvim'
"     Plug 'roxma/nvim-yarp'
"     Plug 'roxma/vim-hug-neovim-rpc'
" endif

Plug 'morhetz/gruvbox'

Plug 'majutsushi/tagbar'

Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'lambdalisue/fern.vim'
"
Plug 'preservim/nerdtree'

Plug 'vim-airline/vim-airline'

"Plug 'mattn/webapi-vim'
"Plug 'github/copilot.vim'

Plug 'ferrine/md-img-paste.vim'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

call plug#end()

let g:rustfmt_autosave = 1

syntax on
filetype plugin indent on    " required

set backspace=2
set cursorline
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

if match(getcwd(), "/gpdb") >=0 ||  match(getcwd(), "/postgresql") >= 0
  set cinoptions=(0
  set tabstop=4
  set shiftwidth=4
endif


""set viewdir=$HOME\.vim_view\\
""au BufWritePost,BufLeave,WinLeave ?* mkview " for tabs
""au BufWinEnter ?* silent loadview
set gfn=Lucida_Console:h14:cANSI

vmap <C-C> "+y

" Persistent Undo
set undofile
set undodir=~/vim/undodir

" Use fuzzy logic
" set rtp+=/usr/local/opt/fzf

au! BufRead,BufNewFile *.tex setlocal spell spelllang=en_us

let g:ale_open_list = 0
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 0
" configure outside of vimrc
let g:ale_pattern_options_enabled = 0
" let g:ale_lint_on_save = 1
" use the .clang-tidy configuration file
let g:ale_cpp_clangtidy_checks = []
" read compile_commands.json
" let g:ale_linters = {
"             \   'cpp': ['clangtidy', 'clang-format'],
"             \   'latex': ['writegood'],
"             \}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:deoplete#enable_at_startup = 1


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

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"
" Plugin settings
"
let g:NERDTreeChDirMode=2

nmap <F8> :Tagbar<CR>
nmap <C-P> :FZF<CR>

try
    colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

set bg=dark
let g:gruvbox_contrast_light='soft'
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
set termguicolors

" required
filetype plugin indent on

let g:go_bin_path = expand("$HOME/go/bin")


" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Enable GoDefPop as part of <C-T> and
" enable <C-]> to behave like gd
let g:go_def_mapping_enabled = 1

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" coc.nvim works best on vim >= 8.1.1719 and neovim >= 0.4.0; consider upgrading your vim.
" You can add this to your vimrc to avoid this message:
let g:coc_disable_startup_warning = 1

" -------------------------------------------------------------------------------------------------
" end of coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" Don't allow <esc><esc> to exit the session
" unmap <esc><esc>


vnoremap <leader>c :OSCYank<CR>
let g:oscyank_term = 'tmux'  " or 'screen', 'kitty', 'default'
let g:oscyank_max_length = 1000000

nmap \| :NERDTreeFind<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

set runtimepath^=~/.vim/bundle/ag


if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    "nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    "nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

let g:lsp_diagnostics_enabled = 0         " disable diagnostics support

autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'

let g:instant_markdown_theme = 'dark'
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'

"let g:instant_markdown_debug = 0
"let g:instant_markdown_theme = 'dark'
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_open_to_the_world = 1
"" This is a workaround so that instant-markdown doesn't open a browser
"" automatically for us which then crashes the instant-markdown program...
"let g:instant_markdown_browser = 'echo'
"let g:instant_markdown_port = 8888
