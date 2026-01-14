#frozen_string_literal: true

module Appwrite
    module Models
        class BackupArchiveList
            attr_reader :total
            attr_reader :archives

            def initialize(
                total:,
                archives:
            )
                @total = total
                @archives = archives
            end

            def self.from(map:)
                BackupArchiveList.new(
                    total: map["total"],
                    archives: map["archives"].map { |it| BackupArchive.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "archives": @archives.map { |it| it.to_map }
                }
            end
        end
    end
end
