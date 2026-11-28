# frozen_string_literal: true

module Appwrite
    module Models
        class AnalyticsPropertyList
            attr_reader :total
            attr_reader :properties

            def initialize(
                total:,
                properties:
            )
                @total = total
                @properties = properties
            end

            def self.from(map:)
                map = { "total" => 0, "properties" => [] }.merge(map)
                AnalyticsPropertyList.new(
                    total: map["total"],
                    properties: map["properties"].map { |it| AnalyticsProperty.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "properties": @properties.map { |it| it.to_map }
                }
            end
        end
    end
end
