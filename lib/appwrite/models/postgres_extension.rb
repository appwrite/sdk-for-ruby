# frozen_string_literal: true

module Appwrite
    module Models
        class PostgresExtension
            attr_reader :key
            attr_reader :name
            attr_reader :description
            attr_reader :category

            def initialize(
                key:,
                name:,
                description:,
                category:
            )
                @key = key
                @name = name
                @description = description
                @category = category
            end

            def self.from(map:)
                PostgresExtension.new(
                    key: map["key"],
                    name: map["name"],
                    description: map["description"],
                    category: map["category"]
                )
            end

            def to_map
                {
                    "key": @key,
                    "name": @name,
                    "description": @description,
                    "category": @category
                }
            end
        end
    end
end
