---
title: 'Python debugger'
---
Enter debugger
```python
import code
...
code.interact(local=dict(globals(), **locals()))
```
