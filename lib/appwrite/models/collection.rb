#frozen_string_literal: true

module Appwrite
    module Models
        class Collection
            attr_reader :id
            attr_reader :read
            attr_reader :write
            attr_reader :name
            attr_reader :enabled
            attr_reader :permission
            attr_reader :attributes
            attr_reader :indexes

            def initialize(
                id:,
                read:,
                write:,
                name:,
                enabled:,
                permission:,
                attributes:,
                indexes:
            )
                @id = id
                @read = read
                @write = write
                @name = name
                @enabled = enabled
                @permission = permission
                @attributes = attributes
                @indexes = indexes
            end

            def self.from(map:)
                Collection.new(
                    id: map["$id"],
                    read: map["$read"],
                    write: map["$write"],
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
                    "$read": @read,
                    "$write": @write,
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