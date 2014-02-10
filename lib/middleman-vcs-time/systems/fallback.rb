module Middleman
  module VCSTime
    class Fallback
      module ResourceIncludes
        def mtime
          if File.exists?(source_file)
            File.mtime(source_file)
          else
            Time.now
          end
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
