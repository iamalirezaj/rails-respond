require 'rake'

# Copy config files
task :config do
  mv(File.join("errors", "en.yml"), Rails.root.join("config", "locales", "respond", "en.yml"), :verbose => true)
  mv(File.join("errors", "fa.yml"), Rails.root.join("config", "locales", "respond", "fa.yml"), :verbose => true)
end