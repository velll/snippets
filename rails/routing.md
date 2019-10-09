---
title: 'Routing in Rails'
---
# Basic RESTful resources
```ruby
resources :posts
```
Maps to `PostsController` with actions:

| `GET /posts`          | `postsController#index`  |
| `GET /posts/new`      | `postsController#new`    |
| `POST /posts/new`     | `postsController#create` |
| `GET /posts/:id`      | `postsController#show`   |
| `GET /posts/:id/edit` | `postsController#edit`   |
| `PUT /posts/:id`      | `postsController#update` |
| `DELETE /posts/:id`   | `postsController#delete` |

Single resource
```ruby
resource :publisher
```
Maps to actions in `PublishersController`:

| `GET /publisher/new`  | `PublishersController#new`    |
| `POST /publisher/new` | `PublishersController#create` |
| `GET /publisher`      | `PublishersController#show`   |
| `GET /publisher/edit` | `PublishersController#edit`   |
| `PUT /publisher`      | `PublishersController#update` |
| `DELETE /publisher`   | `PublishersController#delete` |

# Extending resources
Subroutes for 'subresources'
```ruby
resources :employees do
  resources :tasks, :duties
  resource :boss
end
```

Add member routes
```ruby
resources :posts do
  member { get 'excerpt' }       # /photo/1/excerpt
  # or
  get 'preview', on: :member
end
```

# Manually setting up routes

Manualy map routes to controllers and actions
```ruby
get 'photo/:id' => 'photos#show'

post 'photo/:id' => 'photos#update'
```

Legacy urls (not RESTful).
```ruby
match ':controller(/:action(/:id(.:format)))'
```
