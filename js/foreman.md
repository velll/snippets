---
title: "Using foreman"
---
Node forman is abbreviated to `nf`.
```js
yarn nf start
```

# Setup and configuration

```bash
$ yarn install foreman
```

Put commands in your `Procfile`.
```js
tsc: yarn tsc index.ts --watch --preserveWatchOutput
css: yarn sass --watch scss/index.scss:css/index.css
web: yarn node serve-static.js
```
Keys go to the output to differentiate logging from different processes.
```
5:29:51 PM tsc.1 |  $ /some/path/node_modules/.bin/tsc index.ts --watch --preserveWatchOutput
5:29:51 PM web.1 |  running a serve-static HTTP server on localhost:3000
5:29:52 PM tsc.1 |  5:29:52 PM - Starting compilation in watch mode...
```
