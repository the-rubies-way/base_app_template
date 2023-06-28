[![Actions Status](https://github.com/the-rubies-way/base_app_template/actions/workflows/ci.yml/badge.svg)](https://github.com/the-rubies-way/base_app_template/actions)

# Hi

You are discovering a pretty quiet rails app template to have a pre-setup app ready to develop.

To generate a project run:

```bash
rails new app_name -a propshaft --css=tailwind --database=postgresql --skip-jbuilder -T --template=https://raw.githubusercontent.com/the-rubies-way/base_app_template/master/template_by_github.rb
```

or using a local template:

```bash
rails new app_name -a propshaft --css=tailwind --database=postgresql --skip-jbuilder -T --template=base_app_template/template_by_github.rb
```

To generate a whole project just add `--template=https://github.com/the-rubies-way/base_app_template/blob/master/template.rb` to your app generation string if you have your own options

###### Some tips:

You can disable some templates generation by just commenting or simply removing a line with its template, like:

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

## Todo

- [ ] add `dotenv` gem
- [ ] Solve problem of using remote template, might be store it at "rails bytes"
- [ ] Add gem "rails-controller-testing"
- [ ] Insert all required includes to "spec/rails_helper.rb"

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
