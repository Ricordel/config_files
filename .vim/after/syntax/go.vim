" A personal try to highlight functions in Go.
" Might need improvements as I'm not completely aware of all
" syntactic stuff that can happen in Go

syn match goOperator	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match goOperator	"<<\|>>\|&&\|||\|++\|--\|->"
syn match goOperator	"[.!~*&%<>^|=,+-]"
syn match goOperator	"/[^/*=]"me=e-1
syn match goOperator	"/$"
syn match goOperator    "&&\|||"
syn match goOperator	"[][]"

" Delimiters
syn match goDelimiter	"[(){};\\]"

" Functions
syn match goUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=goType,goDeclaration


hi def link goUserFunction Function
hi def link goOperator Special
hi def link goDelimiter Special
