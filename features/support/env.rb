PROJECT_ROOT_PATH = File.dirname(File.dirname(File.dirname(__FILE__)))
require 'middleman-core'
require 'middleman-core/step_definitions'
require File.join(PROJECT_ROOT_PATH, 'lib', 'middleman-vcs-time')

# Prevent fixtures from detecting the parent repository
Before do
  set_env 'GIT_DIR', File::NULL
end
