---
title: "Callable objects"
---
Define a class with a `call` method
```ruby
class Command
  def initialize(message)
    @message = message
  end

  def call(attempt)
    puts "I'm a command attempt \##{attempt}: #{@message}"
  end
end
```

Call the object
```
> do_this = Command.new("cool, huh?")
> do_this.(3)
I'm a command attempt #3: cool, huh?
```
