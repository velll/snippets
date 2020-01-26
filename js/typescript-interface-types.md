---
title: "Interface and Type Alias syntax"
---
# Interfaces in place of type aliases

Define a simple interface for structures
```ts
interface Dimensions {
  width: number,
  height: number
}
```

Can be used similarly to types
```ts
let dimensions: Dimensions = {
  width: 200,
  height: 100
}
```

# Interfaces for objects

Define an interface for an object with methods
```ts
interface Drawable {
  draw(): void,
  dimensions: Dimensions,
}
```

Implement such an interface using classes
```ts
class Painting implements Drawable {
  // short form for field initializers
  constructor(private dimensions: Dimensions) {
  }

  draw() {
    console.log('drawing ' + this.dimensions.width + 'x' + this.dimensions.height);
  }
}
```

Instantiate an object
```ts
let monaLisa = new Painting({width: 100, height: 200})
monaLisa.draw()
```

# Function types

```ts
type Procedure = (arg: number) => void
```

```ts
let push: Procedure = (arg: number) => {
  ...
}
```

# Type aliases for special cases

```ts
type AnyRecord = Record<string, any>;
```

Generic dictionaries
```ts
type Dictionary<T> = Record<string, T>;

let m: Dictionary<number> = {"two": 2, "three": 3}
```
More on [utility types](https://www.typescriptlang.org/docs/handbook/utility-types.html).
