# Use a non-standard Git directory in fixtures so as not to conflict with the
# parent repository
Given /^the Server is running under Git at "([^\"]*)"$/ do |app_path|
  step %(a fixture app "#{app_path}")

  ENV['GIT_DIR'] = expand_path('dotgit')
  ENV['GIT_WORK_TREE'] = expand_path('.')

  step %(the Server is running)
end
