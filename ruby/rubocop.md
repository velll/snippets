---
title: 'Using Rubocop'
---
# CLI commands

Run
```bash
$ bundle exec rubocop
```

Run and fix issues automatically
```bash
$ bundle exec rubocop --safe-auto-correct
```

Same but for cowboys!
```bash
$ bundle exec rubocop -a
```

Generate a 'todo' config file to exclude all current isssues
```bash
$ rubocop --auto-gen-config
```

# Config options
Config is in `.rubocop.yml`.

Some rules are configurable
```yaml
Layout/LineLength:
  Max: 90
```

Some rules don't make sense
```yaml
Bundler/OrderedGems:
  Enabled: false
```

Or you may want to disable everything to then start slowly whitelisting rules
```yaml
AllCops:
  DisabledByDefault: true
```
