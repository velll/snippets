---
title: 'Regex groups'
---

Parentheses are used to enclose groups
```
/(ex)amp(le)/
```

They are good for expression ORs
```
/(tr|kn)ee/ — will match both 'tree' and 'knee'
```

Good for capturing parts of strings using groups. Here's a ruby example.

```ruby
string = "example"
one, two = string.match(/(ex)amp(le)/).captures
=> ["ex", "le"]
```

# Referring back to a group
```
([abc])\1
```
`\1` matches the same part that was matched by the 1st group

```ruby
"foobarfoo".match(/(foo).*(r\1)/).captures
=> ["foo", "rfoo"]
```
Also works with `\2`, `\3` and so on.

To ignore a group (don't want to capture but only want to OR)
```
/(?:c|d)ar(t)/ — will not capture 'c' or 'd' but will capture last 't'
```
