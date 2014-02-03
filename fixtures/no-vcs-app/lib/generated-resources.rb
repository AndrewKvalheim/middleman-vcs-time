module Middleman
  module GeneratedResources
    class GeneratedResource < Middleman::Sitemap::Resource
      def binary?
        false
      end

      def render
        raise NotImplementedError
      end

      def source_file
        ''
      end
    end

    class Extension < Middleman::Extension
      def manipulate_resource_list(resources)
        resource = GeneratedResource.new(app.sitemap, 'show-mtime_generated.html')

        class << resource
          def render
            "This page was last modified at #{mtime.strftime('%s')}."
          end
        end

        resources << resource
      end
    end
  end
end

Middleman::GeneratedResources::Extension.register :generated_resources
