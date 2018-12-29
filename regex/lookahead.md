---
title: 'Regex lookahead/lookbehind'
---
Lookahead
```
/a(?=b)/       matches a d only if is followed by r, but r will not be part of the overall regex match
'ab' — only 'a' is a result of a match
'ac'  won't match
```

Lookbehind
```
(?<=a)b
'ab' — only 'b' is a result of a match
'cb' won't match
```
