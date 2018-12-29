---
title: 'List colon (:) syntax'
---

Obscure colon syntax for working with lists
```python
>>> a = [1, 2, 3, 4, 5]
```

Slice `list[start:end:step]`
```python
>>> a[1:]
[2, 3, 4, 5]

>>> a[1:-1]
[2, 3, 4]

>>> a[1:-1:2]
[2, 4]
```

Reverse
```python
>>> a[::-1]
[5, 4, 3, 2, 1]

>>> a[:0:-1]
[5, 4, 3, 2]
```
