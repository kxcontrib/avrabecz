1. ascending ordinals (ranking, shareable)
  x:11 17 12 13 13 13 13 18
k)x[<x]?x
q)asc[x]?x
0 6 1 2 2 2 2 7

2. max scan x partition y
  x:1100010011b
  y:3 4 8 2 5 6 9 4 5 4
k),/|\'(&x)_y
q)raze maxs each where[x]_y
3 4 8 8 8 6 9 9 5 4

3. see 2

4. are x and y permutations of each other
  x:15 16 13 18 14 11 12
  y:15 16 13 19 14 11 12
k)x[<x]~y@<y
q)asc[x]~asc y
0b
  y:15 16 13 14 18 12 11
q)asc[x]~asc y
1b

5. sort subvectors ascending
5a. sort ascending
k){x@<x}30 10 40 20
q)asc 30 10 40 20
`s#10 20 30 40
k){x@<x}"popfly"
q)asc"popfly"
`s#"floppy"
5b. indices from lengths
k)il:0,-1_+\
q)il:0,-1_sums@
  il 4 3
0 4
  x:10 30 20 50 60 40 5
  y:4 3
k),/{x@<x}'il[y]_x
q)raze asc each il[y]_x
10 20 30 50 5 40 60

6. subvector minima
  x:1100011001b
  y:3 4 8 2 5 6 9 4 5 4
k)&/'(&x)_y
q)min each where[x]_y
3 2 6 4 4

7. subvector grade up (see 15 for down)
  x:10010010b
  y:14 12 18 16 13 15 11 17
k){,/x+'<:'x_y}[&x;y]
q){raze x+'iasc each x _y}[where x;y]
1 0 2 4 3 5 6 7

8. sort rows ascending
  x:3 5#15?10
  x
(6 3 3 9 7
 9 4 4 7 9
 9 4 7 8 9)
q){x@<x}'x
q)asc each x
(3 3 6 7 9
 4 4 7 9 9
 4 7 8 9 9)

9. see 8

10. Replicate at depth; add new dimension y-fold after dimension x of array z
    depth (n is depth at which to apply f)
d:{[n;f]:[n;.z.s[n-1;f]';f]}
h:{d[x;y#,:]z}
z:2 5#"abcdefghij"
z
("abcde";"fghij")

q:h[0;3;z]
q
(("abcde";"fghij");("abcde";"fghij");("abcde";"fghij"))

r:h[1;3;z]
r
(("abcde";"abcde";"abcde");("fghij";"fghij";"fghij"))

s:h[2;3;z]
s
(("aaa";"bbb";"ccc";"ddd";"eee");("fff";"ggg";"hhh";"iii";"jjj"))

11.  merge x, y, z, ... under control of g (mesh)
  x:"abcd"
  y:"123456789"
  z:"zz"
  g:15?3
  g
1 0 1 1 2 1 2 1 1 0 1 0 1 0 0
k)(x,y,z)@<<g
q)(x,y,x)@iasc iasc g
"3a45z6z78b9cd12"

12. see 11

13. ascending ordinals (ranking, all different)
  x:15 16 13 18 15 12 13
k)<<x
q)iasc iasc x
3 5 1 6 4 0 2

14. see 6

15. see 7

16. merge x and y by g
  x:5 9 8 7 4 3
  y:10 20 30 40
  g:1011001011b
k)(x,y)@<>g
q)(x,y)iasc idesc g
5 10 9 8 20 30 7 40 4 3

17.  descending ordinals (ranking, all different)
  x:15 16 13 18 14 11 12
k)<>x
q)iasc idesc x
2 1 4 0 3 6 5

18. sort ascending by internal alphabet
  w:("once";"more";"into")
k)w@<w
q)asc w
("into"
 "more"
 "once")

19. see 18

20. is x a permutation
  x:-7?7
  x
0 5 1 6 4 3 2
k)x~<<x
q)x~iasc iasc x
1b
  x:7?7
  x
4 3 3 6 0 5 4
q)x~iasc iasc x
0b

21. rotate infixes of y determined by boolean  x to the left one place
  y:"abcdefghij"
  x:1010011000b
k)y@<x++\x
q)y iasc x+sums x
"badecfhijg"

22. index of first occurrence of minimum of x
  x:5+13?10
  x
14 12 10 9 6 12 6 11 8 12 6 13 6
k)*<x
q)first iasc x
4
k)x?&/x
q)x?min x
4

23. see 22

24. median
  x:11?100
  x
61 20 51 12 34 31 51 29 35 17 89
k).5*+/x(<x)@_.5*-1 0+#x
q)med x
34

25. Doubling quotes
  f:ssr[;"\"";"\"\""]
  a:"Did he say, \"Hello\"?"
  f a
"Did he say, \"\"Hello\"\"?"


-----------------------------------------------------
26. insert y "*" after "=" in x
  x:"abc=,d=,fgh="
  g:&x="="
  g
3 6 11
  y:5
  (x,"*")[(#x)&<(!#x),(y*#g)#g]
"abc=*****,d=*****,fgh=*****"

27. insert 0 after indices y of x
  x:"abc,def,gh"
  y:(&x=","),#x
  y
3 7 10
  <(!#x),y
0 1 2 3 10 4 5 6 7 11 8 9 12
  #x
10
  (#x)><(!#x),y
1 1 1 1 0 1 1 1 1 0 1 1 0

28. insert g elements h after indices y of x
  x:"abcd=,def=,gh="
  y:&x="="
  y
4 9 13
  g:4
  h:"x"
  a:g*#y
  a
12
  a#y
4 9 13 4 9 13 4 9 13 4 9 13
  (x,a#h)[<(!#x),a#y]
"abcd=xxxx,def=xxxx,gh=xxxx"

29. insert g elements h before indices y of x
  x:"1234,234,34"
  y:0 5 9
  g:5
  h:"*"
  a:g*#y
  ((a#h),x)[<(a#y),!#x]
"*****1234,*****234,*****34"

30. grade up x according to key y
  x:"fig lime"
  y:" abcdefghijklmn"
  y?/:x
6 9 7 0 12 9 13 5
  <y?/:x
3 7 0 2 1 5 4 6
  x[3 7 0 2 1 5 4 6]
" efgiilm"

31. merge
  x:"egg"
  y:"mrin"
  g:1010110b
k)(x,y)@<<g
q)(x,y)iasc iasc g
"merging"

32. sort ascending indices x according to data y
  x:2 3 4 5 0 1 8 7 6
  y:79 74 78 76 77 75 73 72 71
k)x@<y x
q)x iasc y x
8 7 6 1 5 3 4 2 0

33. sort matrix x on column y
  x:5 6#(5*6)?100
  x
(37 41 41 72 60 0
 91 59 5 19 17 26
 24 90 28 63 42 56
 75 67 45 14 38 49
 85 11 23 61 64 44)
  y:2
  x[;y]
41 5 28 45 23
k)<x[;y]
q)iasc x[;y]
1 4 2 0 3
k)x@<x[;y]
q)x iasc x[;y]
(91 59 5 19 17 26
 85 11 23 61 64 44
 24 90 28 63 42 56
 37 41 41 72 60 0
 75 67 45 14 38 49)

34. choose grading direction
  x:10?100
  x
30 45 97 77 35 49 87 82 79 8
  y:1
k)<x*1 -1 y
q)iasc x*1 -1 y
2 6 7 8 3 5 1 4 0 9
  y:0
q)iasc x*1 -1 y
9 0 4 1 5 3 8 7 6 2

35. sort ascending
  x:10?100
  x
84 63 31 42 95 58 9 37 84 39
k)x@<x
q)asc x
9 31 37 39 42 58 63 84 84 95

36. sort y on x
  x:6?10
  y:6?20
  x
9 2 3 1 9 3
  y
7 8 17 11 16 6
k)y@<x
q)y iasc x
11 8 17 6 7 16

37. invert permutation (the inverse puts y in
ascending order)
  x:-7?7
  x
5 3 2 0 6 4 1
k)<x
q)iasc x
3 6 2 1 5 0 4

check:
k)x@<x
q)asc x
0 1 2 3 4 5 6

38. sort matrix descending
  x:5 6#(5*6)?3
  x
(0 0 0 1 0 1
 1 0 2 2 0 1
 0 2 1 1 1 1
 0 0 0 1 1 2
 1 2 2 0 2 1)
k)x@>x
q)desc x
(0 0 0 1 0 1
 0 0 0 1 1 2
 0 2 1 1 1 1
 1 0 2 2 0 1
 1 2 2 0 2 1)

  y:"abcde"[5 6#(5*6)?5]
  y
("dcdbed"
 "aaaaab"
 "dcdbdc"
 "baaace"
 "eedbec")
q)asc y
("aaaaab"
 "baaace"
 "dcdbdc"
 "dcdbed"
 "eedbec")

39. reverse infixes in x of lengths y
  x:11+!8
  x
11 12 13 14 15 16 17 18
  y:3 3 2
  x[|>+\(!#x)_lin il y]
13 12 11 16 15 14 18 17

40. reverse infixes in x starting at indices y
  x:1 0 1 0 0 1 0 0 0 1
  y:1 2 3 4 5 6 7 8 9 10
  +\x
1 1 2 2 2 3 3 3 3 4
  >+\x
9 5 6 7 8 2 3 4 0 1
  |>+\x
1 0 4 3 2 8 7 6 5 9
  y[|>+\x]
2 1 5 4 3 9 8 7 6 10

41. indices of ones in boolean vector x
  x:0010100010b
k)&x
q)where x
2 4 8

42.  move all blanks to end of text
  x:"   sign   if    i  cant   "
k)x@<" "=x
q)x iasc" "=x
"significant               "

43. move elements of x with characteristic y to
beginning
  x:"mjinase"
  y:0100110b
k)x@>y
q)x iasc y
"jasmine"

44. sort descending
  x:8?10
  x
3 5 0 4 5 2 4 5
k)x@>x
q)desc x
5 5 5 4 4 3 2 0

45. binary representation of positive integer
  x:16
k)2\:x    /'nyi
q)2 vs x  /'nyi
k)0b vs x
q)0b vs x
00000000000000000000000000010000b
  x:20
  2 vs x
00000000000000000000000000010100b

46. transposed formatted integers 1 through x
  x:15
  q:10 _vs 1+!x
  q
(0 0 0 0 0 0 0 0 0 1 1 1 1 1 1
 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5)
  "0123456789"[q]
("000000000111111"
 "123456789012345")

47. polynomial with roots x
  x:1 -6 8
  {(x,0)-y*0,x}/1,x
1 -3 -46 48
  x:2 4
  {(x,0)-y*0,x}/1,x
1 -6 8
  x:1 2
  {(x,0)-y*0,x}/1,x
1 -3 2
  x:1 2 3
  {(x,0)-y*0,x}/1,x
1 -6 11 -6

48. saddle point indices
  x:(4 2 4 4 2 4
>    5 3 5 5 3 5
>    4 2 4 4 2 4
>    1 2 4 4 2 4
>    5 3 5 5 3 5
>    4 2 4 4 2 4)

    48a. row minimum
         rn:{x='&/'x}
         rn x
       (0 1 0 0 1 0
        0 1 0 0 1 0
        0 1 0 0 1 0
        1 0 0 0 0 0
        0 1 0 0 1 0
        0 1 0 0 1 0)
    48b. column maximum
         cx:{x=\:|/x}
         cx x
       (0 0 0 0 0 0
        1 1 1 1 1 1
        0 0 0 0 0 0
        0 0 0 0 0 0
        1 1 1 1 1 1
        0 0 0 0 0 0)
    48c. minmax of rows and columns
         minmax:{(rn x)&(cx x)}
         minmax x
       (0 0 0 0 0 0
        0 1 0 0 1 0
        0 0 0 0 0 0
        0 0 0 0 0 0
        0 1 0 0 1 0
        0 0 0 0 0 0)
       48d. locate 1s in ravel of Boolean
matrix
         ones:{&,/minmax x}
         ones x
       7 10 25 28
       48e. saddle point indices
         sp:{(^x) _vs ones x}
         sp x
       (1 1 4 4
        1 4 1 4)

49. hexadecimal from decimal
  hex:"0123456789abcdef"
  hd:{+hex[16 _vs x]}

  x:10 12 19 1 28 100
  hd x
("0a"
 "0c"
 "13"
 "01"
 "1c"
 "64")

  y:10 12 19 1 28 300
  hd y
("00a"
 "00c"
 "013"
 "001"
 "01c"
 "12c")

50. connectivity list from connectivity matrix
  m:(1 0 1;1 0 1)
  m
(1 0 1
 1 0 1)
  ,/m
1 0 1 1 0 1
  &,/m
0 2 3 5
  (^m)_vs &,/m
(0 0 1 1
 0 2 0 2)
  lm:{(^x)_vs &,/x}
  lm m
(0 0 1 1
 0 2 0 2)

51. indices
  ix:{(^x)_vs!*/^x}

  ix[!6]
