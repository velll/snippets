---
title: 'String interpolation in Javascript'
---
Backticks are like quotes but create *template strings*. They support interpolation with `${}`.
```js
let fullName = `George Coolguy`;
let age = 41;
let sentence = `Hello, my name is ${ fullName }. I'll be ${ age + 1 } years old next month.`;
```
Btw, it's ES6.
