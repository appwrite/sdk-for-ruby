#frozen_string_literal: true

module Appwrite
    module Models
        class Database
            attr_reader :id
            attr_reader :name
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :enabled
            attr_reader :type

            def initialize(
                id:,
                name:,
                created_at:,
                updated_at:,
                enabled:,
                type:
            )
                @id = id
                @name = name
                @created_at = created_at
                @updated_at = updated_at
                @enabled = enabled
                @type = validate_type(type)
            end

            def self.from(map:)
                Database.new(
                    id: map["$id"],
                    name: map["name"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    enabled: map["enabled"],
                    type: map["type"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "name": @name,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "enabled": @enabled,
                    "type": @type
                }
            end

            private

            def validate_type(type)
                valid_type = [
                    Appwrite::Enums::DatabaseType::LEGACY,
                    Appwrite::Enums::DatabaseType::TABLESDB,
                ]

                unless valid_type.include?(type)
                    raise ArgumentError, "Invalid " + type + ". Must be one of: " + valid_type.join(', ')
                end

                type
            end

        end
    end
end
