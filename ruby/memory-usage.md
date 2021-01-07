---
title: 'Memory usage'
---

Current process memory usage
```ruby
puts `ps -o rss= -p #{$$}`.to_i
```
