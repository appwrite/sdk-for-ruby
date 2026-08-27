# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseExecutionColumn
            attr_reader :name
            attr_reader :type

            def initialize(
                name:,
                type:
            )
                @name = name
                @type = type
            end

            def self.from(map:)
                DedicatedDatabaseExecutionColumn.new(
                    name: map["name"],
                    type: map["type"]
                )
            end

            def to_map
                {
                    "name": @name,
                    "type": @type
                }
            end
        end
    end
end
