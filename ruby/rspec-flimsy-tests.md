---
title: 'RSpec: figuring out flimsy tests'
---

Run multiple times
```bash
for i in `seq 10`; do  rspec path/to/spec/file.rb; done
```

Catch failures to figure out what went wrong
```ruby
rescue RSpec::Expectations::ExpectationNotMetError => e
    binding.pry
```
