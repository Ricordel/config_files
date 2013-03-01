" Operators
syn match javaOperator	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match javaOperator	"<<\|>>\|&&\|||\|++\|--\|->"
syn match javaOperator	"[.!~*&%<>^|=,+-]"
syn match javaOperator	"/[^/*=]"me=e-1
syn match javaOperator	"/$"
syn match javaOperator "&&\|||"
syn match javaOperator	"[][]"

" Functions
"syn match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cType
syn match javaUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=javaType

" Delimiters
syn match javaDelimiter	"[(){};\\]"

hi def link javaUserFunction Function
hi def link javaDelimiter Delimiter
hi def link javaOperator Special
