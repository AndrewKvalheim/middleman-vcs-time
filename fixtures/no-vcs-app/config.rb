require 'lib/generated_resources'

activate :generated_resources
activate :vcs_time

generate 'show-mtime_generated.html' do |resource|
  "This page was last modified at #{resource.mtime.strftime('%s')}."
end
