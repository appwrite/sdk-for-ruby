#frozen_string_literal: true

module Appwrite
    module Models
        class FileList
            attr_reader :total
            attr_reader :files

            def initialize(
                total:,
                files:
            )
                @total = total
                @files = files
            end

            def self.from(map:)
                FileList.new(
                    total: map["total"],
                    files: map["files"].map { |it| File.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "files": @files.map { |it| it.to_map }
                }
            end
        end
    end
end
