# Use a non-standard Git directory in fixtures so as not to conflict with the
# parent repository
Given /^the Server is running under Git at "([^\"]*)"$/ do |app_path|
  step %Q{a fixture app "#{app_path}"}

  set_env 'GIT_DIR', File.join(current_dir, 'dotgit')
  set_env 'GIT_WORK_TREE', current_dir

  step %Q{the Server is running}
end
