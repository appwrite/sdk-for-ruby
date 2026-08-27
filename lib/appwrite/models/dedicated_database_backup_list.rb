# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseBackupList
            attr_reader :total
            attr_reader :backups

            def initialize(
                total:,
                backups:
            )
                @total = total
                @backups = backups
            end

            def self.from(map:)
                DedicatedDatabaseBackupList.new(
                    total: map["total"],
                    backups: map["backups"].map { |it| DedicatedDatabaseBackup.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "backups": @backups.map { |it| it.to_map }
                }
            end
        end
    end
end
