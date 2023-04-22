puts "Creating #{app_name} user role..."
system("createuser -s #{app_name} || true")
if not $?.success?
  puts "Error creating #{app_name} user role!"
  exit
end

file "config/database.yml.example", <<-YAML
# PostgreSQL. Versions 9.3 and up are supported.
#
default: &default
  adapter: postgresql
  encoding: unicode
  host: <%= ENV.fetch("#{app_name.upcase}_DATABASE_HOST") { "localhost" } %>
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <%= ENV.fetch("#{app_name.upcase}_DATABASE_USERNAME") { "#{app_name}" } %>
  password: <%= ENV["#{app_name.upcase}_DATABASE_PASSWORD"] %>
  port: <%= ENV.fetch("#{app_name.upcase}_DATABASE_PORT") { "5432" } %>

development:
  <<: *default
  database: #{app_name}_development
test:
  <<: *default
  database: #{app_name}_test
production:
  <<: *default
  database: #{app_name}_production
YAML

run "cp config/database.yml.example config/database.yml"
