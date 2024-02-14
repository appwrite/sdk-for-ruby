#frozen_string_literal: true

module Appwrite
    module Models
        class Collection
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :permissions
            attr_reader :database_id
            attr_reader :name
            attr_reader :enabled
            attr_reader :document_security
            attr_reader :attributes
            attr_reader :indexes

            def initialize(
                id:,
                created_at:,
                updated_at:,
                permissions:,
                database_id:,
                name:,
                enabled:,
                document_security:,
                attributes:,
                indexes:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @permissions = permissions
                @database_id = database_id
                @name = name
                @enabled = enabled
                @document_security = document_security
                @attributes = attributes
                @indexes = indexes
            end

            def self.from(map:)
                Collection.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    permissions: map["$permissions"],
                    database_id: map["databaseId"],
                    name: map["name"],
                    enabled: map["enabled"],
                    document_security: map["documentSecurity"],
                    attributes: map["attributes"],
                    indexes: map["indexes"].map { |it| Index.from(map: it) }
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "$permissions": @permissions,
                    "databaseId": @database_id,
                    "name": @name,
                    "enabled": @enabled,
                    "documentSecurity": @document_security,
                    "attributes": @attributes,
                    "indexes": @indexes.map { |it| it.to_map }
                }
            end
        end
    end
end
