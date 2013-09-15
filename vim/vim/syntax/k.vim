" future plans: intermingling languages (q/k)
" detecting local variables/default names
" make color scheme for other languages as well - C/Haskell
" query parsing (so wheres are different)
" .q.names
" dyad/function different colors for K as well
" different color for atom vs vector?
" unbalanced parenthese? k) q) and .. throws that off
" separate kIntegral(+temp) kFloat(datetime)
" x-12 is does not show up as verb, x- 12 works
" {} italic just like function parameters...
" -_ handling is still far from perfect
sy clear
sy case match
setlocal comments=:/,://
set iskeyword=^_,48-57,.,@,^:

sy match kAdverb /\v[/\\']:?/  "note that order matters here because of adverbs, TODO - rewrite so that order does not matter
hi link kAdverb Adverb

sy region kComment start=/\v(^|\s)\// end="$" keepend excludenl contains=kTodo	"/ eol 
sy region kComment start=/\v^\\\\*\s*$/ end="\%$" contains=kTodo  "^\ until eof
sy region kComment start=/^\/\s*$/ end=/^\\\s*$/ keepend excludenl contains=kTodo  "/ \ block
sy keyword kTodo TODO FIXME FIX XXX NOTE GOTCHA contained
hi link kComment Comment
hi link kTodo Todo

sy region kString start=/"/ skip=/\\\\\|\\"/ end=/\"\|\.\.\s*$/ keepend excludenl contains=kStringSpecial
sy match kStringSpecial	/\v(\"|\\[abcfnrtv\\])/ contained
hi link kString String

sy match kOperator /[~!@#$%^&*\-_=+|:,<.>?]/  "special-case -? 
hi link kOperator Operator
sy keyword kOperator bin div in insert like setenv ss wavg within wsum xexp
"to take care of k monads
"sy match kFunction /[~!@#$%^&*\-_=+|:,<.>?]:/ "special-case -?
"sy match kFunction /[^a-zA-z0-9\]\)\}][~!@#$%^&*\-_=+|:,<.>?]/ms=e-1 "special-case -?
sy keyword kFunction acos asin atan avg cos exit exp getenv last log max min prd sin sqrt sum tan 
hi link kFunction Function

sy keyword Conditional if
sy match Conditional /$\[/me=e-1 "note order matters for this because $ is a verb
sy keyword Repeat	while do

sy match kInt /\v\-?\d+[hij]?/ contains=kSign,kGroup3Digits,kIntType
sy match kSign /-/ contained
sy match kGroup3Digits /\v\d{1,3}\ze\d\d\d(>|\D)/  contained
sy match kIntSpecial /\v(0[nNwW]|-0[wW])[hij]?/  contains=kIntType
sy match kIntType /[hij]/ contained
hi link kInt Number
hi link kSign SpecialChar
hi link kIntSpecial SpecialChar
hi link kIntType SpecialChar
"hi link kGroup3Digits SpecialChar

sy match kFloat /\v\-?\d+\.?\d*(e[+-]?\d+)?[ef]/ contains=kSign,kFloatSpecial,kGroup3Digits,kFloatType "has [ef] at end
sy match kFloat /\v\-?(\d+\.|\.\d+|\d+\.\d+)([e[+-]?\d+)?[ef]?/ contains=kSign,kFloatSpecial,kGroup3Digits,kFloatType "has a .
sy match kFloat /\v\-?\d+\.?\d*e[+-]?\d+[ef]?/ contains=kSign,kFloatSpecial,kGroup3Digits,kFloatType "has e+-
sy match kFloatSpecial /[.e+]/ contained
sy match kFloatType /[ef]/ contained
sy match kFloatSpecial /\v(0N|0n|0w|0W|-0W|-0w)[ef]/
hi link kFloat Number
hi link kFloatType SpecialChar
hi link kFloatSpecial SpecialChar


sy match kDate /\v\d{1,4}\.[01]\d\.[0123]\d/ 
sy match kDateSpecial /\v(0N|0n|0w|0W|-0W|-0w)d/ 
hi link kDate Number
hi link kDateSpecial SpecialChar

sy match kMonth /\v(\d{1,4}\.[01]\dm)/ contains=kMonthType
sy match kMonthSpecial /\v(0N|0n|0w|0W|-0W|-0w)m/ 
sy match kMonthType /m/ contained
hi link kMonth Number
hi link kMonthSpecial SpecialChar
hi link kMonthType SpecialChar

sy match kTime /\v\d+[tuv]/ contains=kTimeType
sy match kTime /\v\d\d:[012345]\d[tuv]?/ contains=kTimeType
sy match kTime /\v\d\d:[012345]\d:[012345]\d[tv]?/ contains=kTimeType
sy match kTime /\v\d\d:[012345]\d:[012345]\d\.\d*[t]?/ contains=kTimeType,kGroup3Digits
sy match kTime /\v\-?\d+D\d*/ contains=kTimeSpecialD
sy match kTime /\v\-?\d+D\d\d:[012345]\d:[012345]\d\.\d*/ contains=kGroup3Digits,kTimeSpecialD
sy match kTimeType /[tuv]/ contained
sy match kTimeSpecialD /[D]/ contained
sy match kTimeSpecial /\v(0N|0n|0w|0W|-0W|-0w)[tuvn]/ 
hi link kTime Number
hi link kTimeType SpecialChar
hi link kTimeSpecial SpecialChar
hi link kTimeSpecialD SpecialChar

sy match kDateTime /\v\d{1,4}\.[01]\d\.[0123]\d[DT]/ contains=kDateTimeSpecial
sy match kDateTimeSpecial /[DT]/ contained
sy match kDateTimeSpecial /\v(0N|0n|0w|0W|-0W|-0w)[zp]/
hi link kDateTime Number
hi link kDateTimeSpecial SpecialChar

"note that these have to come after Int
sy match kBoolean /\<[01]\+b/ contains=kBooleanPostfix
sy match kBooleanPostfix /\<[01]\+\zsb/ contained
hi link kBoolean Number
hi link kBooleanPostfix SpecialChar

sy match kByte "\<0x\x*" contains=kBytePrefix
sy match kBytePrefix "\<0x"	contained
hi link kByte Number
hi link kBytePrefix SpecialChar

sy match kAssign /\v<\.?\a(\a|\d|\.)*\ze(\[\.*\])?\s*[+\-*%=@&|^~,.#_!$<>]?:/

sy match kNullSymbol /`/
sy match kSymbol		/\v(`[a-zA-Z0-9.:]+)/ contains=Type,kNullSymbol
sy match kHandle		/\v(`:[a-zA-Z0-9.:/]*>)/ contains=kNullSymbol 
sy match Type /\v(`(boolean|byte|short|int|long|real|float|char|symbol|month|date|datetime|time|minute|second|timespan|timestamp|year|mm|uu|dd|week|hh|ss))+\$/me=e-1 contained 
sy match kAttributes /`[spgu]#/me=e-1
"sy match kFunction /\.\a/ "reserved contexts
"sy match kFunction /\.\a\.\a[a-zA-Z0-9]*/ "reserved full names

sy match kDotQ /\.Q\.\a[a-zA-Z0-9]*/ ".Q.*
"sy match kBang	/-\(\d\|1[0-5]\)!/ "-x!
"sy match kVerb	"\<[012]:"
"sy match kLambda "{}" contained

sy keyword Statement	exec select by from update where delete
"sy match kStatement /\(exec\|select\|insert\|update\|delete\).*(by.*)\?from.*(where.*)\?\&exec\|select\|insert\|update\|delete\|\by\|from\|where/ 

sy match kSystem		"^\s*\\\a" contains=kOperator,kComment,kSpecialComment

sy sync minlines=1000
let b:current_sytax="k"
color avrabecz
