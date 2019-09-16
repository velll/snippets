---
title: "MongoDB indexes"
---
*These examples will work with data from [Inserting documents](/mongo/insert-one-many).*

# List existing indexes
```js
> db.bands.getIndexes()
```

# Create index
```js
> db.bands.createIndex( { year_started: 1 }, {name: "year started index"} )
```

# Create descending index
```js
> db.bands.createIndex( { year_started: -1 }, {name: "descending year started index"} )
```
