---
title: Select
---
*These examples will work with data from [Inserting documents](/mongo/insert-one-many).*

Prettify output to make it at least readable
```js
.pretty()
```

Select all
```js
> db.collection.find().pretty()
```

# select and filter

Equals
```js
> db.bands.find({active: true}).pretty()
```

Comparison: greater than (>), less than (<) —  gte, lte also works
```js
> db.bands.find({year_started: {$gt: 1980}}).pretty()
> db.bands.find({year_started: {$lt: 1980}}).pretty()
```

And
```js
> db.bands.find({active: true, year_started: {$gte: 1970}}).pretty()
```

Or
```js
> db.bands.find( {$or: [ {active: true}, {year_started: {$gte: 1970}} ] }).pretty()
```
