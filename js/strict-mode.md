---
title: 'Enabling strict mode'
---
{% highlight js %}
"use strict";
a = 1; // Will throw an error
{% endhighlight %}

Also works at the beginning of function
{% highlight js %}
function foo() {
  "use strict";
  b = 10;   // Throws error
}
{% endhighlight %}
