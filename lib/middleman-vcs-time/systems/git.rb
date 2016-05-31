require 'pathname'

module Middleman
  module VCSTime
    # Interface to Git metadata
    class Git < Fallback
      # Extensions to sitemap resources
      module ResourceIncludes
        def mtime
          @_mtime ||= git_clean? ? git_author_time : super
        end

        private

        # Parsed numstat log
        class Numstats
          include Enumerable

          GIT_NUMSTAT = %w(git log --follow --numstat --format=%at --).freeze

          # Parsed commit entry
          class Commit
            attr_reader :time

            def initialize(raw)
              @insertions, @deletions = raw.last.split("\t").take(2).map(&:to_i)
              @time = Time.at(raw.first.to_i)
            end

            def changed?
              @deletions.nonzero? || @insertions.nonzero?
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
          change = Numstats.new(source_file).find(&:changed?)
          change.time if change
        end

        def git_clean?
          IO.popen(%w(git status --porcelain --) + [source_file]) do |output|
            output.read.empty?
          end
        end
      end

      def self.available?
        system(*%w(git rev-parse), err: File::NULL)
      end
    end
  end
end
