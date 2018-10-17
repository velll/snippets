# Commands

# run
bundle exec rubocop

# run with automatically fixing issues
bundle exec rubocop --safe-auto-correct

# same but for cowboys!
bundle exec rubocop -a

# generate a 'todo' config file to exclude all current isssues
rubocop --auto-gen-config


# Config options

# Some rules are configurable
Layout/LineLength:
  Max: 90

# Some rules don't make sense
Bundler/OrderedGems:
  Enabled: false

# Disable everything and to then start slowly whitelisting rules
AllCops:
  DisabledByDefault: true
