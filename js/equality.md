---
title: Equality operators
---
a equal to b
{% highlight js %}
a == b
{% endhighlight %}


a equal to b AND type of a is equal to type of b
{% highlight js %}
a === b
{% endhighlight %}

Examples
{% highlight js %}
0 == false
// -> true

0 === false
// -> false
{% endhighlight %}

# Negation

a is not equal to b
{% highlight js %}
a != b
{% endhighlight %}

a is not equal to b OR type of a is not equal to type of b
{% highlight js %}
a !== b
{% endhighlight %}

Examples
{% highlight js %}
0 != false
// -> false (they are actually equal)

0 !== false
// -> true (they don't have the same type)
{% endhighlight %}
