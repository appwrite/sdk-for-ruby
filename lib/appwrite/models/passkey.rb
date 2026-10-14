# frozen_string_literal: true

module Appwrite
    module Models
        class Passkey
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :accessed_at

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                accessed_at:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @accessed_at = accessed_at
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "name" => "", "accessedAt" => "" }.merge(map)
                Passkey.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    accessed_at: map["accessedAt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "accessedAt": @accessed_at
                }
            end
        end
    end
end
