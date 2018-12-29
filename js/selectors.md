---
title: 'DOM selector functions'
---
Get element by id
```js
var element = document.getElementById(id);
```

Get all elements by css selector
```js
var nodeList = document.querySelectorAll(".some > css.selector")
```

Also woks for elements
```js
var nodeList = element.querySelectorAll(".some > css.selector")
```

Get first element by selector
```js
var element = document.querySelector(".some > css.selector")
```

Also helpful
```js
var nodeList = document.getElementsByClassName("classname")
var nodeList = document.getElementsByTagName("div")
var nodeList = document.getElementsByName("element-name-value")
```
