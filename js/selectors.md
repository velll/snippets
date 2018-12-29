---
title: 'DOM selector functions'
---
Get element by id
{% highlight js %}
var element = document.getElementById(id);
{% endhighlight %}

Get all elements by css selector
{% highlight js %}
var nodeList = document.querySelectorAll(".some > css.selector")
{% endhighlight %}

Also woks for elements
{% highlight js %}
var nodeList = element.querySelectorAll(".some > css.selector")
{% endhighlight %}

Get first element by selector
{% highlight js %}
var element = document.querySelector(".some > css.selector")
{% endhighlight %}

Also helpful
{% highlight js %}
var nodeList = document.getElementsByClassName("classname")
var nodeList = document.getElementsByTagName("div")
var nodeList = document.getElementsByName("element-name-value")
{% endhighlight %}
