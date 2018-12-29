---
title: 'List comprehensions'
---
Test array
```python
>>> arr = [0, 5, 10, 50, 100]
```

Create a new list with the values doubled
```python
>>> [x*2 for x in arr]
[-8, -4, 0, 4, 8]
```

Filter the list
```python
>>> [x for x in arr if x > 10]
[50, 100]
```

Apply a function to each element
```python
>>> [divmod(x, 20) for x in arr]
[(0, 0), (0, 5), (0, 10), (2, 10), (5, 0)]
```
