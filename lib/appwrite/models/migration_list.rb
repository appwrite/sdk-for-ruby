# frozen_string_literal: true

module Appwrite
    module Models
        class MigrationList
            attr_reader :total
            attr_reader :migrations

            def initialize(
                total:,
                migrations:
            )
                @total = total
                @migrations = migrations
            end

            def self.from(map:)
                map = { "total" => 0, "migrations" => [] }.merge(map)
                MigrationList.new(
                    total: map["total"],
                    migrations: map["migrations"].map { |it| Migration.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "migrations": @migrations.map { |it| it.to_map }
                }
            end
        end
    end
end
