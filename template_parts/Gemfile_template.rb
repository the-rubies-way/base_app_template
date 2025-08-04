gem_group :development, :test do
  # Testing tools
  gem "rspec-rails"
  gem "database_cleaner-active_record"
  gem "fuubar"
  # Debugging tool
  gem "pry-rails"
  gem "pry-nav"
  # Fake data generator
  gem "factory_bot_rails"
  gem "faker"
  # Linter
  gem "rubocop", "~> 1.39", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "standard", "~> 1.0", require: false
end

gem_group :development do
  if Gem::Version.new(Rails::VERSION::STRING) >= Gem::Version.new("8.0.0")
    gem "annotate", git: "https://github.com/absk1317/annotate_models", branch: "rails-8"
  else
    gem "annotate"
  end
  gem "rails_live_reload"

  # TODO: initialize any_login
  gem "any_login" #=> login as any user
end

gem_group :test do
  gem "simplecov", require: false
  gem "shoulda-matchers", "~> 5.0"
end

gem "devise"
gem "friendly_id"
gem "simple_form", git: "https://github.com/loqimean/simple_form"
gem "ransack" #=> search and filter records
gem "kaminari" #=> pagination
gem "meta-tags"
gem "rails-i18n"
gem "inline_svg", "~> 1.8"

append_file "Gemfile", <<~RUBY
  # gem "awesome_print", groups: [:development, :test]
  # gem "babosa"
  # gem "mimemagic"
  # gem "carrierwave"
  # gem "groupdate"
  # gem "premailer-rails"
  # gem "actionview-encoded_mail_to"
  # gem "requestjs-rails"
  # gem "active_record_union"
  # gem "phony_rails"
  # gem "rails_autolink"
  # gem "chewy" #=> elasticsearch
  # gem "avatarro"
  # gem "breadcrumbs_on_rails"
  # gem "view_component"
  # gem "tinymce-rails", git: "https://github.com/loqimean/tinymce-rails.git" #=> rich text editor
  # gem "caxlsx"
  # gem "caxlsx_rails"
  # gem "mjml-rails", "~> 4.8" #=> responsive mailer templates builder
  # gem "rails_charts", "~> 0.0.4"
  # gem "smart_and_fast_assets" #=> not yet finished. gem to make your pictures tiny and smart
  # gem "browser", "~> 5.3"
  # gem "fake_picture" #=> generate fake pictures
  # add and comment another useful gems here
RUBY

run "bundle install"
