---
title: "Link local packages with yarn"
---

Using local version of a library instead of the one published to npm.

Say, you're developing `xml-wrappers`. In local `xml-wrappers` directory
```bash
$ yarn link
...
info You can now run `yarn link "xml-wrappers"` in the projects where you want to use this package and it will be used instead.
...
```

Go to the application which uses the library
```bash
$ yarn link xml-wrappers
...
success Using linked package for "xml-wrappers".
```

Unlink after you're done
```bash
$ yarn unlink
```
