---
title: 'Webpack development server'
---
Runs webpack config with hot reload.
```bash
$ yarn webpack-dev-server
```

Switch off hot reload (you will have to manually refresh the page)
```bash
$ yarn webpack-dev-server --no-inline --no-hot
```

Proxy to backend api
```js
devServer: {
  proxy: {
    "/api": {
        "target": "http://localhost:9393/",
        "pathRewrite": {
                "^/api" : ""
        },
        "changeOrigin": true
    }
  }
}
```
