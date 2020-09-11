---
title: 'Read/write JSON'
---
Read JSON file as hash
```ruby
JSON.parse(File.read('/path/to/file.json'))
```

Write hash as json
```ruby
File.write('blah.json', h.to_json)
```
