[![Actions Status](https://github.com/loqimean/base_app_template/actions/workflows/ci.yml/badge.svg)](https://github.com/loqimean/base_app_template/actions)

# Hi

You are discovering pretty quite rails app template to have pre-settuped app ready to develop.

To generate project use command:

```bach
rails new app_name -a propshaft --css=tailwind --database=postgresql --skip-jbuilder -T --template=https://github.com/loqimean/base_app_template/blob/master/template.rb
```

To generate whole project, or just add `--template=https://github.com/loqimean/base_app_template/blob/master/template.rb` to your app generation string if you have own options

###### Some tips:

You can disable some templates generation by just commenting or simply removing line with its template, like:

```ruby
...
# apply "template_parts/rubocop_template.rb"
apply "template_parts/db_template.rb"
...
```

#### This template contains things to set up into the project, such as:

- CI (GitHub Actions)
- DB (PostgreSQL)
- Useful gems bundle
- .gitignore file (to exclude some system and extra files for different OS, like Ubuntu, MacOS)
- RSpec setup with stuff like (ShouldaMatchers, DatabaseCleaner, FactoryBot, SimpleCov)
- Rubocop (linter who don't know)
- TailwindCSS (really powerful CSS framework, much better than Bootstrap)

## Ready to go?))

Then simply run `rails s` and enjoy the codding!
