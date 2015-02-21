module Middleman
  module GeneratedResources
    # Resource with no source file
    class GeneratedResource < Middleman::Sitemap::Resource
      def initialize(store, path, &renderer)
        @renderer = renderer

        super store, path
      end

      def binary?
        false
      end

      def render
        @renderer.call(self)
      end

      def source_file
        ''
      end
    end

    # Sitemap manipulator
    class Extension < Middleman::Extension
      def manipulate_resource_list(resources)
        path = 'show-mtime_generated.html'

        resources << GeneratedResource.new(app.sitemap, path) do |resource|
          "This page was last modified at #{ resource.mtime.strftime('%s') }."
        end
      end
    end
  end
end

Middleman::GeneratedResources::Extension.register :generated_resources
