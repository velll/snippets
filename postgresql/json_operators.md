---
title: 'JSON operators'
---
Navigation. Returns an *active* jsonb, can be chained.
- Access object fields using string literal keys;
- access array elements using numeric indexes.

```SQL
options -> 'limits' -> 0
```

Navigate and return JSON as string. Cannot be chained as the result is a plain string.
```SQL
options ->> 'limits'
```

Concatenate two jsonb fields. Returns an *active* jsonb.
```SQL
left.options || right.options
```
