---
title: 'Looping through collections'
---

## Lists
Each:
```python
for item in collection:
    process(item)
```

Back to front:
```python
for item in reversed(collection):
    process(item)
```

With index
```python
for index, item in enumerate(collection):
    process(index, item)
```

Map (returns map object — 'listify' with `list(mapObject)`):
```python
map(lambda x: x * 2, numbers)
```
```python
def process(number):
    return number * 2

map(process, numbers)
```

Using list comprehensions as a kind of a `map()`.
```python
[x * 2 for x in [1, 2, 3, 4]]
```

# Sets
Each key:
```python
for key in {'height', 'weight'}:
    process(key)
```


# Dicts

Each key:
```python
for key in {'height': 100, 'width': 200}:
    process(key)
```

Each value:
```python
for value in {'height': 100, 'width': 200}.values():
    process(value)
```

Each key/value:
```python
for key, value in {'height': 100, 'width': 200}.items():
    process(key, value)
```

# Strings

Each char:
```python
for char in 'string':
     process(char)
```

List of chars
```python
>>> list('string')
['s', 't', 'r', 'i', 'n', 'g']
```
