# frozen_string_literal: true

module Appwrite
    module Models
        class AnalyticsAnnotationList
            attr_reader :total
            attr_reader :annotations

            def initialize(
                total:,
                annotations:
            )
                @total = total
                @annotations = annotations
            end

            def self.from(map:)
                map = { "total" => 0, "annotations" => [] }.merge(map)
                AnalyticsAnnotationList.new(
                    total: map["total"],
                    annotations: map["annotations"].map { |it| AnalyticsAnnotation.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "annotations": @annotations.map { |it| it.to_map }
                }
            end
        end
    end
end
