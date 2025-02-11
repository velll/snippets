---
title: "Using TSLint"
---
Check a file
```bash
$ yarn tslint <file>
```

Check the entire project folder
```bash
$ yarn tslint -p .
```

Automatically fix issues
```bash
$ yarn tslint -p . --fix
```

## Configuring TSLint

Install and setup
```bash
$ yarn add --dev tslint
```

Initialize configuration — stored in `tslint.json`.
```bash
$ yarn tslint --init
```

Excluding files — add to `tslint.json`
```js
"linterOptions": {
    "exclude": [
        "webpack.config.js",
        "jest.config.js"
    ]
}
```

Configuring rules — in `tslint.json`. Check with [rulebook](https://palantir.github.io/tslint/rules/).
```js
"rules": {
    "interface-name": [true, "never-prefix"],
    "ordered-imports": false,
    "object-literal-sort-keys": false,
    "quotemark": false,
    "object-literal-shorthand": [true, "never"],
    "semicolon": [true, "always", "ignore-interfaces"],
    "triple-equals": false,
    "arrow-parens": [true, "ban-single-arg-parens"],
    "trailing-comma": [
        true,
        {
            "multiline": {
                "objects": "never",
                "arrays": "never",
                "functions": "never",
                "typeLiterals": "ignore"
            },
            "esSpecCompliant": true
        }
    ]
}
```
