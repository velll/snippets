---
title: 'Python collections: dictionaries'
---

```python
dimensions = {'height': 100, 'width': 150}
```

# Add

Add elements to the list (mutate). Will overwrite existing keys if provided
```python
dimensions['length'] = 200
# {'height': 100, 'width': 150, 'length': 200}

dimensions.update({'length': 200, 'duration': 500 })
# {'height': 100, 'width': 150, 'length': 200, 'duration': 500}
```

Create a new dictionary with new elements
```python
>>> {**dimensions, 'duration' : 500 }
{'height': 100, 'width': 150, 'duration': 500}
```

# Remove

```python
del dimensions['duration']
# {'height': 100, 'width': 150, 'length': 200 }
# Raises KeyError if key does not exist in the dictionary

popped = dimensions.pop('width', None)
# -> 150
# {'height': 100, 'length': 200 }
# Pops given key out of the dict, returns the value
# Raises KeyError if default value is not provided (second arg)
```
