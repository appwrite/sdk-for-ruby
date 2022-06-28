#frozen_string_literal: true

module Appwrite
    module Models
        class Team
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :total

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                total:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @total = total
            end

            def self.from(map:)
                Team.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    total: map["total"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "total": @total
                }
            end
        end
    end
end