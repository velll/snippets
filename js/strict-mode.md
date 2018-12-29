---
title: 'Enabling strict mode'
---
```js
"use strict";
a = 1; // Will throw an error
```

Also works at the beginning of function
```js
function foo() {
  "use strict";
  b = 10;   // Throws error
}
```
