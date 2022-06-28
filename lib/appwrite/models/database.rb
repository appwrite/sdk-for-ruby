#frozen_string_literal: true

module Appwrite
    module Models
        class Database
            attr_reader :id
            attr_reader :name

            def initialize(
                id:,
                name:
            )
                @id = id
                @name = name
            end

            def self.from(map:)
                Database.new(
                    id: map["$id"],
                    name: map["name"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "name": @name
                }
            end
        end
    end
end