---
title: 'Working with strings'
---
Weird and unsafe concatenation
```ruby
"It's " + Time.now.to_s + " already"
```

Interpolation
```ruby
"It's #{Time.now} already"
```

String formatting
```ruby
"It's %s already" % Time.now
```
