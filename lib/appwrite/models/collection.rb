#frozen_string_literal: true

module Appwrite
    module Models
        class Collection
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :read
            attr_reader :write
            attr_reader :database_id
            attr_reader :name
            attr_reader :enabled
            attr_reader :permission
            attr_reader :attributes
            attr_reader :indexes

            def initialize(
                id:,
                created_at:,
                updated_at:,
                read:,
                write:,
                database_id:,
                name:,
                enabled:,
                permission:,
                attributes:,
                indexes:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @read = read
                @write = write
                @database_id = database_id
                @name = name
                @enabled = enabled
                @permission = permission
                @attributes = attributes
                @indexes = indexes
            end

            def self.from(map:)
                Collection.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    read: map["$read"],
                    write: map["$write"],
                    database_id: map["databaseId"],
                    name: map["name"],
                    enabled: map["enabled"],
                    permission: map["permission"],
                    attributes: map["attributes"],
                    indexes: map["indexes"].map { |it| Index.from(map: it) }
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "$read": @read,
                    "$write": @write,
                    "databaseId": @database_id,
                    "name": @name,
                    "enabled": @enabled,
                    "permission": @permission,
                    "attributes": @attributes,
                    "indexes": @indexes.map { |it| it.to_map }
                }
            end
        end
    end
end