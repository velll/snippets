---
title: 'Python built-in collection functions'
---
Iterate over a list
```python
for item in [1, 2, 3]:
    print item
```

Length/size/count
```python
len([1, 2, 3])
```

Map. Keep in mind the result of map is Iterable
```python
fun = lambda x: x * 2
map(fun, [1,2,3])
```

Filter. Returns a filter object
```python
even = lambda x: x%2 == 0
filter(even, [1,2,3])
```
