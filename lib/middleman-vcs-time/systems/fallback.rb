module Middleman
  module VCSTime
    # Interface to filesystem metadata
    class Fallback
      # Extensions to sitemap resources
      module ResourceIncludes
        def mtime
          File.exist?(source_file) ? File.mtime(source_file) : Time.now
        end
      end

      def self.load
        Middleman::Sitemap::Resource.class_eval do
          include ResourceIncludes
        end
      end
    end
  end
end
