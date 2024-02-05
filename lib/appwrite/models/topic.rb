#frozen_string_literal: true

module Appwrite
    module Models
        class Topic
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :total
            attr_reader :description

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                total:,
                description: 
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @total = total
                @description = description
            end

            def self.from(map:)
                Topic.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    total: map["total"],
                    description: map["description"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "total": @total,
                    "description": @description
                }
            end
        end
    end
end