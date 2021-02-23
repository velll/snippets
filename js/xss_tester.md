---
title: 'XSS tester'
---
Basic alert
```html
<script type="application/javascript">alert('hello');</script>
```

Link
```html
<a href="javascript:alert('Hello');">This shouldnt be here</a>
```
