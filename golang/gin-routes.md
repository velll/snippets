---
title: 'Gin gonic routes'
---

Wrap
```go
routes := gin.Default()
...
routes.Run()
```

Layout
```go
routes.GET("/", func(c *gin.Context) {
  c.HTML(http.StatusOK, "default.tmpl", gin.H{
    "title": "and",
    "other": "parameters"
  })
})
```

JSON response
```go
routes.GET("/json", func(c *gin.Context) {
  c.JSON(http.StatusOK, gin.H{"msg": "this worked"})
})
```

Extract query parameters
```go
routes.GET("/test", func(c *gin.Context) {
  fmt.Println(c.Request.URL.Query())
  // map[blah:[1]]
  ...
})
```
Return type is `map[string][]string` (multiple values).
