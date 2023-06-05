TEMPLATE_PART_NAMES = [
  "Gemfile_template.rb", "gitignore_template.rb", "ci_template.rb", "rubocop_template.rb", "db_template.rb",
  "rspec_template.rb", "tailwind_template.rb"
]
GITHUB_URL = "https://raw.githubusercontent.com/the-rubies-way/base_app_template/master/template_parts/"

# ********** Templates **********

TEMPLATE_PART_NAMES.each do |template_part_name|
  apply "#{GITHUB_URL}#{template_part_name}"
end

rails_command "g simple_form:install --tailwindcss"
rails_command "g rspec:install"
rails_command "g devise:install"

# Annotate files
run "annotate"

# Annotate every model and so on after each migration
rails_command "g annotate:install"

rails_command "g controller home index"
route "root to: \"home#index\""

after_bundle do
  rails_command "db:create db:migrate"
  run "bundle lock --add-platform arm64-darwin --add-platform x86_64-linux"

  run "touch .rubocop_todo.yml"
  run "rubocop -a --format worst --safe --fail-level warning"
  run "bundle exec rubocop --auto-gen-config --auto-gen-only-exclude --no-exclude-limit"
  gsub_file(".rubocop.yml", "\n  - .rubocop_todo.yml", "")

  git add: "."
  git commit: "-q -m 'Initial commit'"
end
