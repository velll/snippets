---
title: 'Media queries'
---
```css
@media (min-width: 992px) {
  /* laptops and desktops */
  .square {
    color: red;
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  /* big phones and tablets */
  .square {
    color: green;
  }
}

@media (max-width: 767px) {
  /* phones */
  .square {
    color: blue;
  }
}
```
