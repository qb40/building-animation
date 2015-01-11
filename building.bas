'½ ¼ » º ¹ ¸ · ¶ µ ´ ³ ¾ ¿ À Á Â Ã Ä Å Æ Ç È É Ê Ë Ì Í Î Ï Ð Ñ Ò Ó Ô Õ Ö ×
'$DYNAMIC
DECLARE FUNCTION rndobj$ (l)
DECLARE FUNCTION nospc$ (a$)


CLS
SCREEN 12
COLOR 15
PRINT "Building Animation"
COLOR 7
PRINT "------------------"
PRINT

'prepare
DIM obj$(200)
FOR i = 1 TO 200
obj$(i) = rndobj$(70)
NEXT

'limit screen range
VIEW SCREEN (50, 100)-(600, 450)

'display objects
FOR i = 1 TO 198
k$ = INKEY$
a1$ = obj$(i)
a2$ = obj$(i + 1)
a3$ = obj$(i + 2)

px1 = INT(200 * RND) + 200
py1 = INT(200 * RND) + 100

'draw object with varying scales
FOR j = 1 TO 40
k$ = INKEY$
IF k$ = CHR$(27) THEN EXIT FOR
PSET (px1, py1)
DRAW "S" + STR$(j)
DRAW a1$
SOUND 21000, 1
NEXT

CLS
IF k$ = CHR$(27) THEN EXIT FOR
NEXT

'end
COLOR 7
SCREEN 1
SYSTEM

REM $STATIC
FUNCTION nospc$ (a$)
ad$ = ""
FOR i = 1 TO LEN(a$)
d$ = MID$(a$, i, 1)
IF d$ <> " " THEN ad$ = ad$ + d$
NEXT
nospc$ = ad$
END FUNCTION

FUNCTION rndobj$ (l)
a$ = ""
FOR i = 1 TO l

vl = INT(11 * RND) + 1
SELECT CASE vl
CASE 2
k$ = "U" + STR$(INT(20 * RND))
CASE 3
k$ = "D" + STR$(INT(20 * RND))
CASE 4
k$ = "L" + STR$(INT(20 * RND))
CASE 5
k$ = "R" + STR$(INT(20 * RND))
CASE 6
k$ = "E" + STR$(INT(20 * RND))
CASE 7
k$ = "F" + STR$(INT(20 * RND))
CASE 8
k$ = "G" + STR$(INT(20 * RND))
CASE 9
k$ = "H" + STR$(INT(20 * RND))
CASE 10
k$ = "C" + STR$(INT(15 * RND))
CASE 11
k$ = "A" + STR$(INT(3 * RND))
CASE 12
k$ = "TA" + STR$(INT(360 * RND))
CASE ELSE
END SELECT
a$ = a$ + nospc$(k$)
NEXT
rndobj$ = a$
END FUNCTION

