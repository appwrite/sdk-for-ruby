#frozen_string_literal: true

module Appwrite
    module Models
        class Database
            attr_reader :id
            attr_reader :name
            attr_reader :created_at
            attr_reader :updated_at

            def initialize(
                id:,
                name:,
                created_at:,
                updated_at:
            )
                @id = id
                @name = name
                @created_at = created_at
                @updated_at = updated_at
            end

            def self.from(map:)
                Database.new(
                    id: map["$id"],
                    name: map["name"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "name": @name,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at
                }
            end
        end
    end
end