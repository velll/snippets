---
title: 'Regex basics'
---
By convention regular expressions are enclosed in '//' — `/regex/`.

A simple string as a regex matches a string containing this regex.

`/example/`

```
'here is an example'
```

# Anchors: `^$`

`/^example/`
```
'example one:' - this will match
'here is an example' — this won't match
```

`/example$/`
```
'example one:' — this won't match
'here is an example' — this will
```

# Quantifiers: `*+?{}`

`*` — 0, 1 or more

`/pears*/`

```
'pear', 'pears', 'pearss', ...
```

`+` — 1 or more

`/pears+/`

```
'pears', 'pearss', ...
'pear' won't match
```

`?` — 0 or 1

`/pears?/`

```
'pear', 'pears'
```

`{}` — number of occurances

`/pears{2}/`

```
'pearss'
```

`/pears{2,}/`

```
'pearss', 'pearsss', ...
```

`/pears{2,4}/`
```
'pearss', 'pearsss', 'pearssss'
```

# Classes

- `\d` — single digit
- `\w` - single 'word' character (letter, digit, underscore)
- `\s` - single whitespace
- `.`  - single anything
- `\D` - single non-digit
- `\W` - single non-'word' character
- `\S` - single non-whitespace

- `[A-Z]` — all capital latin letters
- `[a-z]` — all small latin letters
- `[A-Za-z]` — combined
- `[0-9]` — all digits

`[^]` expresses negation (e.g. `[^0-9]` — non-digits)
