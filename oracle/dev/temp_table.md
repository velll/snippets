---
title: 'Temporary tables'
---
Temporary tables in Oracle are persistent but you can only access data from your own session
{% highlight sql %}
CRATE GLOBAL TEMPORARY TABLE TEMP_TABLE_NAME_DEL(
  ID   NUMBER /*,
  ... -- columns */
)
ON COMMIT DELETE ROWS;
{% endhighlight %}

Or if you want rows to stick around after transaction is committed
{% highlight sql %}
CRATE GLOBAL TEMPORARY TABLE TEMP_TABLE_NAME_KEEP(
  ID   NUMBER /*,
  ... -- columns */
)
ON COMMIT PRESERVE ROWS;
{% endhighlight %}
