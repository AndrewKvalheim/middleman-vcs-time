module Middleman
  module VCSTime
    # Interface to filesystem metadata
    class Fallback
      # Extensions to sitemap resources
      module ResourceIncludes
        def mtime
          source_file ? File.mtime(source_file) : Time.now
        end
      end

      def self.available?
        true
      end
    end
  end
end
