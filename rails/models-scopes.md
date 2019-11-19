---
title: "Scopes in Rails models"
---
Scopes are basically named queries.

```ruby
class Post < ActiveRecord::Base
  scope :published, -> { where(published: true) }
end
```

Scopes are nothing more than class methods, but defined in a different, more special way.

```ruby
class Post < ActiveRecord::Base
  def self.published
    where(published: true)
  end
end
```
