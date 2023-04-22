# Remove mini_test
run "rm -rf test"

# Install FactoryBot to use in RSpec tests
File.open("spec/rails_helper.rb", "r+") do |file|
  lines = file.each_line.to_a
  config_index = lines.find_index("RSpec.configure do |config|\n")
  lines.insert(config_index + 1, "  config.include FactoryBot::Syntax::Methods\n")
  file.rewind
  file.write(lines.join)
end

# Add simplecov to spec_helper.rb
if File.exist?("spec/spec_helper.rb")
  prepend_to_file "spec/spec_helper.rb", <<~RUBY
    require "simplecov"
    SimpleCov.start

  RUBY
else
  puts "Skipping simplecov setup, no spec/spec_helper.rb file found"
end

if File.exist?("spec/rails_helper.rb")
  append_file "spec/rails_helper.rb", <<~RUBY
    \n
    Shoulda::Matchers.configure do |config|
      config.integrate do |with|
        with.test_framework :rspec
        with.library :rails
      end
    end
  RUBY
else
  puts "Skipping shoulda-matchers setup, no spec/rails_helper.rb file found"
end

if File.exist?("spec/rails_helper.rb")
  # database_cleaner-active_record
  file 'spec/support/database_cleaner.rb', <<-RUBY
    RSpec.configure do |config|
      config.before(:suite) do
        DatabaseCleaner.strategy = :transaction
        DatabaseCleaner.clean_with(:truncation)
      end

      config.around(:each) do |example|
        DatabaseCleaner.cleaning do
          example.run
        end
      end

      config.add_formatter 'Fuubar'
      config.fuubar_output_pending_results = false
    end
  RUBY

  # TODO: use uncomment_lines instead of File.read and File.write
  filename = "spec/rails_helper.rb"
  line_to_replace = "# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }"
  new_line = line_to_replace.gsub("# ", "")
  content = File.read(filename)

  content.sub!(/^#{Regexp.escape(line_to_replace)}$/, new_line)
  File.write(filename, content)
else
  puts "Skipping database_cleaner setup, no spec/rails_helper.rb file found"
end
