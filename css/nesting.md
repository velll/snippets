---
title: 'SCSS rule nesting'
---
```scss
.message {
  p {              // compiles to ".message p"
    color: blue;
  }

  &:hover {        // & stands for parent selector (compiles to ".message:hover")
    color: red;
  }
}
```
