#frozen_string_literal: true

module Appwrite
    module Models
        class AttributeList
            attr_reader :sum
            attr_reader :attributes

            def initialize(
                sum:,
                attributes:
            )
                @sum = sum
                @attributes = attributes
            end

            def self.from(map:)
                AttributeList.new(
                    sum: map["sum"],
                    attributes: map["attributes"]
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "attributes": @attributes
                }
            end
        end
    end
end