---
title: Basic commands
order: 0
---
Global configuration
{% highlight bash %}
$ git config --global user.name "<name>"
$ git config --global user.email "<email>"
{% endhighlight %}

all stored in ~/.gitconfig

New repo

{% highlight bash %}
$ git init && touch .gitignore && git add .gitignore && git commit -a -m "Initial commit"
{% endhighlight %}
Existing repo

{% highlight bash %}
$ git clone <repo-url>
{% endhighlight %}

Stage
{% highlight bash %}
$ git add <file>
{% endhighlight %}

Stage all
{% highlight bash %}
$ git add .
{% endhighlight %}

Commit staged
{% highlight bash %}
$ git commit
$ git commit -m "Short commit message"
{% endhighlight %}

Commit all modified
{% highlight bash %}
$ git commit -a
{% endhighlight %}
Send to remote
{% highlight bash %}
$ git push
$ git push <remote> <branch>
{% endhighlight %}

Branches
{% highlight bash %}
$ git checkout -b <newbranch>
$ git checkout <existing-branch>
{% endhighlight %}
Merge other branch into current
{% highlight bash %}
$ git merge <other-branch>
{% endhighlight %}

Fetch vs pull
{% highlight bash %}
$ git fetch
$ git pull
{% endhighlight %}
Pull = Fetch + Merge

Bisect
{% highlight bash %}
$ git bisect
{% endhighlight %}
