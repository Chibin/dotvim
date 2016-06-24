if exists("b:current_syntax")
	finish
endif

syntax keyword potionFunction print join •
syntax match scalaNiceKeyword '\(_\|\<\)\zsalpha\ze\(\>\|_\)' conceal cchar=α
syntax match newmatch "_test_"
syntax match MPP '\(_\|\<\)\zsMPP-.\d\+\ze\(\>\|_\)'
syntax match LABOPS '\(_\|\<\)\zsLABOPS-.\d\+\ze\(\>\|_\)'

syntax match specialKeyword "TODO:"
syntax match greenKeyword "DONE:"
syntax match yellowKeyword "NOTE:"
syntax match yellowKeyword "Note:"
syntax match lightblueKeyword "Update "
syntax match redKeyword "Current: "

highlight link scalaNiceKeyword Keyword
highlight link potionFunction Function
highlight specialKeyword ctermfg=darkred
"ctermbg=yellow
highlight blueKeyword ctermfg=darkblue
highlight greenKeyword ctermfg=green
highlight yellowKeyword ctermfg=yellow
highlight lightblueKeyword ctermfg=lightblue
highlight lightredKeyword ctermfg=lightred
highlight redKeyword ctermfg=red
highlight link potionKeyword blueKeyword
highlight link newmatch yellowKeyword
highlight link MPP yellowKeyword
highlight link LABOPS yellowKeyword
hi! link Conceal Keyword
setlocal conceallevel=2

"set some abbreviations
iab \b •
iab ===  ====================================================================================================
iab ___  ____________________________________________________________________________________________________
iab ***  ****************************************************************************************************
"Functions
function! Update ()
	normal oUpdate:
endfunction
"Mappings
map \update :call Update ()<CR>xa [<ESC>:call Date ()<CR> <UP>Jw<LEFT>x$a]<ESC>
let b:current_syntax = "test"
