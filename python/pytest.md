---
title: 'Setting up pytest'
---
Install pytest
```bash
$ pip install pytest
```

Asserts — must evaluate to true to pass
```python
assert list.tail is None
```

## Convention over configuration

Filenames start with `test`: `test_pointer.py`.
```
repo
├── tests
│   ├── test_pointer.py
```

Class names start with `Test`, method names start with `test_`.
```python
class TestList:
   def test_empty_list(self):
       list = List()
       assert list.head is None
```

This won't work
```python
def empty_list(self):
```


## Fixing weird import errors

`conftest.py` is a pytest configuration file. More importantly, its location defines the root dir for imports.

```
repo
├── conftest.py
├── john
│   ├── __init__.py
│   ├── lennon.py
│   └── fogerty.py
├── jimmy
│   ├── __init__.py
│   └── page.py
└── tests
     ├── test_lennon.py
     └── test_fogerty.py
```

or
```
repo
├── src
│   ├── conftest.py
│   ├── steven
│   │   ├── __init__.py
│   │   ├── tyler.py
│   │   └── wilson.py
│   └── neil
│       ├── __init__.py
│       └── young.py
└── tests
     ├── test_tyler.py
     └── test_wilson.py
```
