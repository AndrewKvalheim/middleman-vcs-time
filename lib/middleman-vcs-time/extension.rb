module Middleman
  module VCSTime
    # Middleman extension
    class Extension < ::Middleman::Extension
      def initialize(app, **options_hash, &block)
        super

        require 'middleman-vcs-time/systems/fallback'
        require 'middleman-vcs-time/systems/git'
      end

      def after_configuration
        vcs = [Git, Fallback].find(&:available?)

        Middleman::Sitemap::Resource.prepend vcs::ResourceIncludes
      end
    end
  end
end
