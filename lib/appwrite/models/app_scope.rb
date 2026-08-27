# frozen_string_literal: true

module Appwrite
    module Models
        class AppScope
            attr_reader :value
            attr_reader :description
            attr_reader :type
            attr_reader :category
            attr_reader :deprecated

            def initialize(
                value:,
                description:,
                type:,
                category:,
                deprecated:
            )
                @value = value
                @description = description
                @type = type
                @category = category
                @deprecated = deprecated
            end

            def self.from(map:)
                AppScope.new(
                    value: map["value"],
                    description: map["description"],
                    type: map["type"],
                    category: map["category"],
                    deprecated: map["deprecated"]
                )
            end

            def to_map
                {
                    "value": @value,
                    "description": @description,
                    "type": @type,
                    "category": @category,
                    "deprecated": @deprecated
                }
            end
        end
    end
end
