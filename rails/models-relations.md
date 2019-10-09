---
title: 'Rails models and relations'
---
A model called `Post` expects a table `POSTS` which has a primary key column named `id`.
```ruby
class Post < ActiveRecord::Base
end
```

Customize!
```ruby
class Post < ActiveRecord::Base
  self.table_name = 'articles'
  self.primary_key = 'n_article_id'
end
```

# Associations
A model `belongs_to` a parent and `has_many` children.

## Belongs_to
Expects `POSTS` to have a foreign key `author_id` and a model `Author`.
```ruby
class Post < ActiveRecord::Base
  belongs_to :author
end
```

Customize!
```ruby
class Post < ActiveRecord::Base
  belongs_to :author, :foreign_key => 'writer_id' class_name: 'Writer'
end
```

## Has_many
```ruby
class Post < ActiveRecord::Base
  has_many :comments
end
```
Same idea for customization
```ruby
class Post
  has_many :comments, foreign_key: 'remark_id', class_name: 'Remark'
end
```

Custom conditions
```ruby
class Department
  has_many :employees
  has_many :developers,
            foreign_key: 'employee_id',
            class_name: 'Employee',
            conditions: {role: 'Developer'}
end
```

## Has_one
`has_one` is used when the *other* model has the foreign key.
```ruby
class Employee < ActiveRecord::Base
  has_one :office
end
```
`belongs_to` is used when *this* model has the foreign key.
