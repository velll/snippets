---
title: 'Formatting all errors as JSON with Sinatra'
---
```ruby
error do
  content_type :json
  status 400 # or whatever

  e = env['sinatra.error']
  { result: 'error', message: e.message }.to_json
end
```
