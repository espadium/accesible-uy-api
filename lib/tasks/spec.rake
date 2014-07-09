task :spork do
  # Run tests with Spork
  system 'bundle exec rspec --drb ./spec'
end
