"a_:1 is a_ :1
syn clear
if !exists("main_syntax") 
  let main_syntax='q'
endif

source <sfile>:p:h/k.vim
set iskeyword=@,_,48-57,.

syn keyword qFunction abs aj aj0 all any asc attr avgs ceiling cols count csv deltas desc dev differ distinct ej enlist eval
syn keyword qFunction fills first flip floor fkeys get group gtime hclose hcount hdel hopen hsym iasc idesc inv key keys ltime
syn keyword qFunction ltrim rtrim load lower mavg maxs md5 med meta mins neg next not null or parse prds prev rand 
syn keyword qFunction rank ratios raze reciprocal read0 read1 reverse rload rsave save show signum ssr string sums system 
syn keyword qFunction tables til trim type ungroup upper value var view views wj wj1 ww
hi link qFunction Function

syn keyword qOperator and asof cor cov cross cut except fby ij inter lj lsq mavg mcount mdev mmax mmin mmu mod msum or pj 
syn keyword qOperator rotate set sublist sv txf uj union upsert vs xasc xbar xcol xcols xdesc xexp xgroup xkey xlog xprev xrank
"where was deleted
hi link qOperator Operator

syn keyword qAdverb 	each peach over scan prior
hi link qAdverb Adverb

syn match qIdentifier "\.\?[a-zA-Z]\+[_a-zA-Z0-9.]\+" contains=kqPublic,kqParameter
syn match kqPublic    "\<[A-Z][_a-zA-Z0-9.]\+" 
syn match kqPublic    "\<\.[a-zA-Z][a-zA-Z0-9_]*\.[A-Z][_a-zA-Z0-9.]*" 
syn match kqParameter  /\v<([A-Z][A-Z0-9_]*|[xyz])>/

syn match qSymbol	"\(`[a-zA-Z0-9.][a-zA-Z0-9_.]\+\)" contains=Type,kNullSymbol
syn match qHandle	"\(`:[a-zA-Z0-9./][a-zA-Z0-9_./]\+\)" contains=Type,kNullSymbol

syn match qAssign	"\<\.\=[a-zA-Z][a-zA-Z0-9_.]*\ze\(\[.*\]\)\?\s*:"
syn match qAssign	"\<\.\=[a-zA-Z][a-zA-Z0-9_.]*\ze\(\[.*\]\)\?\s*[+\-*%=@&|^~,.#_!$<>]:"
syn match qAssignPublic	"\<\(\.[a-zA-Z][a-zA-Z0-9_]*\.\)\?[A-Z][a-zA-Z0-9_.]*\ze\(\[.*\]\)\?\s*:"
syn match qAssignPublic	"\<\(\.[a-zA-Z][a-zA-Z0-9_]*\.\)\?[A-Z][a-zA-Z0-9_.]*\ze\(\[.*\]\)\?\s*[+\-*%=@&|^~,.#_!$<>]:"
syn match qAssignParameter	"\<[A-Z][A-Z0-9_]*\ze\(\[.*\]\)\?\s*:"
syn match qAssignParameter	"\<[A-Z][A-Z0-9_]*\ze\(\[.*\]\)\?\s*[+\-*%=@&|^~,.#_!$<>]:"
syn match qAssignParameter	"\<[xyz]\ze\(\[.*\]\)\?\s*:"
syn match qAssignParameter	"\<[xyz]*\ze\(\[.*\]\)\?\s*[+\-*%=@&|^~,.#_!$<>]:"
"syn match qAssign 		/\(set\|upsert\|insert\|delete\)/
"syn match qStatement            /\(exec\|select\|insert\|update\|delete\).*\(by.*\)\?from.*\(\<where\)\?\&select\|where/
"\&exec\|select\|insert\|update\|delete\|\by\|from\|where/
"syn match qFunction /where/

let b:current_syntax="q"
if main_syntax=='q'
  unlet main_syntax
endif
