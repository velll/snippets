---
title: 'Removing objects in origin'
---
Remove local branch
{% highlight bash %}
$ git branch -d <branch-name>
{% endhighlight %}

Remove origin branch
{% highlight bash %}
$ git push origin :<branch-name>
{% endhighlight %}

Remove local tag
{% highlight bash %}
$ git tag -d <tag-name>
{% endhighlight %}

Remove origin tag
{% highlight bash %}
$ git push origin :refs/tags/<tag-name>
{% endhighlight %}
