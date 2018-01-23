# simplecov-postgresql

Postgresql formatter for the ruby 1.9+ code coverage gem SimpleCov

## Usage

1. Add simplecov-postgresql to your `Gemfile` and `bundle install`:

        gem 'simplecov-postgresql', require: false, group: :test

2. Require simplecov-postgresql and set it up as SimpleCov's formatter:

        require 'simplecov-postgresql'
        SimpleCov.formatter = SimpleCov::Formatter::PostgresqlFormatter

## Result

## Making Contributions

## Copyright

Copyright (c) 2018 Sergii Demianchuk. See LICENSE for details.
