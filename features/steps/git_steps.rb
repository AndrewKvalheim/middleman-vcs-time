# Use a non-standard Git directory in fixtures so as not to conflict with the
# parent repository
Given /^the Server is running under Git at "([^\"]*)"$/ do |app_path|
  step %(a fixture app "#{ app_path }")

  set_env 'GIT_DIR', File.join(absolute_path, 'dotgit')
  set_env 'GIT_WORK_TREE', absolute_path

  step %(the Server is running)
end
