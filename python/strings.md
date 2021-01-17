---
title: 'Python strings'
---

List of chars
```python
>>> list('string')
['s', 't', 'r', 'i', 'n', 'g']
```

String interpolation
```python
for i, char in enumerate('string'):
    print(f'{i}:{char}')
```

Regex
```python
import re

match = re.search("aho.*y", 'mahogany')
# None if no match

match.group()
# 'ahogany' - the part that matched the regex
match.span()
# (1, 8) - start and finish

edited = re.sub("c[ab]+", "samp", 'cable')
# 'sample'
```
