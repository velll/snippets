---
title: 'Python collections: lists'
---

```python
list = [1, 13, 34]
```

# Add

Add elements to the list (mutate)
```python
list.append(100)
# [1, 13, 34, 100]

list.append([100, 200])
# [1, 13, 34, [100, 200]]

list.extend([100, 200])
# [1, 13, 34, 100, 200]
```

Create a new list with new elements
```python
list + [100, 200]
# [1, 13, 34, 100, 200]

[*list, 100, 200]
# [1, 13, 34, 100, 200]
```

# Remove

```python
del list[0]
# [13, 34].
# Raises 'index out of range' if index does not exist in the list

list.remove(34)
# [1, 13]
# Raises 'x not in list' if the value does not exist in the list

popped = list.pop(2)
# [1, 13]
# Pops value at index out of the list, returns the value

popped = list.pop()
# Pops last argument (stack behaviour)
```
