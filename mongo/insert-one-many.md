---
title: 'Inserting documents'
---

Insert one document
```js
> db.bands.insertOne(
   { "name" : "Beatles",
     "year_started": 1960,
     "musicians": [
       { "name": "John Lennon",
         "instruments": ["guitar"],
         "vocals": true
       },
       { "name": "Paul McCartney",
         "instruments": ["bass", "piano"],
         "vocals": true
       },
       { "name": "George Harrison",
         "instruments": ["guitar", "sitar"]
       },
       { "name": "Ringo Starr",
         "instruments": ["drums"]
       },
     ]
   }
)
```

Insert multiple documents
```js
> db.bands.insertMany(
  [
    { "name": "Led Zeppelin",
      "year_started": 1968
    },
    { "name": "Pink Floyd",
      "year_started": 1965
    },
    { "name": "Red Hot Chili Peppers",
      "year_started": 1983,
      "active": true
    },
    { "name": "Electric Light Orchestra",
      "year_started": 1970
    }
  ]
)
```
Select all
```js
> db.bands.find().pretty()
```
