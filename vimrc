"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
call pathogen#incubate()
call pathogen#helptags()
"execute pathogen#infect()
syntax on
filetype plugin indent on

set laststatus=2
set number
set hlsearch
set mouse=a
set cursorline
set ruler
set showcmd
set list
set listchars=tab:▸\ ,eol:·,trail:⊔
set ts=4
set sts=4
set sw=4

" Persistent Undo
set undofile
set undodir=~/vim/undodir

"set exceptions
autocmd BufRead,BufNewFile *.note,todolist set nolist

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
        let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
        if l:tabstop > 0
                let &l:sts = l:tabstop
                let &l:ts = l:tabstop
                let &l:sw = l:tabstop
        endif
        call SummarizeTabs()
endfunction

function! SummarizeTabs()
        try
                echohl ModeMsg
                echon 'tabstop='.&l:ts
                echon ' shiftwidth='.&l:sw
                echon ' softtabstop='.&l:sts
                if &l:et
                        echon ' expandtab'
                else
                        echon ' noexpandtab'
                endif
        finally
                echohl None
        endtry
endfunction

function! Preserve(command)
        " Prepartion: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " Do the business:
        execute a:command
        " Clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
endfunction
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

vmap <C-X> "+y
nmap <leader>b a• 
imap <C-B> • 

"Opening urls from vim
function! Browser ()
	let line0 = getline (".")
	let line = matchstr (line0, "http[^ ]*")
	:if line==""
	let line = matchstr (line0, "ftp[^ ]*")
	:endif
	:if line==""
	let line = matchstr (line0, "file[^ ]*")
	:endif
	" echo line
	exec ":silent !open -a /Applications/Firefox.app ".line
	redraw!
endfunction
map \w :call Browser ()<CR>

"My own customization functions
function! Date()
	exec ':read !date "+\%m/\%d \%l:\%M \%p"'
endfunction
map \date :call Date ()<CR>


function! JIRA()
	let line0 = getline (".")
	let line = matchstr(line0,"[^:, ]*-[0-9]*")
	let jira = "http://jira.greenplum.com/browse/"
	exec ":silent !open -a /Applications/Firefox.app ".jira.line
	redraw!
endfunction
map \j :call JIRA()<CR>

function! TODO ()
	:normal qaq
	:g/TODO/y A
	:split todo.note
	:normal P
	execute "normal \<c-w>J"
endfunction
map \TODO :call TODO ()<CR>

function! Todo ()
	:vimgrep /TODO/ %
	:copen
endfunction
map \todo :call Todo ()<CR>
au BufNewFile,BufRead *.py,*.sh,*.css,*.js,*.html set expandtab
au BufNewFile,BufRead *.note set filetype=test


" Allow netrw to remove non-empty local directories
"
let g:netrw_localrmdir='rm -r'

if &diff
	colorscheme blue
endif
