#frozen_string_literal: true

module Appwrite
    module Models
        class DatabaseList
            attr_reader :total
            attr_reader :databases

            def initialize(
                total:,
                databases:
            )
                @total = total
                @databases = databases
            end

            def self.from(map:)
                DatabaseList.new(
                    total: map["total"],
                    databases: map["databases"].map { |it| Database.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "databases": @databases.map { |it| it.to_map }
                }
            end
        end
    end
end