---
title: "Concerns and 'included' hook"
---
```ruby
module Concerning
  def self.included(klass)
    klass.extend(ClassMethods)
    klass.include(InstanceMethods)
  end

  module ClassMethods
    def bar
      'bar'
    end
  end

  module InstanceMethods
    def foo
      'foo'
    end
  end
end
```

Usage
```ruby
class SomeClass
  include Concerning
end
```
