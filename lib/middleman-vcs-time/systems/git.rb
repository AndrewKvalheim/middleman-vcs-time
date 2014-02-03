require 'pathname'

module Middleman
  module VCSTime
    class Git < Fallback
      module ResourceIncludes
        def mtime
          @_mtime ||= if git_clean?
            git_author_time
          else
            super
          end
        end

        private

        def git_author_time
          command = %w{git log --follow --numstat --format=%at --}

          result = IO.popen(command + [source_file]) do |output|
            output.each_line.each_slice(3).find do |result|
              result.last.split("\t").take(2).map(&:to_i).reduce(&:+).nonzero?
            end
          end

          Time.at(result.first.to_i) if result
        end

        def git_clean?
          command = %w{git status --porcelain --}

          IO.popen(command + [source_file]) { |output| output.read.empty? }
        end
      end

      def self.load
        if available?
          super
          Middleman::Sitemap::Resource.include ResourceIncludes
        end
      end

      private

      def self.available?
        system(*%w{git rev-parse}, err: File::NULL)
      end
    end
  end
end
