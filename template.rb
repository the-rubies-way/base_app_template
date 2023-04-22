def source_paths
  [*super, __dir__]
end

# ********** Templates **********

apply "template_parts/Gemfile_template.rb"
apply "template_parts/gitignore_template.rb"
apply "template_parts/ci_template.rb"
apply "template_parts/rubocop_template.rb"
apply "template_parts/db_template.rb"

rails_command "g simple_form:install --tailwindcss"
rails_command "g rspec:install"
rails_command "g devise:install"

apply "template_parts/rspec_template.rb"

apply "template_parts/tailwind_template.rb"

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
