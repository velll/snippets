---
title: "Index signatures in TypeScript"
---
Index signature specifies to which format of `key:value` the object must conform.

While you can specify all properties of an interface
```ts
interface IndexedByString {
  a: number,
  b: number,
  c: number
}
```

You might want to let the key be anything of a particular type.
```ts
interface IndexedByString {
  [index:string]:number
}
```

This way you can use any value conforming to the index type.
```ts
let foo: IndexedByString = {
  'a': 1,
  'b': 123,
  'z': 700
}

console.log(foo['z'])
```
