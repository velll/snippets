---
title: 'Using curl to send HTTP requesys'
---
Send a simple HTTP request
```bash
$ curl http://example.com
```

Save output to file
```bash
$ curl http://example.com -o example.html
```

Silently send the request
```bash
$ curl -s http://example.com
```

Verbose output (headers and stuff)
```bash
$ curl -v http://example.com
```

Perform basic authentication
```bash
$ curl -u login:password http://example.com
```

Specify params
```bash
$ curl -d param="value" http://example.com
```
