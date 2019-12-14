---
title: 'Vim commands'
---
Exit
```
:q
```

Exit without saving
```
:q!
```

Exit with saving
```
:wq
```

Modes
- `i` — insert
- `v` — visual

Editing
- `y` — copy
- `p` — paste
- `c` — cut
- `d` — delete

- `yy` - copy current line
- `cc` — cut current line
- `dd` — delete current line

- `y 5 <arrow_down>` — copy 5 rows down starting from current
- `c 10 <arrow_up>` — cut 10 rows up staring from current
- `d 50 <arrow_down>` — delete 50 rows down starting from current

Line numbers
- `:set number` — on
- `:set nonumber` — off
