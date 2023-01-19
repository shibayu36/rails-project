# README
This repository is an example of a rails project using MySQL, RSpec, Docker, RuboCop and factory_bot.

This repository is created by the following steps

## Initialize a Rails Project
Initialize with MySQL, and without tests and unnecessary dependencies

```
rails new project_name --database=mysql --skip-action-mailer --skip-action-mailbox --skip-action-text --skip-active-storage --skip-action-cable --skip-test
```

## Introduce RSpec
Add the following to Gemfile
```ruby
group :development, :test do
  gem "rspec-rails"
end
```

Execute the commands
```sh
bundle install
bin/rails generate rspec:install
```

## Introduce Docker
A bit complicated.  So please refer to https://github.com/shibayu36/rails-project/commit/e2d7b7bd94f224ccd70245af91eeaf710e057b43 .

Then run,

```bash
docker compose up
```

## Introduce RuboCop
Write these on Gemfile
```ruby
group :development do
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
```

Execute the following
```bash
bundle install
```

Write settings in the .rubocop.yml file.
```yml
require:
  - rubocop-rails
  - rubocop-rspec

AllCops:
  Exclude:
    - "vendor/**/*"
    - "db/**/*"
    - "config/**/*"
    - "bin/*"
    - "node_modules/**/*"
    - "Gemfile"
  NewCops: disable
```

## factory_bot
At first, you must define a model before initializing factory_bot.

```
bin/rails generate model User name:string:uniq
```

Add factory_bot to dependencies
```ruby
group :development, :test do
  gem "factory_bot_rails"
```

Then execute `bundle install`.

At last, you have to define a factory setting.  Please refer to the https://github.com/shibayu36/rails-project/commit/851ad849884cdd986d53b9b06215fad4d4e67428
