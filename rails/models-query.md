---
title: "Querying Rails models"
---
*Most methods can be chained.*

## By primary key
Find by id. Raises an exception if none were found.
```ruby
post = Post.find(123)
```

## Filtering
`where` is the main method of filtering
```ruby
Post.where(published: true)
```

Custom conditions
```ruby
Post.where("likes > 100")
```

Binds
```ruby
Post.where("created_at >= :start_date", {start_date: params[:start_date])
```

## Limiting output

```ruby
Post.where("likes > 100").limit(10)
```

Offsetting — `limit` + `offset` is useful for pagination
```ruby
Post.where("likes > 100").limit(10).offset(20)
```

## Ordering
Default ordering is `asc`, of course, but you can specify.
```ruby
Post.order(created_at: :desc)
```
