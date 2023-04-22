# Add simple_form initializer to content of tailwindcss config file
# TODO: try to use gsub_file instead of File.read and File.write
simple_form_configs_path = "config/initializers/simple_form_tailwindcss.rb"

if File.exist?(simple_form_configs_path) && File.exist?("config/tailwind.config.js")
  tailwindcss_configs = File.read("config/tailwind.config.js")
  updated_tailwindcss_configs = tailwindcss_configs.gsub(/(\s*content:\s*\[)([\s\S]*?)(\]\s*)/, "\\1\n    '#{new_string}',\\2\\3")

  File.write("config/tailwind.config.js", updated_tailwindcss_configs)
elsif File.exist?("config/tailwind.config.js")
  puts "Skipping simple_form initializer setup, no config/tailwind.config.js file found"
else
  puts "Skipping simple_form initializer setup, no config/initializers/simple_form_tailwindcss.rb file found"
end

tailwindcss_styles_file = "app/assets/stylesheets/application.tailwind.css"

if File.exist?(tailwindcss_styles_file)
  append_file tailwindcss_styles_file, <<~CSS
    \n
    input[type=file]::-webkit-file-upload-button,
    input[type=file]::file-selector-button {
      @apply text-white bg-indigo-600 hover:bg-indigo-700 font-medium text-sm cursor-pointer border-0 py-2.5 pl-8 pr-4;
      margin-inline-start: -1rem;
      margin-inline-end: 1rem;
    }

    abbr[title=required] {
      @apply !text-red-500 no-underline;
    }
  CSS
end
