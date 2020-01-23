---
title: 'Encoding magic'
---
Weird encoding problems are usually solved with a magic comment.
```
# coding: UTF-8
```

I don't think I've used it since ruby 1.8.

Since 1.9 encoding is derived from environment. Here's what you probably see.
```
export LANG='en_US.UTF-8'
export LC_CTYPE='UTF-8'
```
If you're trying to avoid fiddling with the environment of the entire server, try the gemfile.

# Ruby Docker image
As for December 2019 There's still some frankly repulsive encoding bullshit when using official ruby Docker image.

> By default, Ruby inherits the locale of the environment in which it is run. For most users running Ruby on their desktop systems, that means it's likely using some variation of *.UTF-8 (en_US.UTF-8, etc). In Docker however, the default locale is C, which can have unexpected results. If your application needs to interact with UTF-8, it is recommended that you explicitly adjust the locale of your image/container via `-e LANG=C.UTF-8` or `ENV LANG C.UTF-8`.

Add this to your `run` command
```
-e LANG=C.UTF-8
```

Or to you image Dockerfile
```
ENV LANG C.UTF-8
```
