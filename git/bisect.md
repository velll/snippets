---
title: Bisect
---
Useful when you're trying to find when a bug got in. Every step is bisecting the commit log.

{% highlight bash %}
$ git bisect start
{% endhighlight %}

Has the bug?
{% highlight bash %}
$ git bisect bad
{% endhighlight %}

Doesn't have the bug?
{% highlight bash %}
$ git bisect good
{% endhighlight %}
