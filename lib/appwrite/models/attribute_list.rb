# frozen_string_literal: true

module Appwrite
    module Models
        class AttributeList
            attr_reader :total
            attr_reader :attributes

            def initialize(
                total:,
                attributes:
            )
                @total = total
                @attributes = attributes
            end

            def self.from(map:)
                map = { "total" => 0 }.merge(map)
                AttributeList.new(
                    total: map["total"],
                    attributes: map["attributes"]
                )
            end

            def to_map
                {
                    "total": @total,
                    "attributes": @attributes
                }
            end
        end
    end
end
