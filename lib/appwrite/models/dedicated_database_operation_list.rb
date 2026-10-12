# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseOperationList
            attr_reader :total
            attr_reader :operations

            def initialize(
                total:,
                operations:
            )
                @total = total
                @operations = operations
            end

            def self.from(map:)
                map = { "total" => 0 }.merge(map)
                DedicatedDatabaseOperationList.new(
                    total: map["total"],
                    operations: map["operations"].map { |it| DedicatedDatabaseOperation.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "operations": @operations.map { |it| it.to_map }
                }
            end
        end
    end
end
