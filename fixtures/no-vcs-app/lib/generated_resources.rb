module GeneratedResources
  # Resource with a configurable renderer
  class GeneratedResource < ::Middleman::Sitemap::Resource
    attr_accessor :renderer

    def render(options = {}, locals = {})
      @renderer.call(self, options, locals)
    end
  end

  # Sitemap manipulator
  class Extension < ::Middleman::Extension
    expose_to_config :generate

    def initialize(app, options_hash = {})
      super

      @renderers = {}
    end

    def generate(path, &renderer)
      @renderers[path] = renderer
    end

    def manipulate_resource_list(resources)
      resources + @renderers.map do |path, renderer|
        GeneratedResource.new(app.sitemap, path, nil).tap do |resource|
          resource.renderer = renderer
        end
      end
    end
  end
end

extension = GeneratedResources::Extension
::Middleman::Extensions.register :generated_resources, extension
