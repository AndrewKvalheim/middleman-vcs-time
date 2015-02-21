require 'pathname'

module Middleman
  module VCSTime
    # Interface to Git metadata
    class Git < Fallback
      # Extensions to sitemap resources
      module ResourceIncludes
        GIT_STATUS = %w(git status --porcelain --)

        def mtime
          @_mtime ||= git_clean? ? git_author_time : super
        end

        private

        # Parsed numstat log
        class Numstats
          include Enumerable

          GIT_NUMSTAT = %w(git log --follow --numstat --format=%at --)

          # Parsed commit entry
          class Commit
            attr_reader :deletions, :insertions, :time

            def initialize(raw)
              @insertions, @deletions = raw.last.split("\t").take(2).map(&:to_i)
              @time = Time.at(raw.first.to_i)
            end

            def changed?
              deletions.nonzero? || insertions.nonzero?
            end
          end

          def initialize(path)
            @raw = IO.popen(GIT_NUMSTAT + [path])
          end

          def each
            @raw.each_line.each_slice(3) { |entry| yield Commit.new(entry) }
          end
        end

        def git_author_time
          Numstats.new(source_file).find(&:changed?).try(:time)
        end

        def git_clean?
          IO.popen(GIT_STATUS + [source_file]) { |output| output.read.empty? }
        end
      end

      def self.available?
        system(*%w(git rev-parse), err: File::NULL)
      end

      def self.load
        if available?
          super

          Middleman::Sitemap::Resource.class_eval do
            include ResourceIncludes
          end
        end
      end
    end
  end
end
