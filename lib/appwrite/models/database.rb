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
            attr_reader :policies
            attr_reader :archives

            def initialize(
                id:,
                name:,
                created_at:,
                updated_at:,
                enabled:,
                type:,
                policies:,
                archives:
            )
                @id = id
                @name = name
                @created_at = created_at
                @updated_at = updated_at
                @enabled = enabled
                @type = validate_type(type)
                @policies = policies
                @archives = archives
            end

            def self.from(map:)
                Database.new(
                    id: map["$id"],
                    name: map["name"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    enabled: map["enabled"],
                    type: map["type"],
                    policies: map["policies"].map { |it| Index.from(map: it) },
                    archives: map["archives"].map { |it| Collection.from(map: it) }
                )
            end

            def to_map
                {
                    "$id": @id,
                    "name": @name,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "enabled": @enabled,
                    "type": @type,
                    "policies": @policies.map { |it| it.to_map },
                    "archives": @archives.map { |it| it.to_map }
                }
            end

            private

            def validate_type(type)
                valid_type = [
                    Appwrite::Enums::DatabaseType::LEGACY,
                    Appwrite::Enums::DatabaseType::TABLESDB,
                    Appwrite::Enums::DatabaseType::DOCUMENTSDB,
                    Appwrite::Enums::DatabaseType::VECTORSDB,
                ]

                unless valid_type.include?(type)
                    raise ArgumentError, "Invalid " + type + ". Must be one of: " + valid_type.join(', ')
                end

                type
            end

        end
    end
end
