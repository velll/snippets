---
title: "Form helpers for views"
---
Defining `<form>` tag for a model
```
<%= form_for @post do |f| %>
...
<% end %>
```

Using tag helpers under `form_for`
```
<%= f.text_field :name %>
<%= f.text_field :name, {class: "input", placeholder: 'John Stevenson' } %>
<%= f.text_area :hobby %>
```

Selects are pretty special
```
<%= f.select :location_id, [['Berlin',1], ['Moscow',2], ...], 1 %>
<%= f.select :employee_position_id, 'Position', EmployeePositions.all.map{ |position| [position.name, position.id] } %>
```

Buttons
```
  <div class="actions">
    <%= f.submit class: 'button' %>
  </div>
```
