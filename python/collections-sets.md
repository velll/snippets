---
title: 'Python collections: sets'
---
```python
numericSet = {1, 13, 34}
```

# Add

Add elements to the list (mutate)
```python
numericSet.add(100)
# {1, 13, 34, 100}
```
Add multiple (`update` accepts iterables)
```python
list.update([100, 200])
list.update({100, 200})
# {1, 13, 34, 100, 200}
```

Create a new set with new elements
```python
{*numericSet, 100, 200}
# {1, 13, 34, 100, 200}
```

# Check if exists

```python
if 34 in numericSet:
    # whatever
```

# Remove

```python
numericSet.remove(34)
# {1, 13}
# Raises KeyError if the value does not exist in the set

numericSet.discard(34)
# {1, 13}
# Does not raise exceptions

popped = list.pop()
# Pops random argument (unordered set)
```
