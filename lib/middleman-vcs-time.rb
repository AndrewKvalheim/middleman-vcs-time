require 'middleman-core'

::Middleman::Extensions.register :vcs_time do
  require 'middleman-vcs-time/extension'

  Middleman::VCSTime::Extension
end