,0 1 2 3 4 5
  ix[2 3#!6]
(0 0 0 1 1 1
 0 1 2 0 1 2)
  ix[2 3 2#!12]
(0 0 0 0 0 0 1 1 1 1 1 1
 0 0 1 1 2 2 0 0 1 1 2 2
 0 1 0 1 0 1 0 1 0 1 0 1)

52. truth table of order x
  tt:{2 _vs !_2^x}
  tt 1
,0 1
  tt 2
(0 0 1 1
 0 1 0 1)
  tt 3
(0 0 0 0 1 1 1 1
 0 0 1 1 0 0 1 1
 0 1 0 1 0 1 0 1)

53. decimal digits from integer
  dd:{10 _vs x}
  dd 2001
2 0 0 1
  dd 123456789
1 2 3 4 5 6 7 8 9

54. represent x in base y
  x:256
  y:16
  y _vs x
1 0 0

  x:36
  y:2
  y _vs x
1 0 0 1 0 0

  x:123
  y:10
  y _vs x
1 2 3

55. indices in x containing elements in y
  x:(3 7 8;2 5 9)
  y:(3 1 6;8 9 2)
  (^x)_vs &(,/x) _lin\: ,/y
(0 0 1 1
 0 2 0 2)

56. hexadecimal from decimal characters
  hex:"0123456789abcdef"
  x:" abcdef"
  _ic x
32 97 98 99 100 101 102
  16 _vs _ic x
(2 6 6 6 6 6 6
 0 1 2 3 4 5 6)
  hex[16 _vs _ic x]
("2666666"
 "0123456")
  +hex[16 _vs _ic x]
("20"
 "61"
 "62"
 "63"
 "64"
 "65"
 "66")
  " ",'+hex[16 _vs _ic x]
(" 20"
 " 61"
 " 62"
 " 63"
 " 64"
 " 65"
 " 66")
  ,/" ",'+hex[16 _vs _ic x]
" 20 61 62 63 64 65 66"

  x:"GOLDEN"
  ,/" ",'+hex[16 _vs _ic x]
"47 4f 4c 44 45 4e"

57. vector from date
  _t
-1155413254
  _gtime _t
19980522 35236
  *_gtime _t
19980522
  100000 100 100 _vs *_gtime _t
1998 5 22

58. pair each element of  !x with each element of
!y
  x:3
  y:4
  (x,y)_vs !x*y
(0 0 0 0 1 1 1 1 2 2 2 2
 0 1 2 3 0 1 2 3 0 1 2 3)

59. truth table of order x (see 52)

60. truth table of order x (see 52)

61. cyclic counter, repeating 1 through n
  x:1+!10
  y:8
  1+x!y
2 3 4 5 6 7 8 1 2 3

62. integer and fractional parts of positive x
  x:12.3 23.4 5.33 8.999
  if:{(_ x),'x-_ x}
  if x
((12;0.3)
 (23;0.4)
 (5;0.33)
 (8;0.999))

63. represent x in radix 10 100 1000
  x:123456
  10 100 1000 _vs x
1 23 456

  x:123456789
  10 100 1000 _vs x
4 56 789

64. represent integer time hhmmss as character
time, items separated by colons
    64a. local time as integer of form
hhmmss
      x:_ltime _t
      x
    45628
  q:2 _ $ 1000 _sv 100 _vs
1000000 + x
  q
"04056028"
  @[q;2 5;:;":"]
"04:56:28"

65. represent integer date in form yyyymmdd as
character date, parts separated by "/"
  x:*_ltime _t
  x
19980521
  1000 _sv 10000 100 100 _vs x
1998005021
  q:$1000 _sv 10000 100 100 _vs x
  q
"1998005021"
  @[q;4 7;:;"/"]
"1998/05/21"

66. selection by encoded list
  x:1 0 1
  "abcdefgh"[2 _sv x]
"f"
  x:0 0 0
  "abcdefgh"[2 _sv x]
"a"
  x:1 1 1
  "abcdefgh"[2 _sv x]
"h"

67.  Extrapolated value of abscissa x and
ordinate y at g
  x:-1 0 1
  y:1 0 1.0    / y ~ x^2
  g:10

  |!#x
2 1 0
  x^/:|!#x
(1 0 1.0
 -1 0 1.0
 1 1 1.0)
  y _lsq x^/:|!#x
1 0 4.440892e-016
  g _sv y _lsq x^/:|!#x
100.0
   g:5
   g _sv y _lsq x^/:|!#x
25.0

68. not relevant

69. value of ascending polynomial coefficients y
at points x
  x:-1 0 2
  y: 4 0 5 1
  x _sv\: y
-8 1 43

70. remove duplicate rows
  x:("to"
"be"
"or"
"not"
"to"
"be")
k)?x
q)distinct x
("to"
 "be"
 "or"
 "not")

71. connectivity matrix from connectivity list
  y
(0 1
 0 2
 1 0
 1 2
 2 2)
  x
3
  x _sv/:y
1 2 3 5 8
  (!9)_lin x _sv/:y
0 1 1 1 0 1 0 0 1
  (x,x)#(!x*x)_lin x _sv/:y
(0 1 1
 1 0 1
 0 0 1)

72. encode date as integer
  x:`date$.z.Z /for local-date
  x:.z.D /from 2.4 up
  x
2007.04.04
  "i"$x
2650
k)"I"$($x)0 1 2 3 5 6 8 9
q)"I"$string[x]0 1 2 3 5 6 8 9  
20070404

73. remove trailing blanks
  x:"trailing blanks    "
       73a. negative count of trailing blanks
         nctb:{-+/&\|" "=x}
         nctb x
       -4
  rtb:{(nctb x)_ x}
  rtb x
"trailing blanks"

74. number of days in month x of Gregorian year
y (ly from 463)

  x:1
  :[2=x
>  28+ly y
>  (0,12#7#31 30)[x]]
31
  x:2
  :[2=x
>  28+ly y
>  (0,12#7#31 30)[x]]
29

75. decimal from hexadecimal
  x:("ff";"a9";"8ac";"ffff")
  x
("ff"
 "a9"
 "8ac"
 "ffff")
  "0123456789abcdef"?/:"ff"
15 15
  "0123456789abcdef"?/:/:x
(15 15
 10 9
 8 10 12
 15 15 15 15)
  16 _sv/:
"0123456789abcdef"?/:/:x
255 169 2220 65535

76. justify right
x:"trailing blanks    "
       76a. negative count of trailing blanks
         nctb:{-+/&\|" "=x}
         nctb x
       -4
  rj:{(nctb x)!x}
  rj x
"    trailing blanks"

  x:("a     ";"bc     ";"d e
";"fg h  ";"ij kl ";"mnopqr")
  x
("a     "
 "bc     "
 "d e   "
 "fg h  "
 "ij kl "
 "mnopqr")
  rj'x
("     a"
 "     bc"
 "   d e"
 "  fg h"
 " ij kl"
 "mnopqr")

77. present value of cash flows c at times t and
discount rate d

Example: a 3-year bond with an annual 10%
coupon and discount rate of 0.9
  pv:{[c;t;d]+/c*d^t}
  c:0.1 0.1 1.1
  t:1 2 3
  d:0.9

  pv[c;t;d]
0.9729

It is better to use current prices to derive a
discount function
  pv:{[c;t;d]+/c*d[t]}
  pv[c;t;{[t] 0.9^t}]
0.9729

It is even more efficient to use the discount
values directly
  d: 0.9^0 1 2 3
  d
1 0.9 0.81 0.729
  pv[c;t;d]
0.9729

78.  number from alphanumeric
  x:"1998 51"
k). x
q)value x
1998 51
  3 + value x
2001 54

79. index (1-origin) of first non-blank, counting
from rear
  x:"blanks at end   "
  (" "=x)
0 0 0 0 0 0 1 0 0 1 0 0 0 1 1 1
  (" "=x) _sv 1
4

80. scattered indexing
  x:2 3 4# _ci 97+!24
  x
(("abcd"
  "efgh"
  "ijkl")
 ("mnop"
  "qrst"
  "uvwx"))
  x ./:(0 0 0;1 1 3;1 2 2)
"atw"

81. raveled index from general index
  x:2 3 4# _ci 97+!24
  x[1;1;3]
"t"
  ^x
2 3 4
  2 3 4 _sv 1 1 3
19
  ,//x
"abcdefghijklmnopqrstuvwx"
  (,//x)[19]
"t"

82. future value of cash flows x at interest rate y
  x:10 15 20 25
  y:5
  +/x*(1+y%100)^|!#x
74.11375
  fv:{+/x*(1+y%100)^|!#x}
  fv[x;y]
74.11375

83. see 69

84. scalar from boolean vector
  x:1 0 0 1 1 1 0 1
  2 _sv x
157

85. is matrix x antisymmetric
  x:( 0 -7  1
      7  0 -4
     -1  4  0)
k)x~-+x
q)x~neg flip x
1b

86. is matrix x symmetric
  x:(0 4 7 1
     4 8 6 4
     7 6 2 0
     1 4 0 6)
k)x~+x
q)x~flip x
1b
  x:4 4#(4*4)?10
  x
(6 6 3 3
 9 7 9 4
 4 7 9 9
 4 7 8 9)
q)x~flip x
0

87. number of decimals (maximum 7)
  nd:{:[1=#x;0;-2+#x]}
  ff:{$x-_ x}
  ff 6.567
"0.567"
  nd ff 1.234
3
  nd ff 1234
0
  nd ff 78.1234567
7
  nd ff 78.12345678
7
"0.1234568"

88.  name variable according to x
  x:"test"
  y:2 3#!6
  . "var",($x),":y"
  vartest
(0 1 2
 3 4 5)

  x:123
  . "var",($x),":y"
  var123
(0 1 2
 3 4 5)

93. numbers from alphanumeric matrix
  x:4 3#"  1 12   0.5"
  x
("  1"
 " 12"
 "   "
 "0.5")
  x=" "
(1 1 0
 1 0 0
 1 1 1
 0 0 0)
  &/'x=" "
0 0 1 0
  &&/'x=" "
,2
  z:.:'x
  z
(1;12;;0.5)
  @[z;,2;:;0]
(1;12;0;0.5)
Putting it all together
  @[.:'x;&&/'x=" ";:;0]
(1;12;0;0.5)
But there may be no all-blank rows
  y=:4 3#"  1 123450.5"
  y
("  1"
 " 12"
 "345"
 "0.5")
  @[.:'y;&&/'y=" ";:;0]
(1;12;345;0.5)

  na:{@[.:'x;&&/'x=" ";:;0]}

94. number from alphanumeric x, default y
  x:""
  y:"-1"
  .((x~"")#"y"),x
"-1"
  x:"234.5"
  .((x~"")#"y"),x
234.5

95. numeric from proper alphanumeric
nonnegative integer
  x:"123 438"
  d:"0123456789"
  1 _ . "0 ",((#x)*&/x _lin d)#x
123 438
 x:"123 45a 789"
  1 _ . "0 ",((#x)*&/x _lin d)#x
0

96. conditional execution
k)@[+/;!6;`error]
q)@[sum;til 6;`error]
15
q)@[sum;"abc";`error]
`error
q)@[sum;"abc";::]
"type"
q)@[sum;"abc";{-1 x," error happened!"}]
type error happened!

98. execute rows of character matrix
  x1:4
  x2:9
  x:2 5#"y1:x1y2:x2"
  x
("y1:x1"
 "y2:x2")
  .:'x
(;)
  y1
4
  y2
9

99. numeric vector from evaluating rows of
character matrix
  x:2 5#"1+2 41+3 6"
  x
("1+2 4"
 "1+3 6")
  .:'x
(3 5
 4 7)
  ,/.:'x
3 5 4 7

100. indexing arbitrary rank array
 x:2 3 4 5#!120
  x[1]
((60 61 62 63 64
  65 66 67 68 69
  70 71 72 73 74
  75 76 77 78 79)
 (80 81 82 83 84
  85 86 87 88 89
  90 91 92 93 94
  95 96 97 98 99)
 (100 101 102 103 104
  105 106 107 108 109
  110 111 112 113 114
  115 116 117 118 119))
  x[0;0]
(0 1 2 3 4
 5 6 7 8 9
 10 11 12 13 14
 15 16 17 18 19)
  x[0;0;0]
0 1 2 3 4
  x[0;0;0;0]
0

101. sum numbers in character matrix
  x:$!5
  x
(,"0"
 ,"1"
 ,"2"
 ,"3"
 ,"4")
  +/ .:' x
10

104. date ascending format
  1 _ ,/".",/:$|.:'0 4 6 _ $*
_ltime _t
"25.5.1998"

105. current time of 12-hour clock (AM & PM)
  y:_t
  y
-1155069892
  x:*|_ltime y
  x
201508
  hms:{1 _,/":",/:1 _'$100+100
_vs x!120000}
  hms x
"08:15:08"
  ap:{"AP"[115959<x],"M"}
  ap x
"PM"
  hm:{{(hms x)," ",ap x}[*|_ltime
x]}
Ordinarily one would use _t as the argument to
hm
  hm x
"08:15:08 PM"

106. leading zeros for positive integers x in field
width y
  x:10 _draw 40
  x
37 36 17 38 29 4 31 12 35 25
  z:$:'x+(y-1){x*10}/10
  z
("1037"
 "1036"
 "1017"
 "1038"
 "1029"
 "1004"
 "1031"
 "1012"
 "1035"
 "1025")
  u:1 _/: z
  u
("037"
 "036"
 "017"
 "038"
 "029"
 "004"
 "031"
 "012"
 "035"
 "025")

107. current date, American
  x:*_ltime _t
  x
19980526
  10000 100 100 _vs x
1998 5 26
  1!10000 100 100 _vs x
5 26 1998
  $1!10000 100 100 _vs x
(,"5"
 "26"
 "1998")
  " ",/:$1!10000 100 100 _vs x
(" 5"
 " 26"
 " 1998")
  ,/" ",/:$1!10000 100 100 _vs x
" 5 26 1998"
  1 _ ,/" ",/:$1!10000 100 100
_vs x
"5 26 1998"
  "0123456789 "?/:1 _ ,/"
",/:$1!10000 100 100 _vs x
5 10 2 6 10 1 9 9 8
  d:"0123456789"
  e:d,"/"
  b:10000 100 100
  k:{1 _ x}
  s:" "
  e[d?/:k ,/s,/:$1!b _vs x]
"5/26/1998"
   da:{e[d?/:k,/s,/:$1!b _vs x]}
  da[*_ltime _t]
"5/26/1998"

111. count of format of x
k)cf:#$:
q)cf:count string@
  cf 12.345
6
  cf -1
2
  cf 1e-12
6
  string 1e-12
"1e-012"

115, 116, 117. case structure
  $[c0;t0;f]
  $[c0;t0;c1;t1;f]
  $[c0;t0;c1;t1;c2;t2;f]
  $[c0;t0;c1;t1;c2;t2;c3;t3;f]
    et cetera
In the first case, if c0 is nonzero, the result is t0;
otherwise f.
In all cases, the result is the tn corresponding to
the first nonzero cn.
If none of the cn are nonzero the result is f.

121. y-shaped array of numbers from x[0] to
x[1]-1
  x:4 9
  y:3 4
  (*x)+y _draw --/x
(5 8 7 4
 8 7 5 8
 8 7 7 5)

122. y objects selected with replacement from !x
(roll)
  y:3 5
  x:7
  y _draw x
(6 2 1 2 2
 4 4 6 3 0
 6 3 4 5 1)

123. y objects selected without replacement from
!x (deal)
  y:2 3
  x:7
k)y#(-*/y)?x
q)y#neg[prd y]?x
(1 6 4
 3 5 2)
  -6?6
3 0 1 5 4 2

123.1 normal deviates (from interval (0,1))
  x:4
  x?1.
0.8683 0.5104 0.968 0.9831

124.  predicted values of exponential fit
  x:64 70 77 82 92
  y:56 60 66 70 78
  a:x^/:0 1
  a
(1 1 1 1 1.0
 64 70 77 82 92.0)
  _log[y]
4 4.1 4.2 4.2 4.4
  _lsq[_log[y];a]
3.3 0.012
  _exp[_mul[+a;_lsq[_log[y];a]]]
56 60 66 70 78.0

125. predicted values of best linear fit (least
squares)
  x:64 70 77 82 92 107 125 143
165 189
  y:56 60 66 70 78 88 102 118 136
155
  a:x^/:0 1
  a
(1 1 1 1 1 1 1 1 1 1.0
 64 70 77 82 92 107 125 143 165
189.0)

  _mul[+a;_lsq[y;a]]
55.32371 60.08021 65.62945
69.59319 77.52068 89.41191
103.6814 117.9509 135.3913
154.4173
This can also be written in infix form
(+a) _mul (y _lsq a)
55.32371 60.08021 65.62945
69.59319 77.52068 89.41191
103.6814 117.9509 135.3913
154.4173

126. g-degree polynomial fit of points (x,y)
  x:64 70 77 82 92 107 125 143
165 189
  y:(5*x^3)+(-1*x^2)+(4*x)+182
  y
1307062 1710562 2277226 2750626
3885526 6114376 9750682
1.460134e+007 2.243424e+007
3.372156e+007
  | _lsq[y;x^/:!g+1]
5 -1 4 182.0
  |(y _lsq x^/:!g+1)
5 -1 4 182.0

127. coefficients of exponential fit of points (x,y)
  x:64 70 77 82 92 107 125 143
165 189
  y:56 60 66 70 78 88 102 118 136
155
  a: _lsq[_log[y];x^/:0 1]
  a
3.563398 0.00817742
  a[0]: _exp[a[0]]
  a
35.2829 0.00817742
  a[0]*_exp[x*a[1]]
  59.54624 62.54071 66.22511
68.98898 74.86758 84.63791
98.05964 113.6098 136.0024
165.4933
  y
56 60 66 70 78 88 102 118 136
155.0

128. coefficients of best linear fit of points (x,y)
(least squares)
  x:64 70 77 82 92 107 125 143 165 189.
  y:56 60 66 70 78 88 102 118 136 155.
k)z:y!+1.,'x
q)z:y!x xexp/:0 1
q)z:y lsq x xexp/:0 1
  z
4.587803 0.7927486
  z[0]+x*z 1    / should be y, approximately
55.32371 60.08021 65.62945 69.59319 77.52068 89.41191 103.6814 117.9509 135.3913 154.4173

129. arctangent y%x
  x:sqrt 3
  y:1
  atan y%x
0.5235988

131. complementary angle (arccos sin x)
  x:0.25
  acos sin x
1.320796

  x+acos sin x    / should be 0.5*pi, approximately
1.570796
  2*x+acos sin x
3.141593

132. rotation matrix for angle x (in radians)
counter-clockwise
  ((cos x;-sin x);(sin x;cos x))
(0.9689124 -0.247404
 0.247404 0.9689124)

133. degrees from radians
  x:0.5
  57.295779513082323*x
28.64789

134. radians from degrees
  x:0.5
  z:57.295779513082323*x
  z
28.64789
  0.017453292519943295*z
0.5

135. number of permutations of n objects taken k
at a time
  fac:{[n]:[n>1; n * _f[n-1];1]}
  bin:{[n;k]fac[n]%fac[n-
k]*fac[k]}
  pn:{[n;k]fac[k]*bin[n;k]}
  pn[5;3]
60.0

136. Pascal's triangle of order x (binomial coefficients) [see 1007]

137. Taylor series with coefficients y at point x
  x:3
  y:1 1 1
  a:!#y
  +/y*(x^a)%fac'[a]
8.5
  y:30#1
  x:1
  a:!#y
  +/y*(x^a)%fac'[a]
2.7182818308537429

139. Beta function
See gamma in appendix
Beta:{(gamma[x]*gamma y)%gamma x+y}

142. number of combinations of n objects taken k at a time
  fac:{[n]:[n>1; n * _f[n-1];1]}
  bin:{[n;k]fac[n]%fac[n-k]*fac[k]}
  bin[12;7]
792.0
  bin[10;4]
210.0

143. indices of distinct items
  x:"ajhajhja"
k).=x
q)value group x
(0 3 7
 1 4 6
 2 5)

144. histogram
  x:13 _draw 12
  x
8 3 11 9 9 4 6 6 3 3 9 7 9
  h:{@[&1+|/x;x;+;1]}
  b:h[x]
  b
0 0 0 3 1 0 2 1 1 4 0 1
  c:(1+|/b)-b
  c
5 5 5 2 4 5 3 4 4 1 5 4
d:|+(b#\:1),'(c#\:0)
  d
(0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 1 0 0
 0 0 0 1 0 0 0 0 0 1 0 0
 0 0 0 1 0 0 1 0 0 1 0 0
 0 0 0 1 1 0 1 1 1 1 0 1)
  " *"[d]
("            "
 "         *  "
 "   *     *  "
 "   *  *  *  "
 "   ** **** *")

145. count of x between endpoints (l,h)
  x:5 5 _draw 100
  l:10
  h:80
  x
(66 8 6 4 86
 82 91 52 53 89
 43 0 62 3 17
 0 26 81 2 12
 37 41 41 72 60)
  xl:x>l
  xl
(1 0 0 0 1
 1 1 1 1 1
 1 0 1 0 1
 0 1 1 0 1
 1 1 1 1 1)
  xh:x<h
  xh
(1 1 1 1 0
 0 0 1 1 0
 1 1 1 1 1
 1 1 0 1 1
 1 1 1 1 1)
  xbetween:xl&xh
  xbetween
(1 0 0 0 0
 0 0 1 1 0
 1 0 1 0 1
 0 1 0 0 1
 1 1 1 1 1)
  +/'xbetween
1 2 3 2 5

146. compound interest for principals y at percentages g for periods x
  x:1 2 3 4
  y:1 2 3 4
  g:0.5 1 1.5 2
  z:y*\:(1+g%100)^\:x
\p 5
  z
((1.005 1.01 1.0151 1.0202
  1.01 1.0201 1.0303 1.0406
  1.015 1.0302 1.0457 1.0614
  1.02 1.0404 1.0612 1.0824)
 (2.01 2.02 2.0302 2.0403
  2.02 2.0402 2.0606 2.0812
  2.03 2.0604 2.0914 2.1227
  2.04 2.0808 2.1224 2.1649)
 (3.015 3.0301 3.0452 3.0605
  3.03 3.0603 3.0909 3.1218
  3.045 3.0907 3.137 3.1841
  3.06 3.1212 3.1836 3.2473)
 (4.02 4.0401 4.0603 4.0806
  4.04 4.0804 4.1212 4.1624
  4.06 4.1209 4.1827 4.2455
  4.08 4.1616 4.2448 4.3297))

147. locations of string x in string y (including overlaps)
  x:"**"
  y:"*abcugj**jy***kmhix**12"
  ss:{z[&y[z+\:!#x]~\:x]}
  ss[x;y;&((1-#x)_ y)=*x]
7 11 12 19

  y[7 11 12 19+\:0 1]
("**"
 "**"
 "**"
 "**")

148. node matrix from connection matrix
(inverse to 157)
  x:(  1  1  0  0  0
       0 -1  0  1  1
      -1  0  1 -1  0
       0  0 -1  0 -1)
Each column in matrix x represents a path
between 2 nodes:
From node 0 to node 2
From node 0 to node 1
From node 2 to node 3
From node 1 to node 2
From node 1 to node 3
  a:1 -1=\:x
  a
((1 1 0 0 0
  0 0 0 1 1
  0 0 1 0 0
  0 0 0 0 0)
 (0 0 0 0 0
  0 1 0 0 0
  1 0 0 1 0
  0 0 1 0 1))

  b:_mul[a;!#x]
  b
(0 0 2 1 1
 2 1 3 2 3)

  nc:{_mul[1 -1=\:x;!#x]}
  nc x
(0 0 2 1 1
 2 1 3 2 3)

149. number of decimals in x, maximum y
  nd:{+/~0=(-_-x*10^y)!/:-_-
(10^y)*10^-!y+1}
  x:1.4321 1.21 10
  y:3
  nd[x;y]
3 2 0

  10^-!y+1
1 0.1 0.01 0.001
  -_-(10^y)*10^-!y+1
1000 100 10 1
  -_-x*10^y
1433 1210 10000
  (-_-x*10^y)!/:-_-(10^y)*10^-
!y+1
(433 210 0
 33 10 0
 3 0 0
 0 0 0)
  ~0=(-_-x*10^y)!/:-_-(10^y)*10^-
!y+1
(1 1 0
 1 1 0
 1 0 0
 0 0 0)
  +/~0=(-_-x*10^y)!/:-_-
(10^y)*10^-!y+1
3 2 0

150. sum items of x given by y
  x:_log[1+!5]
  x
0 0.6931472 1.098612 1.386294
1.609438
  y:1 4 1 4 1
  a:=y
  a
(0 2 4
 1 3)
  +/'x[a]
2.70805 2.079442
  +/x[0 2 4]
2.70805
  +/x[1 3]
2.079442
  +/'x[=y]
2.70805 2.079442

151. efficient execution of f x where x has
repeated values

  x:1 2 3 2 3 2 1
  f:10*
k){[f;x]$[0>@x;f x;f[u](u:?x)?x]}[f;x]  /.Q.fu
q).Q.fu[f;x]
  10 20 30 20 30 20 10


152. sum items of y according by ordered codes
g in x
  y:1+!20
  y
1 2 3 4 5 6 7 8 9 10 11 12 13 14
15 16 17 18 19 20
  z:"abcde"
  x:z[20 _draw #z]
  x
"dcbbbaceeaeccbecbaea"
  xz:z,x
  yz:(&#z),y
  xz
"abcdedcbbbaceeaeccbecbaea"
  yz
0 0 0 0 0 1 2 3 4 5 6 7 8 9 10 11
12 13 14 15 16 17 18 19 20
  +/'yz[=xz]
54 43 50 1 62

  sc:{+/'((&#z),y)[=z,x]}
  sc[x;y;z]
54 43 50 1 62

153. index of rows of y in corresponding rows of
x
  x:1+3 4#!12
  x
(1 2 3 4
 5 6 7 8
 9 10 11 12)
  y:(1 0 3 0
>    0 6 0 8
>    9 0 0 12)
  x ?/:'y
(0 4 2 4
 4 1 4 3
 0 4 4 3)

154. range (nub; remove duplicate items)
See 70.

155. greatest common divisor of list x
  gcd:{*|1+&&/'0=x!/:1+!&/x}
  x:6 9 12
  gcd x
3

  &/x
6
  !&/x
0 1 2 3 4 5
  1+!&/x
1 2 3 4 5 6
  x!/:1+!&/x
(0 0 0
 0 1 0
 0 0 0
 2 1 0
 1 4 2
 0 3 0)
  0=x!/:1+!&/x
(1 1 1
 1 0 1
 1 1 1
 0 0 1
 0 0 0
 1 0 1)
  &/'0=x!/:1+!&/x
1 0 1 0 0 0
  &&/'0=x!/:1+!&/x
0 2
  *|1+&&/'0=x!/:1+!&/x
3

156. classify y into x classes between min and
max y
  x:10
  y:260 416 18 27 265 336 4
normalize y so minimum value is 0
  sm:{x-&/x}
  sm[y]
256 412 14 23 261 332 0
normalize again so values are in range 0 le y and
y lt x
  nr:{y*x%|/y}
  nr[x;sm[y]]
6.21 10 0.34 0.558 6.33 8.06 0
compare against interior range boundaries, 1+!x-
1
  ~nr[x;sm[y]]</:1+!x-1
(1 1 0 0 1 1 0
 1 1 0 0 1 1 0
 1 1 0 0 1 1 0
 1 1 0 0 1 1 0
 1 1 0 0 1 1 0
 1 1 0 0 1 1 0
 0 1 0 0 0 1 0
 0 1 0 0 0 1 0
 0 1 0 0 0 0 0)
count the number of boundaries passed by each
  +/~nr[x;sm[y]]</:1+!x-1
6 9 0 0 6 8 0

157. connection matrix from node matrix
(inverse to 148)
node matrix top and bottom rows give from and
to nodes
   x: (0 0 2 1 1
      2 1 3 2 3)
enumerate count of range
  !#?,/x
0 1 2 3
where is x equal to each of it
  x=/:!#?,/x
((1 1 0 0 0
  0 0 0 0 0)
 (0 0 0 1 1
  0 1 0 0 0)
 (0 0 1 0 0
  1 0 0 1 0)
 (0 0 0 0 0
  0 0 1 0 1))
subtract "to" matrix from "from" matrix
  -/'x=/:!#?,/x
(1 1 0 0 0
 0 -1 0 1 1
 -1 0 1 -1 0
 0 0 -1 0 -1)

158. see 20

159. is range of x 1 (are all items of x equal)
  x:1 1 1 1 1
k)1=#?x
q)1=count distinct x
1
  y:1 1 0 1 1
q)1=count distinct y
0

160. move blanks in x to end of list
  x:"sign if i cant"
  x[<x=" "]
"significant   "

  be:{x[<x=" "]}

y:("yo ho ho"
 "and a bottle"
 "of rum")

  be'[y]
("yohoho  "
 "andabottle  "
 "ofrum ")

161. is y upper triangular
  x:(1 0 0 1
>    0 2 1 0
>    0 0 1 2
>    0 0 0 0)
  slt:{(!x)>\:!x}
  slt[#x]
(0 0 0 0
 1 0 0 0
 1 1 0 0
 1 1 1 0)
  x*slt[#x]
(0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0)
  zm:{(x,x)#0}
  zm[#x]
(0 0 0 0
 0 0 0 0
 0 0 0 0
 0 0 0 0)
  iut:{zm[#x]~x*slt[#x]}
  iut x
1
  +x
(1 0 0 0
 0 2 0 0
 0 1 1 0
 1 0 2 0)
  iut[+x]
0

162. is x lower triangular
  x:(1 0 0 0
     0 2 0 0
     0 1 1 0
     1 0 2 0)
  sut:{(!x)<\:!x}
  sut[#x]
(0 1 1 1
 0 0 1 1
 0 0 0 1
 0 0 0 0)
  ilt:{zm[#x]~x*sut[#x]}
  ilt[x]
1
  ilt[+x]
0

163. polynomial product
  x:1 2 1
  y:1 3 3 1
  y*/:x
(1 3 3 1
 2 6 6 2
 1 3 3 1)
  1 _'zm[#x]
(0 0
 0 0
 0 0)
  (1 _'zm[#x]),'y*/:x
(0 0 1 3 3 1
 0 0 2 6 6 2
 0 0 1 3 3 1)
  (!#x)!'(1 _'zm[#x]),'y*/:x
(0 0 1 3 3 1
 0 2 6 6 2 0
 1 3 3 1 0 0)
  +/(!#x)!'(1 _'zm[#x]),'y*/:x
1 5 10 10 5 1

  pm:{+/(!#x)!'(1
_'zm[#x]),'y*/:x}
  pm[x;y]
1 5 10 10 5 1

164. divisors
  x:363
  dv:{&0=x!/:!1+x}
  dv[x]
1 3 11 33 121 363
  dv 365
1 5 73 365
  dv 367
1 367

  dv'[1 2 3 4 5 6 7 8 9 10]
(,1
 1 2
 1 3
 1 2 4
 1 5
 1 2 3 6
 1 7
 1 2 4 8
 1 3 9
 1 2 5 10)

165. list of x zeros preceded by (y-x) ones
  x:5
  y:9
  zo:{((y-x)#1),&x}
  zo[x;y]
1 1 1 1 0 0 0 0 0

166. barchart of integer list x, down the page
  x:2 5 7 4 9 3 6
  xl:{(x#1),&y-x}
  " X"[|+xl\:[x;|/x]]
("    X  "
 "    X  "
 "  X X  "
 "  X X X"
 " XX X X"
 " XXXX X"
 " XXXXXX"
 "XXXXXXX"
 "XXXXXXX")

  bd:{" X"[|+xl\:[x;|/x]]}
  bd[x]
("    X  "
 "    X  "
 "  X X  "
 "  X X X"
 " XX X X"
 " XXXX X"
 " XXXXXX"
 "XXXXXXX"
 "XXXXXXX")

167. list of x ones preceded by (y-x) xeros
  x:3
  y:9
  xr:{(&y-x),x#1}
  xr[x;y]
0 0 0 0 0 0 1 1 1
  x:2 5 7 4 9 3 6
  xr\:[x;y]
(0 0 0 0 0 0 0 1 1
 0 0 0 0 1 1 1 1 1
 0 0 1 1 1 1 1 1 1
 0 0 0 0 0 1 1 1 1
 1 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 1 1 1
 0 0 0 1 1 1 1 1 1)

168. list of x zeros followed by (y-x) ones
  x:3
  y:9
  (&x),(y-x)#1
0 0 0 1 1 1 1 1 1
  zl:{(&x),(y-x)#1}
  zl[x;y]
0 0 0 1 1 1 1 1 1
  x:2 5 7 4 9 3 6
  zl\:[x;y]
  x:2 5 7 4 9 3 6
  zl\:[x;y]
(0 0 1 1 1 1 1 1 1
 0 0 0 0 0 1 1 1 1
 0 0 0 0 0 0 0 1 1
 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0
 0 0 0 1 1 1 1 1 1
 0 0 0 0 0 0 1 1 1)

169. see 172

170. horizontal barchart of x with maximum z,
normalized to length y
  x:4
  y:5
  z:10
  ad:{_ x*y%z}
  ad[2;5;10]
1
  ad[23;50;80]
14
  x:2 8 5 6 3 1 7 7 10 4
  xl:{(x#1),&y-x}
  xl\:[ad[x;y;z];y]
(1 0 0 0 0
 1 1 1 1 0
 1 1 0 0 0
 1 1 1 0 0
 1 0 0 0 0
 0 0 0 0 0
 1 1 1 0 0
 1 1 1 0 0
 1 1 1 1 1
 1 1 0 0 0)
  " X"[xl\:[ad[x;y;z];y]]
("X    "
 "XXXX "
 "XX   "
 "XXX  "
 "X    "
 "     "
 "XXX  "
 "XXX  "
 "XXXXX"
 "XX   ")

171. horizontal barchart of integer values x
(compare bh here with xl in 172)
  bh:{@[&y;!x;:;1]}
  " X"[bh\:[x;|/x]]
("XX        "
 "XXXXXXXX  "
 "XXXXX     "
 "XXXXXX    "
 "XXX       "
 "X         "
 "XXXXXXX   "
 "XXXXXXX   "
 "XXXXXXXXXX"
 "XXXX      ")

172. list of x ones followed by (y-x) zeros
  x:5
  y:9
  (x#1),&(y-x)
1 1 1 1 1 0 0 0 0
  xl:{(x#1),&y-x}
  xl[x;y]
1 1 1 1 1 0 0 0 0
  x:2 5 7 4 9 3 6
  xl\:[x;y]
(1 1 0 0 0 0 0 0 0
 1 1 1 1 1 0 0 0 0
 1 1 1 1 1 1 1 0 0
 1 1 1 1 0 0 0 0 0
 1 1 1 1 1 1 1 1 1
 1 1 1 0 0 0 0 0 0
 1 1 1 1 1 1 0 0 0)

173. assign x to one of y classes of width h,
starting with g
  f:{[x;y;g;h] -1+ -1 _
#:'=(1+!y),-_-(x-g)%h}
  x:32 56 36 48 36 24 28 44 52 32
  y:4
  h:10
  g:10
  f[x;y;g;h]
0 2 4 2

174. move x into first quadrant
  sm:{x-&/x}
  x:(1 6 4;3 4 7;7 8 6)
  sm'[x]
(0 5 3
 0 1 4
 1 2 0)

175. primes to n
  n:10
  x:1+!n
  x
1 2 3 4 5 6 7 8 9 10
  x!/:x:1+!n
(0 0 0 0 0 0 0 0 0 0
 1 0 1 0 1 0 1 0 1 0
 1 2 0 1 2 0 1 2 0 1
 1 2 3 0 1 2 3 0 1 2
 1 2 3 4 0 1 2 3 4 0
 1 2 3 4 5 0 1 2 3 4
 1 2 3 4 5 6 0 1 2 3
 1 2 3 4 5 6 7 0 1 2
 1 2 3 4 5 6 7 8 0 1
 1 2 3 4 5 6 7 8 9 0)
  +/0=x!/:x:1+!n
1 2 2 3 2 4 2 4 3 4
  2=+/0=x!/:x:1+!n
0 1 1 0 1 0 1 0 0 0
  &0,2=+/0=x!/:x:1+!n
2 3 5 7
  pn:{[n]&0,2=+/0={x!/:x}1+!n}
  pn 30
2 3 5 7 11 13 17 19 23 29

177. ordinal of word in x pointed at by y
  ow:{+/~y<1+&x=" "}
  x:"ordinal of word in x pointed
at by y"
  ow[x;5]
0
  ow[x;6]
0
  ow[x;7]
0
  ow[x;8]
1
  ow[x;26]
5

177. indices of start of string x in string y
  x:"st"
  y:"indices of start of string x
in string y"
  y _ss x
11 20 32

178. index of first occurrence of string x in string
y
  x:"st"
  y:"index of first occurrence of
string x in string y"
  *y _ss x
12

179. contour levels y at points with altitude x
  cl:{y[-1++/~y>x]}
  y:-100 0 10 100 1000 10000
  cl[-5;y]
-100
  cl[0;y]
0
  cl[99;y]
10
  cl[9;y]
0
  cl[10;y]
10

180. is x in range [y)
  hc:{1 0~/:~x<\:y}
  x:19 20 21 39 40 41
  y:20 40
  ~x<\:y
(0 0
 1 0
 1 0
 1 0
 1 1
 1 1)
  hc[x;y]
0 1 1 1 0 0

181. which class of y x belongs to
  cl:{-1++/x>/:y}
  x:87 9 931 7 27 92 654 1416 7
911
  y:0 50 100 1000
  +/x>/:y
2 1 3 1 1 2 3 4 1 3
  -1++/x>/:y
1 0 2 0 0 1 2 3 0 2
  cl[x;y]
1 0 2 0 0 1 2 3 0 2

182. indices of consecutive repeated elements
  x:"aaabccccdeee"
  =x
(0 1 2
 ,3
 4 5 6 7
 ,8
 9 10 11)
  #:'=x
3 1 4 1 3
  &1<#:'=x
0 2 4
  {x[&1<#:'x]}=x
(0 1 2
 4 5 6 7
 9 10 11)
  re:{{x[&1<#:'x]}[=x]}
  re x
(0 1 2
 4 5 6 7
 9 10 11)

183. maximum table
  x:!10
  x&\:x
(0 0 0 0 0 0 0 0 0 0
 0 1 1 1 1 1 1 1 1 1
 0 1 2 2 2 2 2 2 2 2
 0 1 2 3 3 3 3 3 3 3
 0 1 2 3 4 4 4 4 4 4
 0 1 2 3 4 5 5 5 5 5
 0 1 2 3 4 5 6 6 6 6
 0 1 2 3 4 5 6 7 7 7
 0 1 2 3 4 5 6 7 8 8
 0 1 2 3 4 5 6 7 8 9)

184. right justify fields x of length y to length g
  x:"abcdefghij"
  y:2 3 4 1
  g:5
  a:+\0,-1_ y
  a
0 2 5 9
  a _ x
("ab"
 "cde"
 "fghi"
 ,"j")
  (g#" "),/:a _ x
("     ab"
 "     cde"
 "     fghi"
 "     j")
  b:(-g)#/:(g#" "),/:a _ x
  b
("   ab"
 "  cde"
 " fghi"
 "    j")
  ,/b
  rj:{[x;y;g],/(-g)#/:(g#"
"),/:(+\0,-1 _ y) _ x}
  rj[x;y;g]
"   ab  cde fghi    j"

185. left justify fields x of length y to length g
  x:"abcdefghij"
  y:2 3 4 1
  g:5
  a:+\0,-1_ y
  a
0 2 5 9
  a _ x
("ab"
 "cde"
 "fghi"
 ,"j")
  ((:+\0,-1_ y) _ x),\:g#" "
("ab     "
 "cde     "
 "fghi     "
 "j     ")
  g#/:((:+\0,-1_ y) _ x),\:g#" "
("ab   "
 "cde  "
 "fghi "
 "j    ")
lj:{[x;y;g],/g#/:(:+\0,-1_ y
),\:g#" " }
  rj[x;y;g]
"   ab  cde fghi    j"
  lj:{[x;y;g],/g#/:((+\0,-1 _ y)_
x),\:g#" "}
  lj[x;y;g]
"ab   cde  fghi j    "

186. annuity coefficient for x periods at interest
rate y%
  x:10 15 20 25
  y:8 9 10 15
  +1-(1+y%100)^\:-x
(0.537 0.578 0.614 0.753
 0.685 0.725 0.761 0.877
 0.785 0.822 0.851 0.939
 0.854 0.884 0.908 0.97)
  ac:{(y%100)%/:+1-(1+y%100)^\:-
x}
  ac[x;y]
(0.149 0.156 0.163 0.199
 0.117 0.124 0.131 0.171
 0.102 0.11 0.117 0.16
 0.0937 0.102 0.11 0.155)

187. direct matrix product
  x:1+3 2#!6
  y:1+2 4#!8
  +:'x*\:\:y
+:'x*\:\:y
(((1 2 3 4
   2 4 6 8)
  (5 6 7 8
   10 12 14 16))
 ((3 6 9 12
   4 8 12 16)
  (15 18 21 24
   20 24 28 32))
 ((5 10 15 20
   6 12 18 24)
  (25 30 35 40
   30 36 42 48)))
  dp:{+:'x*\:\:y}

188. Shur product
  x
(1 2
 3 4
 5 6)
  y
(1 2 3 4
 5 6 7 8)
  ((*|^x)#x)*(*^y)#'y
(1 4
 15 24)

189. add x to each row of y
  x:1+!4
  y:3 4#2+!12
  y
(2 3 4 5
 6 7 8 9
 10 11 12 13)
  x+/:y
(3 5 7 9
 7 9 11 13
 11 13 15 17)

190. see 189

191. Shur sum
  x
(1 2
 3 4
 5 6)
  y
(1 2 3 4
 5 6 7 8)
  ((*|^x)#x)+(*^y)#'y
(2 4
 8 10)

192. add x to each column of y
  x:1+!2
  x
1 2
  y:2 5#3+!10
  y
(3 4 5 6 7
 8 9 10 11 12)
  x+'y
(4 5 6 7 8
 10 11 12 13 14)

193. see 192

195. upper triangular matrix of order x
  x:5
  {~x>\:x}!x
(1 1 1 1 1
 0 1 1 1 1
 0 0 1 1 1
 0 0 0 1 1
 0 0 0 0 1)
  ut:{{~x>\:x}[!x]}
  ut 5
(1 1 1 1 1
 0 1 1 1 1
 0 0 1 1 1
 0 0 0 1 1
 0 0 0 0 1)

196. lower triangular matrix of order x
  lt:{{~x<\:x}[!x]}
  lt 5
(1 0 0 0 0
 1 1 0 0 0
 1 1 1 0 0
 1 1 1 1 0
 1 1 1 1 1)

197. identity matrix of order x
  id:{(x,x)#1,x#0}
  id 5
(1 0 0 0 0
 0 1 0 0 0
 0 0 1 0 0
 0 0 0 1 0
 0 0 0 0 1)

198. Hilbert matrix of order x
  hm:{%1+(!x)+/:!x}
  hm 5
(1 0.5 0.333 0.25 0.2
 0.5 0.333 0.25 0.2 0.167
 0.333 0.25 0.2 0.167 0.143
 0.25 0.2 0.167 0.143 0.125
 0.2 0.167 0.143 0.125 0.111)

199. multiplication table of order x
  mt:{{x*\:x}[1+!x]}
  mt 5
(1 2 3 4 5
 2 4 6 8 10
 3 6 9 12 15
 4 8 12 16 20
 5 10 15 20 25)

200. replicating a dimension of rank-3 array x y-
fold
  x:2 3 3#1+!18
  y:3
  x[;,/(y#1)*\:!(^x)[1];]
((1 2 3
  4 5 6
  7 8 9
  1 2 3
  4 5 6
  7 8 9
  1 2 3
  4 5 6
  7 8 9)
 (10 11 12
  13 14 15
  16 17 18
  10 11 12
  13 14 15
  16 17 18
  10 11 12
  13 14 15
  16 17 18))

201. moving index y-wide for x
  x:"abcdef"
  y:3
  (!(#x)-y-1)+\:y
3 4 5 6

202. indices of infixes of length y
  x:4+!5
  x
4 5 6 7 8
  y:3
  x+\:!y
(4 5 6
 5 6 7
 6 7 8
 7 8 9
 8 9 10)

203. one-column matrix from numeric list
  x:7 _draw 100
  x
34 31 51 29 35 17 89
  +,x
(,34
 ,31
 ,51
 ,29
 ,35
 ,17
 ,89)

204. numeric array and its negative
  x:3+3 4#!12
  x
(3 4 5 6
 7 8 9 10
 11 12 13 14)
   x,''-x
 ((3 -3
  4 -4
  5 -5
  6 -6)
 (7 -7
  8 -8
  9 -9
  10 -10)
 (11 -11
  12 -12
  13 -13
  14 -14))

205. remove trailing blank rows
  x:+5 9#"abc de   "
  x
("aaaaa"
 "bbbbb"
 "ccccc"
 "     "
 "ddddd"
 "eeeee"
 "     "
 "     "
 "     ")
  x~\:(#+x)#" "
0 0 0 1 0 0 1 1 1
  ~x~\:(#+x)#" "
1 1 1 0 1 1 0 0 0
  ||\|~x~\:(#+x)#" "
1 1 1 1 1 1 0 0 0
&||\|~x~\:(#+x)#" "
0 1 2 3 4 5
  rtr:{x[&||\|~x~\:(#+x)#" "]}
  rtr[x]
("aaaaa"
 "bbbbb"
 "ccccc"
 "     "
 "ddddd"
 "eeeee")

206. remove duplicate rows
  x:("abc"
     "def"
     "abc"
     "ghi"
     "jkl"
     "abc"
     "ghi"
     "abc")
  ?x
("abc"
 "def"
 "ghi"
 "jkl")

207. indices in matrix x of rows of matrix y
  x:+3 8#"abcdefgh"
  x
("aaa"
 "bbb"
 "ccc"
 "ddd"
 "eee"
 "fff"
 "ggg"
 "hhh")
  y:+3 4#"afmc"
  y
("aaa"
 "fff"
 "mmm"
 "ccc")
  x?/:y
0 5 8 2

208. see 206

209. remove trailing blank columns
  x:3 9#"abc de   "
  x
("abc de   "
 "abc de   "
 "abc de   ")
  +rtr[+x]
("abc de"
 "abc de"
 "abc de")

210. remove leading blank columns
  x:3 9#"   ed cba"
  x
("   ed cba"
 "   ed cba"
 "   ed cba")
  +|rtr[|+x]
("ed cba"
 "ed cba"
 "ed cba")

211. remove leading blank rows
  x:|+3 9#"abc de   "
  x
("   "
 "   "
 "   "
 "eee"
 "ddd"
 "   "
 "ccc"
 "bbb"
 "aaa")
  |rtr[|x]
("eee"
 "ddd"
 "   "
 "ccc"
 "bbb"
 "aaa")

213. maxima of infixes of x specified by boolean
list y
  x:-17 7 30 12 5 2 -5 6 -3 -19
  y:10#1 1 0
  y
1 1 0 1 1 0 1 1 0 1
  |/x[&y]
12

214. see 159

215. see 159

216. rows of matrix x starting with y
  x:("sit";"sat";"sin";"tin")
  x
("sit"
 "sat"
 "sin"
 "tin")
  y:"si"
  y _lin/:x
(1 1
 1 0
 1 1
 0 1)
  &/'y _lin/:x
1 0 1 0
  &&/'y _lin/:x
0 2
  rb:{x[&&/'y _lin/:x]}
  rb[x;y]
("sit"
 "sin")

217. index of last nonblank in string
  x:("love's not   "
     "time's fool  "
     "though rosy   ")
  ln:{*|&~" "=x}
  ln'x
9 10 10

218. single blank row from multiple
  s:"  a bc  def    g"
  a:~s=" "
  a
0 0 1 0 1 1 0 0 1 1 1 0 0 0 0 1
  b:~a
  b
1 1 0 1 0 0 1 1 0 0 0 1 1 1 1 0
  c:>':0,b
  c
1 0 0 1 0 0 1 0 0 0 0 1 0 0 0 0
  d:a|c
  d
1 0 1 1 1 1 1 0 1 1 1 1 0 0 0 1
  e:&d
  e
0 2 3 4 5 6 8 9 10 11 15
  s[e]
" a bc def g"
  x:+3 10#"a  b c   d"
  x
("aaa"
 "   "
 "   "
 "bbb"
 "   "
 "ccc"
 "   "
 "   "
 "   "
 "ddd")
  a:x~\:(#+x)#" "
  a
0 1 1 0 1 0 1 1 1 0
  b:~a
  c:>':0,a
  c
0 1 0 0 1 0 1 0 0 0
  d:b|c
  d
1 1 0 1 1 1 1 0 0 1
  e:&d
  e
0 1 3 4 5 6 9
  x[e]
("aaa"
 "   "
 "bbb"
 "   "
 "ccc"
 "   "
 "ddd")
  rs:{x[{&(~x)|xf[x]}x~\:(#+x)#"
"]}
  rs x
("aaa"
 "   "
 "bbb"
 "   "
 "ccc"
 "   "
 "ddd")

219. see 147

220. remove duplicate blank columns
  x:3 9#"a  b c   d"
  x
("a  b c   d"
 "a  b c   d"
 "a  b c   d")
  +rs[+x]
("a b c d"
 "a b c d"
 "a b c d")

221. is x an integer in interval [ g,h )
  g:6
  h:12
  x:18
  (x=_ x)&(~x<g)&(x<h)
0
  x:7
  (x=_ x)&(~x<g)&(x<h)
1
  x:7.1
   (x=_ x)&(~x<g)&(x<h)
0

222. maximum of x with weights y
  x:1 2 3 4 5
  y:5 4 3 2 1
  |/x*y
9

223. minimum of x with weights y
  x:1 2 3 4 5
  y:5 4 3 2 1
  &/x*y
5

224. extend distance table to next leg
  x:(  0  50  80  20 999
      50   0  20  40  30
      80  20   0 999  30
      20  40 999   0  10
     999  30  30  10   0)
notice x[0;2] is 80 while x[0;1]+x[1;2] is 70
  x(&/+)\:x
(0 50 70 20 30
 50 0 20 40 30
 70 20 0 40 30
 20 40 40 0 10
 30 30 30 10 0)

225. remove blank rows
  x:("aaa"
    "bbb"
    "   "
    "ccc"
    "   ")
  x _dv "   "
("aaa"
 "bbb"
 "ccc")

226.  remove blank columns
  x:+4 4#"xxxx    hhhh  ii"
  x
("x h "
 "x h "
 "x hi"
 "x hi")
  +(+x)_dv "    "
("xh "
 "xh "
 "xhi"
 "xhi")

227. see 69

228. is y a row of x
  x:("xxx";"yyy";"zzz";"yyy")
  "yyy"in x
1

229. see 228

230. extend a transitive binary relation
  x:(0 1 0 0
     0 0 1 1
     1 0 0 0
     0 0 1 0)
  x(|/&)\:x
(0 0 1 1
 1 0 1 0
 0 1 0 0
 1 0 0 0)

231. which rows of x contain elements different
from y
  x:("aaa";"bbb";"ooo";"pop")
  y:"o"
  ~x=y
(1 1 1
 1 1 1
 0 0 0
 1 0 1)
  |/'~x=y
1 1 0 1

232. is y a row of x
See 228.

233. is x within range [ y )
  x:9
  y:(1  9
>    9 16
>    5  7
>    8 20
>    6 10)
  x<'y
(0 0
 0 1
 0 0
 0 1
 0 1)
  </'x<y
0 1 0 1 1
  x(</<)/:y
0 1 0 1 1

234. is x within the range ( y ]
~x>'y
(0 1
 1 1
 0 0
 0 1
 0 1)
  </'~x>'y
1 0 0 1 1

235. see 234

236. number of occurrences of x in y
  y:3+7 _draw 6
  y
6 4 7 7 6 6 4
  x:7
  +/x=y
2
  x(+/=)/:y
0 0 1 1 0 0 0

237. average (mean) of x weighted by y
  y:78 80 90 88 72
  x:20 15 20 22 19
  x*y
1560 1200 1800 1936 1368
  +/x*y
7864
  (+/x*y)%#x
1572.8

239. sum reciprocal series
  x:10 9 10 7 8
  y:80 63 70 63 64
  +/y%x
39.0

240. matrix product
  x:(1 2 3.
     4 5 6.)
  y:(1 2.
     3 4.
     5 6.)
  x$y
q)x mmu y
(22 28
 49 64)
k)x(+/*)\:y  
(22 28
 49 64)

241. sum over subsets of x specified by y
  x:1+3 4#!12
  x
(1 2 3 4
 5 6 7 8
 9 10 11 12)
  y:4 3#1 0
  y
(1 0 1
 0 1 0
 1 0 1
 0 1 0)
  x _mul y
(4 6 4
 12 14 12
 20 22 20)

242. sum squares of x
  x:1 2 3 4 5
k)+/x*x
q)sum x*x
55

243. dot product of vectors
  x:1 2 3 4 5
  y:10 20 30 40 50
k)+/x*y
q)sum x*y
  x wsum y
  x$y
550

244. product over subsets of x specified by y
  x:1+3 4#!12
  x
(1 2 3 4
 5 6 7 8
 9 10 11 12)
  y:4 3#1 0
  y
(1 0 1
 0 1 0
 1 0 1
 0 1 0
  x (*/^)\:y
(3 8 3.0
 35 48 35.0
 99 120 99.0)

245. randomize the random seed
  _t
-1154371779
  \r -1154371779
  \r
-1154371779

246. see 242

247. interlace x[i]#1 and y[i]#0
  x:1 3
  y:2 4
  a:,/+(x;y)
  a
1 2 3 4
  b:(#x,y)#1 0
  b
1 0 1 0
  c:a#'b
  c
(,1
 0 0
 1 1 1
 0 0 0 0)
  d:,/c
  d
1 0 0 1 1 1 0 0 0 0
  ,/(,/+(x;y))#'(#x,y)#1 0
1 0 0 1 1 1 0 0 0 0

248. center text x in line of width y
  x:"1234567890"
  y:16
  a:y#x,y#" "
  a
"1234567890      "
  b:_ -0.5*y-#x
  b
3
  c:b!a
  c
"   1234567890   "
  ct:{(_ -0.5*y-#x)!y#x,y#" "}
  ct[x;y]
"   1234567890   "

p:("1234567890";"1234";"123456";"
1234567890123456")
  p
("1234567890"
 "1234"
 "123456"
 "1234567890123456")
  ct\:[p;y]
("   1234567890   "
 "      1234      "
 "     123456     "
 "1234567890123456")

249. offset enumeration
  x:10
  y:3
  x+!y
10 11 12
  oi:{x+!y}
  oi[x;y]
10 11 12
  x:10 20 30
  y:3 4 2
  oi'[x;y]
(10 11 12
 20 21 22 23
 30 31)
  ,/oi'[x;y]
10 11 12 20 21 22 23 30 31

250. replicate y x times
  x:3
  y:10
  x#y
10 10 10
  rp:{x#y}
  rp[x;y]
10 10 10
  x:3 4 2
  y:10 20 30
  rp'[x;y]
(10 10 10
 20 20 20 20
 30 30)
  ,/rp'[x;y]
10 10 10 20 20 20 20 30 30

251. see 250

252. x alternate takes of 1s and 0s
  x:1 2 3 4 5
  b:(#x)#1 0
  b
1 0 1 0 1
  c:x#'b
  c
(,1
 0 0
 1 1 1
 0 0 0 0
 1 1 1 1 1)
  d:,/c
  d
1 0 0 1 1 1 0 0 0 0 1 1 1 1 1
  ,/x#'(#x)#1 0
1 0 0 1 1 1 0 0 0 0 1 1 1 1 1

253. see 250

254. running parity of infixes of y indicated by x
  x:1 0 0 0 0 1 0 0 0 0 1 0 0 0
  y:1 0 0 1 1 1 0 0 1 0 1 1 0 0
  a:&x
  a
0 5 10
  b:a _ y
  b
(1 0 0 1 1
 1 0 0 1 0
 1 1 0 0)
  c:(+\'b)!\:2
  c
(1 1 1 0 1
 1 1 1 0 0
 1 0 0 0)
  d:,/c
  d
1 1 1 0 1 1 1 1 0 0 1 0 0 0

255. running sum of infixes of y indicated by x
  x:1 0 0 0 1 0 0 0 1
  y:1 2 3 4 5 6 7 8 9
  a:&x
  a
0 4 8
  b:a _ y
  b
(1 2 3 4
 5 6 7 8
 ,9)
  c:+\'b
  c
(1 3 6 10
 5 11 18 26
 ,9)
  d:,/c
  d
1 3 6 10 5 11 18 26 9
  rs:{,/+\'(&x)_ y}
  rs[x;y]
1 3 6 10 5 11 18 26 9

256. groups of 1s in y pointed at by x
  y
0 0 0 1 1 1 1 1 1 0 0 1 1 1 1 1
  x
0 0 0 1 0 0 0 0 1 0 0 1 0 0 0 1
  a:+\>':0,y
  a
0 0 0 1 1 1 1 1 1 1 1 2 2 2 2 2
  y&a=|\x*a
0 0 0 1 1 1 1 1 1 0 0 1 1 1 1 1

257. sums of infixes of x determined by lengths
y
  x:1+!10
  x
1 2 3 4 5 6 7 8 9 10
  y:2 3 2 3
  a:+\0,-1 _ y
  a
0 2 5 7
  a _ x
(1 2
 3 4 5
 6 7
 8 9 10)
  +/'a _ x
3 12 13 27

259. removing leading and trailing blanks
  x:"   abcd e  fg   "
  a:~x=" "
  a
0 0 0 1 1 1 1 0 1 0 0 1 1 0 0 0
  (|\a)&(||\|a)
0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0
  &(|\a)&(||\|a)
3 4 5 6 7 8 9 10 11 12
  x[&(|\a)&(||\|a)]
"abcd e  fg"
  lt:{x[&(|\a)&||\|a:~x=" "]}
  lt x
"abcd e  fg"

260. first 10 figurate numbers of order x
  fg:{x+\/10#1}
  fg 0
1 1 1 1 1 1 1 1 1 1
  fg 1
1 2 3 4 5 6 7 8 9 10
  fg 2
1 3 6 10 15 21 28 36 45 55
  fg 3
1 4 10 20 35 56 84 120 165 220
  fg 4
1 5 15 35 70 126 210 330 495 715

261. first group of 1s
  x:1 1 1 0 1 0 1
  x&&\x=|\x
1 1 1 0 0 0 0
  x:0 0 0 1 1 0 1
  x&&\x=|\x
0 0 0 1 1 0 0
  x:0 1 0 1 0 1 0
  x&&\x=|\x
0 1 0 0 0 0 0

262. value of saddle point (see 48)
  x:(5 4 6 4 12 5
>  16 2 4 5 16 18
>  8 18 7 12 16 11
>  20 17 16 14 16 20
>  16 8 12 9 17 13)
  rn:{x='&/'x}
  cx:{x=\:|/x}
  minmax:{(rn x)&(cx x)}
  minmax x
(0 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 1 0 0
 0 0 0 0 0 0)
  ones:{&,/minmax x}
  ones x
,21
  (,/x)[ones[x]]
,14

264. insert x[i] blanks after y[g[i]]
  b:(0,g)_ y
  b
("ab"
 "cd"
 "ef"
 ,"g")
  c:b,'(x,0)#\:" "
  c
("ab  "
 "cd  "
 "ef  "
 ,"g")
  ,/c
"ab  cd  ef  g"
  ib:{[x;y;g],/((0,g)_
y),'(x,0)#\:" "}
  ib[x;y;g]
"ab  cd  ef  g"

265. insert x[i] zeroes after i-th infix of y
  y:0 0 1 0 1 0 1 1
  x:1 2 2 1
  &y
2 4 6 7
  a:@[&#y;&y;:;x]
  a
0 0 1 0 2 0 2 1
  b:1+a
  b
1 1 2 1 3 1 3 2
  d:(!(#y)++/x)
  d
0 1 2 3 4 5 6 7 8 9 10 11 12 13
  d:(1_!(#y)++/x)
  d
1 2 3 4 5 6 7 8 9 10 11 12 13 14
  d _lin c
1 1 0 1 1 0 0 1 1 0 0 1 0 1

266. remove trailing blanks
  x:"  phrase 266   "
  a:~x=" "
  a
0 0 1 1 1 1 1 1 0 1 1 1 0 0 0
  b:||\|a
  b
1 1 1 1 1 1 1 1 1 1 1 1 0 0 0
  x[&b]
"  phrase 266"

267. remove leading blanks
  x:"  phrase 267  "
  a:~x=" "
  a
0 0 1 1 1 1 1 1 0 1 1 1 0 0
  b:|\a
  b
0 0 1 1 1 1 1 1 1 1 1 1 1 1
  x[&b]
"phrase 267  "

268. is x in ascending order
  x:2 5 7 9 6 8 3
k)x~x@<x
q)x~asc x
0b
  x:0 1 1 1 7 8 9
q)x~asc x
1b

269. see 248

270. see 268

271. slight variation of 264

272. see 266

273. join  scalar to each list item
  x:"a"
  y:"01234"
  x,/:y
("a0"
 "a1"
 "a2"
 "a3"
 "a4")

  x:("01234";"56789")
  y:("abcde";"fghij")
  x,y
("01234"
 "56789"
 "abcde"
 "fghij")
  x,'y
("01234abcde"
 "56789fghij")

274. see 273

275. see 76

276. see 185

277. end indicators from lengths
  x:1 2 3 4 5
  +\x
1 3 6 10 15
  -1++\x
0 2 5 9 14
  +/x
15
  @[&+/x;-1++\x;:;1]
1 0 1 0 0 1 0 0 0 1 0 0 0 0 1

278. start indicators from lengths
  x:1 2 3 4 5
  (!+/x) _lin\: +\0,x
1 1 0 1 0 0 1 0 0 0 1 0 0 0 0

279. variation of 265

280. see 41

281. value of Taylor series with coefficients y at
x
  x:12
  y:7 5 6 6
  1+!-1+#y
1 2 3
  1.0,x%1+!-1+#y
1 12 6 4.0
  *\1.0,x%1+!-1+#y
1 12 72 288.0
  y**\1.0,x%1+!-1+#y
7 60 432 1728.0
  +/y**\1.0,x%1+!-1+#y
2227.0

282. index of first blank
  x:"ab c d"
  x?" "
2
  x:("ab c d";" a bc";"abcd  ")
  x
("ab c d"
 " a bc"
 "abcd  ")
  x?\:" "
2 0 4

283. locate field y of fields beginning with first
of x
  x:"abcabbbaccccaddd"
  y:2
  y=+\x=*x
0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0
  x[&y=+\x=*x]
"abbb"
  y:4
    x[&y=+\x=*x]
"addd"

284. sum items of x marked by y
  x:1 2 3 4 5 6 7
  y:1 1 1 2 2 3 3
  =y
(0 1 2
 3 4
 5 6)
  x[=y]
(1 2 3
 4 5
 6 7)
  +/'x[=y]
6 9 13
  y:1 2 1 3 3 2 1
  +/'x[=y]
11 8 9

285. moving sum
  y:3
  x:1 2 3 4 5
  +\x
1 3 6 10 15
  (-y)
-3
  (-y)_ a:+\x
1 3
  0,(-y)_ a
0 1 3
  (y-1)_ a
6 10 15
  ((y-1)_ a)-0,(-y)_ a
6 9 12
  ms:{((y-1)_ a)-0,(-y)_ a:+\x}
  ms[x;y]
6 9 12

286. FIFO stock y decremented with x units
  x:5
  y:1 2 3 4 5
  (+\y)-x
-4 -2 1 5 10
  g:0|(+\y)-x
  g
0 0 1 5 10
  -':0,g
0 0 1 4 5
  ff:{-':0,0|(+\y)-x}
  ff[x;y]
0 0 1 4 5

289. or-scan of infixes of y indicated by x
  y:1 0 0 1 0 1 0 0
  x:1 0 1 0 0 0 1 0
  a:&x
  b:a _ y
  b
(1 0
 0 1 0 1
 0 0)
  c:|\'b
  c
(1 1
 0 1 1 1
 0 0)
  ,/c
1 1 0 1 1 1 0 0

290. and-scan of infixes of y indicated by x
  y:1 0 0 1 0 1 0 0
  x:1 0 1 0 0 0 1 0
  a:&x
  b:a _ y
  b
(1 0
 0 1 0 1
 0 0)
  c:&\'b
  c
(1 0
 0 0 0 0
 0 0)
  ,/c
1 0 0 0 0 0 0 0

291. sums of infixes of y indicated by x
  y:1 2 3 4 5
  x:1 0 1 0 1
  a:&x
  b:a _ y
  b
(1 2
 3 4
 ,5)
  c:+/'b
  c
3 7 5

292. groups of 1s in y pointed to by x
  y:1 1 1 0 0 1 1
  x:0 1 0 1 0 0 0
  -1 _ 0,y
0 1 1 1 0 0 1
  +\y>-1 _ 0,y
1 1 1 1 1 2 2
  x&y
0 1 0 0 0 0 0
  a:+\y>-1 _ 0,y
  a
1 1 1 1 1 2 2
  a[&x&y]
,1
  a _lin ,1
1 1 1 1 1 0 0
  y&a _lin ,1
1 1 1 0 0 0 0
  go:{y&a _lin(a:+\y>-1 _
0,y)[&x&y]}
  go[x;y]
1 1 1 0 0 0 0

293. locate quotes and text between them
  x:"abc\"de\"f"
  #x
8
  a:x="\""
  a
0 0 0 1 0 0 1 0
  b:&a
  b
3 6
  c:(*b)+!1+--/b
  c
3 4 5 6
  @[&#x;c;:;1]
0 0 0 1 1 1 1 0

294. locate text between quotes
  x:"abc\"de\"f"
  #x
8
  a:x="\""
  a
0 0 0 1 0 0 1 0
  b:&a
  b
3 6
  c:b+1 -1
  c
4 5
  d:(*c)+!1+--/c
  d
4 5
  @[&#x;d;:;1]
0 0 0 0 1 1 0 0  c

295. depth of parentheses
  x:"a(b((c)de)f)g(h)"
  dp:{+\("("=x)--1 _ 0,")"=x}
  dp x
0 1 1 2 3 3 3 2 2 2 1 1 0 1 1 1
  x:"a(b((cde)f)g(ki)"
  dp x
0 1 1 2 3 3 3 3 3 2 2 1 2 2 2 2
  x:"ab((c)de)f)g(ki)"
  dp x
0 0 1 2 2 2 1 1 1 0 0 -1 0 0 0 0
  x:"a(b((c)de)f)g(h)"
  dp x
0 1 1 2 3 3 3 2 2 2 1 1 0 1 1 1

296. starting positions of infixes from lengths x
  x:2 3 1 5
  +\-1 _ 0,x
0 2 5 6
  sl:{+\-1 _ 0,x}
  sl[x]
0 2 5 6

297.  spread marked field heads right
  x:"abcdef"
  y:1 1 0 0 1 0
  a:&y
  a
0 1 4
  b:#:'a _ x
  b
1 3 2
  c:b#'a
  c
(,0
 1 1 1
 4 4)
  d:,/c
  d
0 1 1 1 4 4
  x[d]
"abbbee"
  x[,/(#:'a _ x)#'a:&y]
"abbbee"
  sh:{x[,/(#:'a _ x)#'a:&y]}
  sh[x;y]
"abbbee"

298. see 266

299. see 267

300. gth infix of y marked by x
  x:1 0 0 1 0 1 0 0 0 1 0
  y:"abcdefghijk"
  g:2
  a:&x
  a
0 3 5 9
  b:a _ x
  b
("abc"
 "de"
 "fghi"
 "jk")
  b[g]
"fghi"
  ((&x)_ y)[g]
"fghi"

301. alternating sum series
  x:1+!10
  x
1 2 3 4 5 6 7 8 9 10
  a:((#x)#1 -1)
  a
1 -1 1 -1 1 -1 1 -1 1 -1
  b:x*a
  +\b
1 -1 2 -2 3 -3 4 -4 5 -5
  as:{+\x*(#x)#1 -1}
  as[x]
1 -1 2 -2 3 -3 4 -4 5 -5

302. x first triangular numbers
  x:6
k)+\!x
q)sums til x
0 1 3 6 10 15

303. smearing 1s between pairs of 1s
  x:0 1 0 0 1 0 1 0 1 0 1 1 0
  a:(+\x)!2
  a
1 1 1 0 0 0 0 1 1 0 0
  x|a
1 1 1 1 0 0 0 1 1 1 0
  x|(+\x)!2
1 1 1 1 0 0 0 1 1 1 0

304. invert 0s following 1st 1
  x:0010011b
k)|\x
q)maxs s
0011111b

305. invert fields marked by pairs of 1s
  x:1 0 1 0 0 1 0 0 1
  a:(+\x)!2
  a
1 1 0 0 0 1 1 1 0
  ~x
0 1 0 1 1 0 1 1 0
  (~x)&a
0 1 0 0 0 0 1 1 0
  (~x)&(+\x)!2
0 1 0 0 0 0 1 1 0

306. invert all 1s after 1st 0
  x:1101010b
k)&\x
q)mins x
1100000b

307. invert all 1s after 1st 1
  x:001101b
k)(#x)#0b
q)count[x]#0b
000000b
  x?1b
2
k)@[(#x)#0b;x?1b;:;1b]
q)@[count[x]#0b;x?1b;:;1b]
001000b

308. invert all 0s after 1st 0
  x:1 0 0 1 1 0
  a:x?0
  a
1
  !#x
0 1 2 3 4 5
  b:(a+1)_!#x
  b
2 3 4 5
  @[x;b;:;1]
1 0 1 1 1 1
  @[x;(1+x?0)_!#x;:;1]
1 0 1 1 1 1

309. running parity
  x:0 1 1 1 1 0 1 0 0
  (+\x)!2
0 1 0 1 0 0 1 1 1

310. running sum
  x:1 20 300 4000
  +\x
1 21 321 4321

311. see 159

312. maximum separation of items of x
  x:10+7?9
  x
17 14 14 17 14 17 18
k)(|/x)-&/x
q)max[x]-min x
4

313. value of two-by-two determinant
  det: {-/y*|x}
  x:(13 21;34 55)
  x
(13 21
 34 55)
  (13 * 55) - (34 * 21)
1
  13 21 * 55 34
715 714
  -/13 21 * 55 34
1
  det x
,1

314. see 313

315. see 159

316. see 159

317. see 159

318. area of triangle with sides x (Heron's rule)
  x:3 4 5
  hr:{(*/(+/x%2)-0,x)^0.5}
  hr[x]
6.0

319. standard deviation
  x:44 77 48 24 28 36 17 49 90 91
  std:{((+/(x-
(+/x)%#x)^2)%#x)^0.5}
  std[x]
25.48411

320. variance (dispersion)
  x:44 77 48 24 28 36 17 49 90
91.0
  var:{(+/(x-(+/x)%#x)^2)%#x}
  var[x]
649.44
  (var[x])^0.5
25.48411

321. y-th moment of x
  x:44 77 48 24 28 36 17 49
  ym:{(+/(x-(+/x)%#x)^y)%#x}
  ym[x;2]
309.23
  ym[x;0]
1.0
  ym[x;1]
4.4409e-016
  ym[x;3]
3889.9
322.

323. see 248

324. see 159

325. average (mean)
  av:{(+/x)%#x}
  av[1 10 100]
37.0

326. see 325

327. see 70

328. number of items
k)#"abcd"
q)count"abcd"
4
k)#(1;2 3;4 5 6)
q)count(1;2 3;4 5 6)
3

329. mask from positive integers in x
  x:-5+7 _draw 10
  x
2 3 3 -2 4 4 -1
  (!1+|/x) _lin x
0 0 1 1 1

330. index of 1st occurrence of maximum item
of x
  x:5 3 7 0 5 7 2
k)x?|/x
k)*>x
q)x?max x
q)first idesc x
2

331. identity for floating point maximum, negative infinity -0w
  -1e100|-0w
-1e+100
identity for integer maximum, negative infinity -0W
  -123456789|-0W
-123456789

332. see 326

333. quick membership for nonnegative integers
  x:5 3 7 2
  y:8 5 2 6 1 9
  &1+|/x,y
0 0 0 0 0 0 0 0 0 0
  a:&1+|/x,y
  @[a;y;:;1]
0 1 1 0 0 1 1 0 1 1
  (@[a;y;:;1])[x]
1 0 0 1
  @[&1+|/x,y;y;:;1][x]
1 0 0 1

334. nonnegative maximum
  x:1 2 3 4 5
  |/x,0
5
  x:-1 -2 -3 -4 -5
  |/x,0
0
  x:!0
  x
!0
  |/x,0
0

335. maximum
  x:5 3 7 2
k)|/x
q)max x
7

336. index of first occurrence of minimum
  x:5 3 7 2 5 3
k)x?&/x
q)x?min x
3

337. identity for floating point minimum,
positive infinity 0i
  1e100&0w
1e+100
identity for integer minimum, positive infinity 0I
  123456789&0W
123456789

338. locate first occurrence in x of an item of y
  x:"abcdef"
  y:"dbf"
  &/x?/:y
1
  x[1]
"b"

339. minimum
  x:5 3 7 2
q)|/x
k)&/x
2

340. see 159

341. see 159

342. arabic from roman number
  x:"MCMIX"
  "MDCLXVI"?/:x
0 2 0 6 4
  a:0,1000 500 100 50 10 5
1["MDCLXVI"?/:x]
  a
0 1000 100 1000 1 10
  a<1!a
1 0 1 0 1 0
  _ a*-1^a<1!a
0 1000 -100 1000 -1 10
  +/_ a*-1^a<1!a
1909
  ar:{+/_ a*-1^a<1!a:0,1000 500
100 50 10 5 1["MDCLXVI"?/:x]}
  ar[x]
1909

343. see 159

344. pairwise match
  x:("123";"123";"45";"45")
  x
("123"
 "123"
 "45"
 "45")
  ~':x
1 0 1
  (~':x),0
1 0 1 0
  pm:{(~':x),0}
  pm 1 1 1 1 2 2 3 4 4 4
1 1 1 0 1 0 0 1 1 0

345. do ranges of x and y match
  x:1 2 3
  y:3 2 1 1
  a:?x
  x
1 2 3
  a
1 2 3
  b:?y
  b
3 2 1
  a[<a]~b[<b]
1
  om:{x[<x]~y[<y]}
  om[?x;?y]
1
  om[?"bca";?"cabba"]
1

346. see 20

347. see 159

348. do x and y have items in common
  x:"aba"
  y:"cdeac"
  x _lin\: y
1 0 1
  |/x _lin\: y
1
  y:"edge"
  |/x _lin\: y
0

349. see 159'

350. is x 1s and 0s only (Boolean)
  x:0 1 0 1
  &/x _lin\:0 1
1
  x:1 1 1 1
    &/x _lin\:0 1
1
  x:1 0 1 2
    &/x _lin\:0 1
0

351. is x a subset of y
  x:"abgk"
  y:"abcdefghijkl"
  &/x _lin\:y
1
  x:"abgx"
  &/x _lin\:y
0

352. see 159

353. are items unique
  x:"abcdefg"
  (#x)=(#?x)
1
  x:"abcdefa"
  (#x)=(#?x)
0

354. see 159

355. none
  x:&7
  x
0 0 0 0 0 0 0
  ~|/x
1
  x:7#0 1
  x
0 1 0 1 0 1 0
  ~|/x
0

356. any
  x:0 0 0 0 0 0 0 0
k)|/x
q)any x
0
  x:7#0 1
k)|/x
q)any x
1

357. does x match y
  x:("abc";`sy;1 3 -7)
  y:("abc";`sy;1 3 -7)
  x~y
1
  x:1 2 3
  y:1 4 3
  x~y
0

358. see 159

359. locate blank rows
  x:+5 6#"a bc d"
  x
("aaaaa"
 "     "
 "bbbbb"
 "ccccc"
 "     "
 "ddddd")
  x~\:(#+x)#" "
0 1 0 0 1 0

360. all
  x:1 1 0 1
  &/x
0
  x:1 1 1 1
  &/x
1
  x:0 0 0 0
  &/x
0

361. parity
  x:2 _vs !8
  x
(0 0 0 0 1 1 1 1
 0 0 1 1 0 0 1 1
 0 1 0 1 0 1 0 1)
  (+/x)!2
0 1 1 0 1 0 0 1

362. count of occurrences of x in y
  x:"q"
  y:"quaquaqua"
k)+/x=y
q)sum x=y
3

363. solve quadratic
  qu:{(q%x),(z%q:qq[x;y;z])}
  qq:{-0.5*y+sg[y]*ds[x;y;z]}
  ds:{_sqrt[(y*y)-(4*x*z)]}
  sg:{(x>0)-(x<0)}

  a:1
  b:-1e30
  c:1
  sg[b]
-1
  ds[a;b;c]
1e+030
  qq[a;b;c]
1e+030
  qu[a;b;c]
1e+030 1e-030
  qu[1;-8;15]
5 3.0

364. see 325

365. see 325

366. count of scalars
k)cs:#,//
q)cs:{count(raze/)x}
q)cs:{count raze/[x]}
  cs 1
1
  cs 1 2
2
  cs(1 2;3 4 5)
5
  cs(1 2;(3 4;5))
5
  cs("ab";("cd";"efg"))
7
  cs til 0
0

367. alternating product
  x:1 2 3 4 5
  a:(#x)#1 -1
  a
1 -1 1 -1 1
  */x^a
1.875

368. product
  x:1 2 3 4 5
k)*/x
q)prd x
120

369. alternating sum
  x:1+!10
  x
1 2 3 4 5 6 7 8 9 10
  a:((#x)#1 -1)
  a
1 -1 1 -1 1 -1 1 -1 1 -1
  b:x*a
  +/b
-5
  +/x*(#x)#1 -1
-5

370. count of 1s in Boolean list
  x:1001011b
k)+/x
q)sum x
4

371. scalar from 1-item list
  x:,5
  x
,5
  +/x
5
  a:,"a"
  a
,"a"
  +/a
type error
+/a
^
>  \
  a[0]
"a"

372. sum columns of matrix
  x:1+3 4#!12
  x
(1 2 3 4
 5 6 7 8
 9 10 11 12)
k)+/x
q)sum x
15 18 21 24

373. sum rows of matrix
q)x:1+3 4#til 12
  x
(1 2 3 4
 5 6 7 8
 9 10 11 12)
k)+/'x
q)sum each x
10 26 42

374. sum
  x:1 2 3 4 5
k)+/x
q)sum x
15

375. insert row x in matrix y after row g
  y:4 3#1+!12
  y
(1 2 3
 4 5 6
 7 8 9
 10 11 12)
  x:13 14 15
  g:2
  a:y,,x
  a
(1 2 3
 4 5 6
 7 8 9
 10 11 12
 13 14 15)
  b:<(!#y),g
  b
0 1 2 4 3
  a[b]
(1 2 3
 4 5 6
 7 8 9
 13 14 15
 10 11 12)
  (y,,x)[<(!#y),g]
(1 2 3
 4 5 6
 7 8 9
 13 14 15
 10 11 12)

376. append y at the bottom of matrix x
  x:4 3#1+!12
  x
(1 2 3
 4 5 6
 7 8 9
 10 11 12)
  y:13 14 15
  x,,y
(1 2 3
 4 5 6
 7 8 9
 10 11 12
 13 14 15)

377. fill x to length y with x's last item
  x:"quiz"
  y:9
  a:(!y)&-1+#x
  a
0 1 2 3 3 3 3 3 3
  x[a]
"quizzzzzz"
  x[(!y)&-1+#x]
"quizzzzzz"
or, an alternative way:
  y#x,y#*|x
"quizzzzzz"

378. [omitted]

379. remove leading, multiple and trailing y's
from x
  x:0 0 1 2 0 0 3 4 0 5 0 0 0
  y:0
  a:x=y
  b:~a&1!a
  a
1 1 0 0 1 1 0 0 1 0 1 1 1
  b
0 1 1 1 0 1 1 1 1 1 0 0 0
  x[&b]
0 1 2 0 3 4 0 5
  a[0]_ x[&b]
1 2 0 3 4 0 5

380. change items of x with value y[0] to y[1]
  x:"abcde"[15 _draw 5]
  x
"ddaeecadbbcbedc"
  y:"d "
  @[x;&x=*y;:;*|y]
"  aeeca bbcbe c"

381. invert all but 1st 1 in group of 1s
  x:0 0 1 1 1 0 1 1 0 1
  x>-1 _ 0,x
0 0 1 0 0 0 1 0 0 1
  m381:{x>-1 _ 0,x}
  m381[x]
0 0 1 0 0 0 1 0 0 1

382. insert y in x after index g
  x:1 2 3
  y:10*1+!7
  y
10 20 30 40 50 60 70
  g:3
  ((g+1)#y),x,(g+1)_ y
10 20 30 40 1 2 3 50 60 70

383. pairwise difference
  x:9 3 5 2 0
  --':x
6 -2 3 2

384. drop 1st, postpend 0
  x:3 4 5 6
  1 _ x,0
4 5 6 0

385. drop last, prepend 0
x:3 4 5 6
  -1 _ 0,x
0 3 4 5

386. shift x right y, fill 0
  x:1+!12
  x
1 2 3 4 5 6 7 8 9 10 11 12
  y:3
  @[(-y)!x;!y;:;0]
0 0 0 1 2 3 4 5 6 7 8 9

387. shift x left y, fill 0
  x:1+!12
  x
1 2 3 4 5 6 7 8 9 10 11 12
  y:3
  @[y!x;((#x)-y)+!y;:;0]
4 5 6 7 8 9 10 11 12 0 0 0

388. drop y rows from top of matrix x
  x:6 3#!18
  x
(0 1 2
 3 4 5
 6 7 8
 9 10 11
 12 13 14
 15 16 17)
  y:2
  y _ x
(6 7 8
 9 10 11
 12 13 14
 15 16 17)

389. Playing order of x ranked players
  i:{1+2_sv'+|tt[-_-log2[x]]}
  j:{@[x;&x>y;:;0]}
  k:{j[i[x];x]}
  x:6
  i[x]
1 5 3 7 2 6 4 8
  j[i[x];x]
1 5 3 0 2 6 4 0
  k[x]
1 5 3 0 2 6 4 0

390. Conform table x rows to list y
  f390:{@[((1 0*+/^y)|^x)#0;!#x;:;x]}
  x:3 3#1+!9
  y:1 2 3 4
  f390[x;y]
(1 2 3
 4 5 6
 7 8 9
 0 0 0)

391. Conform table y columns to list y
  x:4 2 # 9
  y:5#8
  a:((0 1*+/^y)|^x)#0
  a
(0 0 0 0 0
 0 0 0 0 0
 0 0 0 0 0
 0 0 0 0 0)
  a[;!(^x)[1]]:x
  a
(9 9 0 0 0
 9 9 0 0 0
 9 9 0 0 0
 9 9 0 0 0)

392. matrix from scalar or vector
  x:4
  ^x
!0
  (1+~#^x),:/x
,,4
  ^(1+~#^x),:/x
1 1
  x:7 8
  ^(1+~#^x),:/x:7 8
1 2

393. see 248

394. [deferred]

395. [deferred]

396. remove columns y from x
  y
((1 2 3 4
  5 6 7 8
  9 10 11 12)
 (13 14 15 16
  17 18 19 20
  21 22 23 24))
  y _di\:\: 0 2
((2 4
  6 8
  10 12)
 (14 16
  18 20
  22 24))

397. see 73

398. diagonals from columns
  x:(1  2  3  4  5
     6  7  8  9 10
    11 12 13 14 15
    16 17 18 19 20
    21 22 23 24 25)
  (-!5)!'x
(1 2 3 4 5
 10 6 7 8 9
 14 15 11 12 13
 18 19 20 16 17
 22 23 24 25 21)

399. columns from diagonals
  x
(1 2 3 4 5
 10 6 7 8 9
 14 15 11 12 13
 18 19 20 16 17
 22 23 24 25 21)
  (!5)!'x
(1 2 3 4 5
 6 7 8 9 10
 11 12 13 14 15
 16 17 18 19 20
 21 22 23 24 25)

400. [deferred]

401. first word in string x
  x:"twas brillig and the slith"
  x?" "
4
  (x?" ")#x
"twas"
  fw:{(x?" ")#x}
  fw x
"twas"

402. see 392

403. [omitted]

404. end points for x fields of length y
  x:5
  y:3
  @[&x*y;(y-1)+y*!x;:;1]
0 0 1 0 0 1 0 0 1 0 0 1 0 0 1

405. start points for x fields of length y
  x:5
  y:3
  @[&x*y;y*!x;:;1]
1 0 0 1 0 0 1 0 0 1 0 0 1 0 0

406. add y to last item of x
  x:1 2 3 4 5
  y:100
  @[x;-1+#x;+;y]
1 2 3 4 105

407. vector length y of x 1s, the rest 0s
  x:5
  y:12
  @[&12;!x;:;1]
1 1 1 1 1 0 0 0 0 0 0 0

408. initial empty row to start matrix of x
columns
   x:15
  ,&x
,0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
  ,1.0*&x
,0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0
  ,x#" "
,"               "

409. [omitted]

410. number of columns in matrix x
  x:2 7#" "
  ^x
2 7
  *|^x
7

411. number of rows in matrix x
  x:2 7#" "
k)#x
q)count x
2

412. see 184

413. omitted

414. ending indices from field lengths
  x:4 7 13 15 20
  (1+*x),-':x
5 3 6 2 5

415. lengths of infixes of 1 in x
  x:0 0 1 1 1 0 0 1 1 1 1 0 1
  a:<':0,x,0
  b:>':0,x,0
  a
0 0 0 0 0 1 0 0 0 0 0 1 0 1
  b
0 0 1 0 0 0 0 1 0 0 0 0 1 0
  &a
5 11 13
  &b
2 7 12
  (&a)-(&b)
3 4 1
  (&<':0,x,0)-&>':0,x,0
3 4 1
  m415:{(&<':0,x,0)-&>':0,x,0}


416. omitted

417. end points of equal infixes
  x:"baackkkegtt"
  (~(1 _ x)=-1 _ x),1
1 0 1 1 0 0 1 1 1 0 1

418. starting indices of equal item infix
  x:"baackkkegtt"
  1,~(1 _ x)=-1 _ x
1 1 0 1 1 0 0 1 1 1 0

419. pairwise ratios
  x:2 10 50 100
  %':x
5 5 2.0

420. see 383

421. deferred

422. see 154

423. lengths from start indicator
  x:1 0 1 0 0 1 0 0 0 1 0
  &x,1
0 2 5 9 11
  -':&x,1
2 3 4 2

424. single blank from multiples
  x:"a b  c   d"
  x[&a|1 _ 1!1,a:~" "=x]
"a b c d"

425. see 380

426. change all multiple infixes of y in x to
single
  x:"bccbceekl"
  y:"c"
  x[&a|-1 _ 1,a:~x=y]
"bcbceekl"

427. deferred

428. see 73

429. matrix with diagonal x
  x:5 9 6 7 2
  (2##x)#,/x,'(2##x)#0
(5 0 0 0 0
 0 9 0 0 0
 0 0 6 0 0
 0 0 0 7 0
 0 0 0 0 2)

430. polynomial derivative
  x:1 2 3 4 5
  -1 _ x*|!#x
4 6 6 4

431. does item differ from next one
  x:"ceefffmeksc"
  (~=':x),1
1 0 1 0 0 1 1 1 1 1 1

432. does item differ from previous one
  x:"ceefffmeksc"
  1,~=':x
1 1 0 1 0 0 1 1 1 1 1

433. replace last item of x with y
  x:"abbccdefcdab"
  y:"t"
  @[x;-1+#x;:;y]
"abbccdefcdat"

434. replace first item of x with y
  x:"abbccdefcdab"
  y:"t"
  @[x;0;:;y]
"tbbccdefcdab"

435. [deferred]

436. [deferred]

437. remove leading zeros
  x:"00002345600345000"
  ((x="0")?0)_ x
"2345600345000"

438. index of 1st 1 following index y in x
x:1 0 0 1 1 0 1 1 0
  y:3
  y+(y _ x)?1
3
  y+((y+1)_ x)?1
3
  (y+1)+((y+1)_ x)?1
4
a more K-like alternative

  &x
0 3 4 6 7
  y<&x
0 0 1 1 1
  (&x)[*&y<&x]
4

439. last 1s in groups of 1s
  x:0 1 1 0 1 1 1 0 0 1
  x>1 _ x,0
0 0 1 0 0 0 1 0 0 1

440. 1st 1 in groups of 1s
  x:0 1 1 0 1 1 1 0 0 1
  x>1 _ x,0
0 0 1 0 0 0 1 0 0 1

441. comma separated list from table
  x:("Swift";"Austen";"Dickens")
  x
("Swift"
 "Austen"
 "Dickens")
  ",",'x
(",Swift"
 ",Austen"
 ",Dickens")
  ,/",",'x
",Swift,Austen,Dickens"
  1 _ ,/",",'x
"Swift,Austen,Dickens"

442. 1st difference
  x:+\1 2 3 4 5
  x
1 3 6 10 15
  -':x
2 3 4 5
  (*x),(-':x)
1 2 3 4 5

443. drop first y columns from matrix x
  x:4 3#!12
  x
(0 1 2
 3 4 5
 6 7 8
 9 10 11)
  y:2
  y _ x
(6 7 8
 9 10 11)

444. drop first y rows from matrix x
x:4 3#!12
  x
(0 1 2
 3 4 5
 6 7 8
 9 10 11)
  y:2
  y _' x
(,2
 ,5
 ,8
 ,11)

445. number of columns in matrix x
  x:4 3#!12
  x
(0 1 2
 3 4 5
 6 7 8
 9 10 11)
  *|^x
3

446. number of rows in matrix x
  x:4 3#!12
  x
(0 1 2
 3 4 5
 6 7 8
 9 10 11)
  #x
4

447. conditional drop of y items from array x
  x:4 3#!12
  x
(0 1 2
 3 4 5
 6 7 8
 9 10 11)
  g:0
  (y*g) _ x
(0 1 2
 3 4 5
 6 7 8
 9 10 11)
  g:1
  (y*g) _ x
(6 7 8
 9 10 11)

448. conditional drop of last item of array x
x:4 3#!12
  x
(0 1 2
 3 4 5
 6 7 8
 9 10 11)
  y:0
  (-y) _ x
(0 1 2
 3 4 5
 6 7 8
 9 10 11)
  y:1
  (-y) _ x
(0 1 2
 3 4 5
 6 7 8)

449. limiting x between l and h, inclusive
  x: 5 6 _draw 100
  x
(58 9 37 84 39 99
 60 30 45 97 77 35
 49 87 82 79 8 30
 46 61 20 51 12 34
 31 51 29 35 17 89)
  l:30
  h:70
  l|h&x
(58 30 37 70 39 70
 60 30 45 70 70 35
 49 70 70 70 30 30
 46 61 30 51 30 34
 31 51 30 35 30 70)

450. arithmetic precision of system in decimals
  log10:{(_log x)%_log 10}
  log10 3
0.47712125471966244
  _ _abs log10 _abs 1-3*%3
0I
This indicates that the precision is infinite (which
isn't true)
and is a consequence of
  3*%3
1.0

451. arithmetic progression from x to y with step
g
  ap:{[x;y;g]x+g*!1+_(y-x)%g}
  ap[3;20;5]
3 8 13 18
  ap[3;-20;-5]
3 -2 -7 -12 -17

452. number of positions in integer x
  dp:{1+(x<0)+_
log10[_abs[x+0=x]]}
  dp 1234
4
  dp -1234
5
  dp 0
1
  dp 1
1
  dp 7
1
  dp 12345678
8

453. round to nearest even integer
  re:{_ x+~1>x!2}
  x:0.9 1 2.5 3.1 -0.2 -1.9
  re x
0 2 2 4 0 -2

454. rounding, but to nearest even integer if
fractional part is 0.5
  rn:{_ x+0.5*~0.5=x!2}
  x:23.6 40.5 3.2 -14.02 3.5 4.5
  rn x
24 40 3 -14 4 4

455. number of digit positions in x
  nd:{1+_ log10(x=0)+x*1 -
10[x<0]}
  x:4 678 -21 -10854
  nd x
1 3 3 6

456. number of digits in nonnegative integer x
  np:{1+_ log10 x+0=x}
  x:0 13 523 16008
  np x
1 2 3 5

457. is x integral
  ii:{x=_ x}
  x:67 -120 3.83 -5.5
  ii x
1 1 0 0

458. [omitted]

459. leading digit of numeric code abbb
  ld:{_ x%1000}
  x:6 _draw 10000
  x
1319 8629 6581 6988 790 9045
  ld x
1 8 6 6 0 9

460. round y to x decimals
  rn:{(10^-x)*_ 0.5+y*10^x}
  y:3.3256789
  x:3
  rn[x;y]
  rn[x;y]
3.326

461. round to nearest hundredth
  rh:{0.01*_0.5+x*100}
  x:3.1414 2.71828 -12.66666
  rh x
3.14 2.72 -12.67

462. round to nearest integer
  ri:{_0.5+x}
  x:4.5 3.21 80.9 -2.4 -9.6
  ri x
5 3 81 -2 -10

463. is x a leap year
  ly:{(+/0=x!/:4 100 400)!2}
  x:1900 1901 1904 2000
  ly x
0 0 1 1

464. framing character matrix x
  x:4 4#"abcdefghijklmnop"
  x
("abcd"
 "efgh"
 "ijkl"
 "mnop")
  +"-",'(+"|",'x,'"|"),'"-"
("------"
 "|abcd|"
 "|efgh|"
 "|ijkl|"
 "|mnop|"
 "------")

465. magnitude of fractional part
  x:6.13 -6.13
_abs[x]!1
0.13 0.13

466. remove every y-th item of x
  x:4+!10
  x
4 5 6 7 8 9 10 11 12 13
  y:3
  !#x
0 1 2 3 4 5 6 7 8 9
  (!#x)!y
0 1 2 0 1 2 0 1 2 0
  ~0=(!#x)!y
0 1 1 0 1 1 0 1 1 0
  &~0=(!#x)!y
1 2 4 5 7 8
  x[&~0=(!#x)!y]
5 6 8 9 11 12

467. select every y-th item of y
  x:4+!10
  x
4 5 6 7 8 9 10 11 12 13
  y:3
  !#x
0 1 2 3 4 5 6 7 8 9
  (!#x)!y
0 1 2 0 1 2 0 1 2 0
  0=(!#x)!y
1 0 0 1 0 0 1 0 0 1
  &0=(!#x)!y
0 3 6 9
  x[&0=(!#x)!y]
4 7 10 13

468. see dv in 164

469. remove every second item
  x:"abcdefghijklmn"
  (!#x)!2
0 1 0 1 0 1 0 1 0 1 0 1 0 1
  &(!#x)!2
1 3 5 7 9 11 13
  x[&(!#x)!2]
"bdfhjln"

470. items of x divisible by y
  x:10 _draw 100
  x
95 33 64 10 78 1 47 20 92 95
  y:4
  x!y
3 1 0 2 2 1 3 0 0 3
  0=x!y
0 0 1 0 0 0 0 1 1 0
  &0=x!y
2 7 8
  x[&0=x!y]
64 20 92

471. index of first occurrence of g in x
(circularly) after y
x: 15 _draw 10
  x
6 6 0 0 8 9 8 1 0 2 9 4 6 3 5
  g:0 6 5
  y:9
  (y+(y!x)?g)!#x
9
  (y+(y!x)?/:g)!#x
2 12 14

472. omitted

473. is x even
  x:1 2 3 4 5
  ~x!2
0 1 0 1 0

474. round x to zero if magnitude less than y
  x:1e-4 -1e-8 -1e-12 1e-16
  x*~y>_abs x
0.0001 -1e-008 0 0

475. increase absolute value without sign change
  x:0 -1 2 -3 4 -5
  sg:{(x>0)-(x<0)}
  y:10
  (sg x)*y+_abs x  /problem with
x=0
0 -11 12 -13 14 -15.0

476. fractional part with sign
  x:0.2 2.3 -0.2 -1.8 0 5 -7
  (sg x)*(_abs x)!1
0.2 0.3 -0.2 -0.8 0 0 0

477. square x retaining sign
  x:0 -1 2 -3 4
  x*_abs x
0 -1 4 -9 16.0

478. fractional part
  x:0 1 -2 3.4 -5.6 -6.1
  x!1
0 0 0 0.4 0.4 0.9

479. last part of abbb
  x:1234 5678 9012 345 6789
  x!1000
234 678 12 345 789

480. replace items of x in y by 0
  x:1 2 3 4 5
  y:2 4
  x _lin y
0 1 0 1 0
  x*~x _lin y
1 0 3 0 5

481.replace items of x not in y by 0
  x:1 2 3 4 5
  y:2 4
  x _lin y
0 1 0 1 0
  x*x _lin y
0 2 0 4 0

482. merge x any under control of g
  x:1 2 3 4 5
  y:100 200 300 400 500
  g:1 0 0 1 1 0 1 0 0 1
  (x,y)[<<g]
100 1 2 200 300 3 400 4 5 500

483. see 481

484. right to left scan
  x:1 2 3 4 5
  |+\|x
15 14 12 9 5

485. append empty row on matrix
  x:("ab";"cd";"ef")
  x
("ab"
 "cd"
 "ef")
  x,,(*|^x)#" "
("ab"
 "cd"
 "ef"
 "  ")

486. [omitted]

487. insert empty row in x after row y
  x:("ab";"cd";"ef")
  x
("ab"
 "cd"
 "ef")
  y:1
  a:x,,(*|^x)#" "
  a
("ab"
 "cd"
 "ef"
 "  ")
  b:<(!#x),y
  b
0 1 3 2
  a[b]
  a[b]
("ab"
 "cd"
 "  "
 "ef")
  (x,,(*|^x)#" ")[<(!#x),y]
("ab"
 "cd"
 "  "
 "ef")

488. omitted

489. make string y into table guided by marker x
  y:"eachwordinarow"
  x:1 0 0 0 1 0 0 0 1 0 1 1 0 0
  a:&x
  a
0 4 8 10 11
  b:a _ y
  b
("each"
 "word"
 "in"
 ,"a"
 "row")
(&x)_ y
("each"
 "word"
 "in"
 ,"a"
 "row")

490. insert spaces in text
  x:"wider"
  a:+,x
  a
(,"w"
 ,"i"
 ,"d"
 ,"e"
 ,"r")
  b:a,'" "
  b
("w "
 "i "
 "d "
 "e "
 "r ")
  ,/b
"w i d e r "
  ,/(+,x),'" "
"w i d e r "

491. or-reduce infixes of y marked by x
  x:1 0 0 1 0 0 0 1 0 0 0 0
  y:0 0 0 0 1 0 0 0 0 0 1 0
  a:(&x)_ y
  a
(0 0 0
 0 1 0 0
 0 0 0 1 0)
  |/'a
0 1 1

492. and-reduce infixes of y marked by x
x:1 0 0 1 0 0 0 1 0 0 0 0
  y:0 1 1 1 1 1 1 1 1 1 1 0
  (&x)_ y
(0 1 1
 1 1 1 1
 1 1 1 1 0)
  &/'(&x)_ y
0 1 0

493. choose x or y depending on boolean g
  x:"abcdef"
  y:"xyz"
  g:0
  :[g;x;y]
"xyz"
  g:1
  :[g;x;y]
"abcdef"

494. see 424

495. indices of all occurrences of y in x
  x:"abcdefgab"
  y:"afc*"
  x _lin y
1 0 1 0 0 1 0 1 0
  &x _lin y
0 2 5 7

496. remove punctuation characters
  x:"oh! no, stop it. you will?"
  y:",;:.!?"
  x _dvl y
"oh no stop it you will"

497. set union
  x:"12345"
  y:"4567890"
  y,x[&~x _lin y]
"4567890123"

498. set difference
  x:"12345"
  y:"4567890"
  x _dvl y
"123"

499. rows of y starting with item of x
  x:("abcd";"efgh";"ijkl";"mnop")
  x
("abcd"
 "efgh"
 "ijkl"
 "mnop")
  y:"ai"
  x[;0] _lin y
1 0 1 0
  &x[;0] _lin y
0 2
  x[&x[;0] _lin y]
("abcd"
 "ijkl")

500. set intersection
  x:"abcdefghijxyz"
  y:"yacqwopzbx"
  x[&x _lin y]
"abcxyz"

501.see 154

502. deferred

503. indices of all occurrences of y in x
  x:"abcdeabc"
  y:"a"
  &x=y
0 5

504. replace items of y satisfying x with g
  x:1 0 0 0 1 0 1 1 0 1
  y:"abcdefghij"
  g:" "
  @[y;&x;:;g]
" bcd f  i "

505. see 154

506. see 41

507. insert blank in y after mark in x
  x:1 0 0 0 0 1 0 0
  y:"abcdefgh"
  x#\:" "
(," "
 ""
 ""
 ""
 ""
 ," "
 ""
 "")
  y,' x#\:" "
("a "
 ,"b"
 ,"c"
 ,"d"
 ,"e"
 "f "
 ,"g"
 ,"h")
  ,/ y,' x#\:" "
"a bcdef gh"

508. conditional text
  x:0
  ,/((~x)#'"in"),"correct"
"incorrect"
  x:1
  ,/((~x)#'"in"),"correct"
"correct"

509. remove y from x
  x:"abcdeabc"
  y:"a"
  x _dv y
"bcdebc"

510. remove blanks
  x:" bcde bc"
  x _dv " "
"bcdebc"

511. apply f over all of x
  x:2 3 4#1+!24
  x
((1 2 3 4
  5 6 7 8
  9 10 11 12)
 (13 14 15 16
  17 18 19 20
  21 22 23 24))
  +//x
300
  ao:{[f;x]f//x}
  ao[+;x]
300
  ao[*;1.0*x]
6.204484e+023
  ao[+;-x]
-300

512. select items of x according to markers in y
  x:2 3 4#1+!24
  x
((1 2 3 4
  5 6 7 8
  9 10 11 12)
 (13 14 15 16
  17 18 19 20
  21 22 23 24))
  y:1 0 0 1
  x[;;&y]
((1 4
  5 8
  9 12)
 (13 16
  17 20
  21 24))

513. empty matrix
  x:,!0
  x
,!0
  ^x
1 0

514. apply to dimension 1 function defined on
dimension 0
  x:3 4#1+!12
  x
(1 2 3 4
 5 6 7 8
 9 10 11 12)
  +/x
15 18 21 24
  +/'x
10 26 42

515. deferred

516. multiply each column of x by y
  x:(1 2 3 4 5 6
 7 8 9 10 11 12)
  y:10 100
  x*y
(10 20 30 40 50 60
 700 800 900 1000 1100 1200)
  y*x
(10 20 30 40 50 60
 700 800 900 1000 1100 1200)

517. deferred

518. transpose matrix x on condition y
  x:2 3#!6
  x
(0 1 2
 3 4 5)
  y:1
  y +:/x
(0 3
 1 4
 2 5)
  y:0
  y +:/x
(0 1 2
 3 4 5)

519. see 85

520. see 86

521. matrix with x columns y
  x:4
  y:"abc"
  x#'y
("aaaa"
 "bbbb"
 "cccc")

522. see 80

523. deferred

524. deferred

525. main diagonal
  x:(1 2 3 4
    5 6 7 8
    9 10 11 12)
  y:2#'!#x
  y
(0 0
 1 1
 2 2)
  x ./: y
1 6 11

526. see 525

527. transpose planes of three-dimensional x
  x:2 2 2#!8
  x
((0 1
  2 3)
 (4 5
  6 7))
  +:'x
((0 2
  1 3)
 (4 6
  5 7))

528. vector (cross) product
  x:2 8 5 6 3 1 7 7 10 4
  y:6 9 1 1 6 7 1 4 1 5
  ((1!x)*-1!y)-(-1!x)*1!y
4 28 46 -27 -41 39 45 3 -19 -58

529. markers for x at y
  x:"abcdefghijklmn"
  y:3 7 9
  @[&#x;y;:;1]
0 0 0 1 0 0 0 1 0 1 0 0 0 0

530. index of last occurrence of y in x
  x:10 _draw 5
  x
3 0 4 3 1 4 4 3 3 1
  y:4
  *|&x=y
6
  y:3
  *|&x=y
8

531. replace each item of y with index of its last
occurrence
  x:"aabbbcccc"
  y:x,"ddd"
  x
"aabbbcccc"
  y
"aabbbccccddd"
  (|x)?/:y
7 7 4 4 4 0 0 0 0 9 9 9
  #x
9
  (#x)-(|x)?/:y
2 2 5 5 5 9 9 9 9 0 0 0
  0|-1+(#x)-(|x)?/:y
1 1 4 4 4 8 8 8 8 0 0 0

532. index of last occurrence of y in x, counted
from the rear
  x:8 4 9 1 5 7
  y:8 2 3 4 9 5 7 1 10 6 8 2
  (|x)?/:y
5 6 6 4 3 1 0 2 6 6 5 6

533. reverse x on condition y
  x:1 2 3 4 5
  y:0
  y |:/x
1 2 3 4 5
  y:1
  y |:/x
5 4 3 2 1

534. see 203

535. avoiding parentheses using reverse
  x:1 2 3 4 5
  (#x),1
5 1
  |1,#x
5 1

536. rotate rows left
x:3 4#1+!12
  x
(1 2 3 4
 5 6 7 8
 9 10 11 12)
  1!'x
(2 3 4 1
 6 7 8 5
 10 11 12 9)

537. rotate rows right
  x:3 4#1+!12
  x
(1 2 3 4
 5 6 7 8
 9 10 11 12)
  -1!'x
(4 1 2 3
 8 5 6 7
 12 9 10 11)

538. insert 0 in list of ones x after indices y
  x:1 1 1 1 1 1 1 1 1 1
  y
1 3 7
  +,x
(,1
 ,1
 ,1
 ,1
 ,1
 ,1
 ,1
 ,1
 ,1
 ,1)
  @[+,x;y;{x,0}]
(,1
 1 0
 ,1
 1 0
 ,1
 ,1
 ,1
 1 0
 ,1
 ,1)
  ,/@[+,x;y;{x,0}]
1 1 0 1 1 0 1 1 1 1 0 1 1

539. Boolean vector of length y with zeros in
locations x
  x:2 3 4 8
  y:10
method A
  ~(!y) _lin x
1 1 0 0 0 1 1 1 0 1
method B
~@[&y;x;:;1]
1 1 0 0 0 1 1 1 0 1

540. markers in Boolean vector of length x at
indices y
x:10
  y:1 3 7
method A
  (!x) _lin y
0 1 0 1 0 0 0 1 0 0
method B
  @[&x;y;:;1]
0 1 0 1 0 0 0 1 0 0

541. omitted

542. omitted

543. see 540

544. do x and y match
  x~y

545. zero items of y not in x
  y: 2 3 4 5 6 7 8 9 10 11
  x:2 3 5 7 11
  y _lin x
1 1 0 1 0 1 0 0 0 1
  y*y _lin x
2 3 0 5 0 7 0 0 0 11

546. is count of atoms 1 (uses cs from 366)
  cs:({#,//x}
  co:{1=cs[x]}
  co[35]
1
  co[,35]
1
  co[1 1#35]
1
  co[1 1 1#35]
1
  co[1 2]
0
  co[!0]
0

547. is x vector
  iv:{1=#^x}
  iv[0]
0
  iv[1 2]
1
  iv[(1;2)]
1
  iv[(1 2;3 4)]
0
  iv[2 3#!6]
0
  iv[!0]
1

548. test if empty
  ie:{0 _in ^x}
  ie 7
0
  ie 8 9
0
  ie 2 3#6
0
  ie (1 0#5)
1

549. alphabetic comparison (depends on storage
values)
  "a"<"b"
1
  "a">"b"
0
  _ic";"
59
  _ic"/"
47
  ";"<"/"
0

550. see 37

551. index of first differing item of x and y
  x:3 1 4 1 6 0
  y:3 1 4 1 5 9
  (~x=y)?1
4

552. which items of x are not in y
  x:2 3 4 5 6 7 8 9 10 11
  y:2 3 5 7 11
  ~x _lin y
0 0 1 0 1 0 1 1 1 0

553. see 37

554. select from g based on index of x in y
  g:("William Shakespeare"
   "John Milton"
   "Jonathan Swift"
   "Jane Austen"
   "John Keats"
   "Charles Dickens")
  y:1564 1608 1667 1775 1795 1812
  x:1775
  g y?x
"Jane Austen"

555. all axes of rectangular array x
  x:2 2 2 2#!16
  !#^x
0 1 2 3

556. all indices of vector x
  x:2 2 2 2#!16
  !#^x
0 1 2 3

557. arithmetic progression of y numbers from x
with step g
  x:5
  y:8
  g:100
  x+g*!y
5 105 205 305 405 505 605 705
  ap:{[x;g;y]x+g*!y}
  ap[x;g;y]
5 105 205 305 405 505 605 705

558. consecutive integers from x to y
  ci:{x+!1+y-x}
  ci[5;10]
5 6 7 8 9 10

559. index of first marker in Boolean x
  x:0 0 1 0 1 0 0 1 1 0
  x?1
2

560. omitted

561. numeric code from character
  x:" aA0"
  _ic[x]
32 97 65 48

562. index of y in x
  x:" abcdefgh"
  y:"faded head"
  x?y
6 1 4 5 4 0 8 5 1 4
  y:"deaf adder"
  x?y
4 5 1 6 0 1 4 4 5 9

563. empty vector
  !0
!0
  ^!0
,0
  ""
""
  ^""
,0

564. is x within range ( y[0],y[1] )
  ci:{(y[0]<x)&(x<y[1])}
  y:3 8
  x:5
  ci[x;y]
1
  x:3
  ci[x;y]
0
  x:2
  ci[x;y]
0
  x:8
  ci[x;y]
0
  x:9
  ci[x;y]
0

565. is x within range [ y[0],y[1] ]
  oi:{(~y[0]>x)&(~x>y[1])}
  y:3 8
  x:5
  oi[x;y]
1
  x:3
  oi[x;y]
1
  x:2
  oi[x;y]
0
  x:8
  oi[x;y]
1
  x:9
  oi[x;y]
0

566. zero all items of Boolean x
  x:0 1 0 1 1 0 0 1 1 1 0
  0&x
0 0 0 0 0 0 0 0 0 0 0

567. select x or y depending on g
  x:`hot `white `short `old
  y:`cold `black `tall `young
  g:1 0 0 1
  x,'y
(`hot `cold
 `white `black
 `short `tall
 `old `young)
  (!#g),'g
(0 1
 1 0
 2 0
 3 1)
  (x,'y) ./: (!#g),'g
`cold `white `short `young

568. omitted

569. change y to one if x
  y:10 5 7 12 20.0
  x:0 1 0 1 1
  y^~x
10 1 7 1 1.0
alternatively
  @[y;&x;:;1]
10 1 7 1 1

570. x implies y
  x:0 1 0 1
  y:0 0 1 1
  ~x>y
1 0 1 1

571. x but not y
x:0 1 0 1
  y:0 0 1 1
  x>y
0 1 0 0

572. division by 0
  dz:{(~0=x)*y%x+x=0}
  y:10 15 -20
  x:2 0 0
  y%x
5 0i -0i
  dz[x;y]
5 0 0.0

573. exclusive or
  x:0 0 1 1
  y:0 1 0 1
  ~x=y
0 1 1 0

574. y where x is 0
  x:0 7 8 0 2
  y:10 4 6 7 3
  x+y*x=0
10 7 8 7 2

575. Kronecker delta of x and y
  x:0 0 1 1
  y:0 1 0 1
  x=y
1 0 0 1

576. append y items g before each item of x
  x:1 3 5
  y:2
  g:10
  y#g
10 10
  (y#g),/:x
(10 10 1
 10 10 3
 10 10 5)
  ,/(y#g),/:x
10 10 1 10 10 3 10 10 5

577. append y items g after each item of x
  x:1 3 5
  y:2
  g:10
  ,/x,\:y#g
1 10 10 3 10 10 5 10 10

578. merge items from x and y alternately
  x:1 3 5 7
  y:2 4 6 8
  ,/x,'y
1 2 3 4 5 6 7 8

579. variable length lines
  x:"by and by"
  y:"God caught his eye"
  ,(x;y)
,("by and by"
  "God caught his eye")
580. see 490

581. insert y after each item of x
  x:"abc"
  y:"d"
  ,/x,'y
"adbdcd"

582. see 197

583. array and its negative
  x:1 -3 5
  x,'-x
(1 -1
 -3 3
 5 -5)

584. omitted

585. omitted

586. omitted

587. first column as a matrix
  x:(0 1 2 3
 4 5 6 7
 8 9 10 11)
  x[;,0]
(,0
 ,4
 ,8)

588. 2-row matrix from two vectors
  x:"abcd"
  y:"efgh"
  (,x),(,y)
("abcd"
 "efgh")

589. 2-column matrix from two vectors
  x:"abcd"
  y:"efgh"
  x,'y
("ae"
 "bf"
 "cg"
 "dh")

590. increasing rank of y to rank of x
  x:("abcd";"efgh")
  x
("abcd"
 "efgh")
  y:"ijkl"
  #^x
2
  #^y
1
  #^,y
2
  ((#^x)-#^y),:/y
,"ijkl"

591. reshape vector x into 2-column matrix
  x:"abcdefgh"
  ((_ 0.5*#x),2)#x
("ab"
 "cd"
 "ef"
 "gh")

592. vector from array
  x:2 1 2 1 2 1#!8
  ^x
2 1 2 1 2 1
  ,//x
0 1 2 3 4 5 6 7
  ^,//x
,8

593. matrix of y rows, each x
  x:"abcd"
  y:3
  y#,x
("abcd"
 "abcd"
 "abcd")

594. see 203

595. one-row matrix from vector
  x:2 3 5 7 11
  x
2 3 5 7 11
  ^x
,5
  ,x
,2 3 5 7 11
  ^,x
1 5

596. see 366

597. omitted

598. omitted

599. number of columns in array x
  x:1 1 1 1 1 678#0
  ^x
1 1 1 1 1 678
  *|^x
678

600. number of columns in matrix x
  x:3 19#0
  ^x
3 19
  (^x)[1]
19

601. number of rows in matrix x
  x:17 2#0
  #x
17

602. choosing according to sign
  sg:{(x>0)-(x<0)}
  sg -4.5 0 6.78
-1 0 1
  y:"-0+"
  x:-54
  y[1+sg[x]]
"-"
  x:0
  y[1+sg[x]]
"0"
  x:1234.5
  y[1+sg[x]]
"+"

603. conditional change of sign
q)y:1+til 6
  y
1 2 3 4 5 6
  x:0 1 0 1 1 0
  y*1 -1 x
1 -2 3 -4 -5 6

604. omitted

605. indexing plotting characters with Boolean
index
  x:~3 6 5 7 2<\:1+!7
  x
(1 1 1 0 0 0 0
 1 1 1 1 1 1 0
 1 1 1 1 1 0 0
 1 1 1 1 1 1 1
 1 1 0 0 0 0 0)
  " *"[x]
("***    "
 "****** "
 "*****  "
 "*******"
 "**     ")

606. omitted

607. vector from column of matrix
  x:3 4#!12
  x
(0 1 2 3
 4 5 6 7
 8 9 10 11)
  x[;0]
0 4 8

608. zeroing an array
  x:1 2 3 4
  x
1 2 3 4
  x[]:0
  x
0 0 0 0
q)x:2 3#til 6
  x
(0 1 2
 3 4 5)
  x[;]:0
  x
(0 0 0
 0 0 0)
  x:9
  x
9
  x:0
  x
0

609. omitted

610. y cyclic repetitions of vector x
  x:"abcd"
  y:3
  (y*#x)#x
"abcdabcdabcd"

611. multiply each row of x by vector y
x:3 4#1+!12
  x
(1 2 3 4
 5 6 7 8
 9 10 11 12)
  y:1 10 100 10000
  x*\:y
(1 20 300 40000
 5 60 700 80000
 9 100 1100 120000)

612. rank of array y (number of dimensions)
  x:2 1 2 1 3 1 4#0
  #^x
7
  #^9
0
  #^7 8 9
1
  #^(1 2 3;4 5 6)
2

613. see 441

614. array with shape of y and x as its rows
  y:3 4#!12
  y
(0 1 2 3
 4 5 6 7
 8 9 10 11)
  x:"abcd"
  (^y)#x
("abcd"
 "abcd"
 "abcd")

615. first atom in x
  x:2 2 2 2#!8
  x
(((0 1
   2 3)
  (4 5
   6 7))
 ((0 1
   2 3)
  (4 5
   6 7)))
  *//x
0

616. scalar from one-item vector
  x:,8
  x
,8
  ""#x
8
  x[0]
8
  *x
8

617. omitted

618. deferred

619. deferred

620. omitted

621. see 583

622. retain value of items marked by y, zero
others
  x:3 7 15 1 292
  y:1 0 1 1 0
  x*y
3 0 15 1 0
623. conditional change of sign
  x:-9
  y:0
  x*-1^y
-9.0
  y:1
  x*-1^y
9.0

624. zero numerical array
  x:2 3#99
  x
(99 99 99
 99 99 99)
  x*0
(0 0 0
 0 0 0)

625. omitted

626. omitted

627. omitted

628. omitted

629. error to stop execution
  &`

630. omitted

631. omitted








1001. payback
cumulative accumulation factors
(see Zark APL Tutor News 1998 Quarter 2)
caf:{[W;R]*\(#W)#1+R}
pay:{[B;T;R;W]C*B-+\W%(#W)#T _
1,C:caf[W;R]}

The version pay2 replaces T by END, and
permits END to be any value between 0 and 1.
pay2:{[B;END;R;W]CPA:*\A:1+R
      CPA*B-+\W%CPA%A*1-END}

B initial balance
T time of withdrawal: 0 start of period, 1 end
R interest rate per period
W withdrawal amount

B:1000
T:0
R:0.05
W:200 300 400 200

  pay[B;T;.R;W]
840 567 175.35 -25.8825
  T:1
  pay[B;T;.R;W]
850 592.5 222.125 33.23125
  R:0.05 0.04 0.06 0.05
  pay[B;T;R;W]
840 561.6 171.296 -30.1392
  T:1
  pay[B;T;R;W]
850 584 219.04 29.992

1002. round summands
ensure sum of rounded summands matches round
of sum
f:{y%:x
 i:_ y
 x*@[i;{(_.5+/x)#>x}[y-i];+;1]}

y:42.35 38.45 19.20
  _.5++/y
100
  _.5+y
42 38 19
  +/_.5+y
99
  x:1
  z:f[x;y]
  z
42 39 19
  +/z
100

  y:42.65 37.60 19.75
  _.5++/y
100
  _.5+y
43 38 20

  +/_.5+y
101
  z:f[x;y]
  z
43 37 20
  +/z
100

1003. maximum sum of infixes
  f:{|/0(0|+)\x}
  x:-100 2 3 4 -100 6 7 8 9 -100
  f x
30

1004. range union
i:(1 3;8 10;11 12;2 4)

/ given ordered (lefts;rights)
/ interval 0 and where left is greater than 1+ max
previous right
f:{(x i;1!y i:0,&x>1+y:-1!|\y)}

+f .+{x@<x}i /flip f apply flip sort i

(1 4;8 12)

1005. pointer chasing
For r a primitive root of prime p, the additive list
formed by (r*!p)!p has an interesting property,
first discussed by August Crelle in the early 19th
century. For example, if we take such a list for
the primitive root 3 of 7:

  a:(3*!7)!7
/ list of successive sums of 3, starting from 0,
mod 7:
  a
0 3 6 2 5 1 4

then if we treat the items of this list as pointers,
and write

  a\1
1 3 2 6 4 5

we find that the new list is the successive powers
of 3, mod 7.

1006. partitions of y with no part less than  x
  part:{t:x _!1+_ y%2
       (,/t,''t _f'y-t),y}
  part[3;10]
(3 3 4
 3 7
 4 6
 5 5
 10)
  part[1;6]
(1 1 1 1 1 1
 1 1 1 1 2
 1 1 1 3
 1 1 2 2
 1 1 4
 1 2 3
 1 5
 2 2 2
 2 4
 3 3
 6)
  #:'part[1]'1+!10
1 2 3 5 7 11 15 22 30 42

1007. Pascal's triangle
  pt:{+':0,x,0}
  4 pt\1
(1
 1 1
 1 2 1
 1 3 3 1
 1 4 6 4 1)
  pt pt pt pt 1
1 4 6 4 1
  4 pt/1
1 4 6 4 1

1008. Polygon area
  area: 0.5*+/{-/y*|x}':

The dyad {-/y*|x} yields the determinant of
a 2-by-2 matrix. The dyad area yields the area
of a polygon whose x-y coordinates are, in order,
the rows of a 2-column matrix, where the last
row is the same as the first row.

  x:(7 2;10 5;6 8;3 6;4 3;7 2)
  area x
24.5

1009. Great circle distance
   gcd:{_cos?(*/_sin x)+(*/_cos x)*_cos[-/y]}
The great circle distance in radians between two
points on a sphere whose latitudes in radians are
in x and longitudes in radians are in y.

1010. Nautical miles from radians
  nmr:(180*60%3.141592653589798238)*

1011. Degrees from degrees and minutes
  dfdm:{+/x%1 60}

1012. Fibonacci numbers
  fn:{x{x,+/-2#x}/0 1}
  fn:{x(|+\)\1 1.0}

1013. Tree from depth;value
  tdv:{[d;v](1#v),(c _ d-1)_f'(c:&1=d)_ v}

1014. Depth from tree
  dt:{0,/1+_f'1_ x}

1015. Value from tree
  vt:{(1#x),/_f'1_ x}

  d:0 1 2 2 1 1
  v:0 1 2 3 4 5
  t:tdv[d;v]
  t
(0
 (1
  ,2
  ,3)
 ,4
 ,5)
  dt t
0 1 2 2 1 1
  vt t
0 1 2 3 4 5

These 3 recursions stop when they run out of
data
