" Operators
syn match csOperator	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match csOperator	"<<\|>>\|&&\|||\|++\|--\|->"
syn match csOperator	"[.!~*&%<>^|=,+-]"
syn match csOperator	"/[^/*=]"me=e-1
syn match csOperator	"/$"
syn match csOperator "&&\|||"
syn match csOperator	"[][]"

" Delimiters
syn match csDelimiter	"[(){};:\\]"
syn match csDelimiter	"??"

syn keyword Keyword in where
syn keyword LINQKeyword from where select group into orderby join let in on equals by ascending descending

syn keyword csTypeModifier internal volatile static private public protected override virtual final abstract

syn match	csLabel	 display "^\s*\I\i*\s*:$" contains=csDelimiter

" Functions
syn match csUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=csType

hi def link csOperator Operator
hi def link csDelimiter Delimiter
hi def link csUserFunction Function
hi def link LINQKeyword Operator
hi def link csLabel Statement
hi def link csTypeModifier TypeModifier
