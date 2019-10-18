---
title: 'Extending window object for debugging typescript'
---
Source maps and debugger aside I sometimes want to add something to a `window` object.

```js
window.someProperty = 123
```
This fails.

But this works
```js
(window as any).someProperty = 123;
```
