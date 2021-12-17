#frozen_string_literal: true

module Appwrite
    module Models
        class FileList
            attr_reader :sum
            attr_reader :files

            def initialize(
                sum:,
                files:
            )
                @sum = sum
                @files = files
            end

            def self.from(map:)
                FileList.new(
                    sum: map["sum"],
                    files: map["files"].map { |it| File.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "files": @files.map { |it| it.to_map }
                }
            end
        end
    end
end