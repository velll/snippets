---
title: "Rails controllers"
---
# Special objects
Params is the biggest.
```
params[:page]
```

Params is a combination of:
- `request.path_parameters`;
- `request.query_parameters` (or `request.GET`);
- `request.request_parameters` (or `request.POST`).

Flash is for temporarily storing errors
```ruby
flash[:notice] = "Hello"    # will flush on next request
flash.keep                  # save for now
flash.now[:error] = "Boo"   # will be available during this request
```

Storing cookies
```ruby
cookies[:hello] = "Hey"
```

# Responding in different formats
```ruby
respond_to do |format|
  format.html
  format.json { render json: @posts }
  format.js    # will be immediately executed in browser
end
```

# Adding defaults to urls
Options hash is added to the params when using `url_for`.
```ruby
def default_url_options(options)
  {:locale => I18n.locale}
end
```

# Respond with file
```ruby
send_file Rails.root.join('public','somefile.txt') [filename: '', type: '']
```

# Redirect
```ruby
redirect_to some_url
redirect_to some_url, notice: "Notice the redirect..."
```

# Filters

```ruby
before_filter :authenticate
before_filter :authenticate, except: [:login]
before_filter :authenticate, only: [:login]

def authenticate
  redirect_to login_url unless controller.logged_in?
end
```

- `before_filter` — before calling an action
- `after_filter` — after calling an action
- `around_filter` — yields an action inside

```ruby
around_filter :wrap_in_transaction

def wrap_in_transaction(&block)
  ActiveRecord::Base.transaction { yield }
end
```

# Filter exceptions
```ruby
skip_before_filter :require_login, only: [:new, :create]
```

# Defining a filter as an external classes
```ruby
before_filter LoginFilter
class LoginFilter
  def self.filter(controller) ...; end
end
```
