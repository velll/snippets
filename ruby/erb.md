---
title: 'ERB syntax'
---

`<%= %>` embeds the result in html

```
<%= @post.author %>
```

`<% %>` runs ruby code but does not embed the result (control).

```
<% if current_user.admin? %>
  <p>Admin controls</p>
  ...
<% end %>
```
