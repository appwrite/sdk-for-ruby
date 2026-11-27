# frozen_string_literal: true

module Appwrite
    module Models
        class AnalyticsMetricList
            attr_reader :total
            attr_reader :metrics

            def initialize(
                total:,
                metrics:
            )
                @total = total
                @metrics = metrics
            end

            def self.from(map:)
                map = { "total" => 0, "metrics" => [] }.merge(map)
                AnalyticsMetricList.new(
                    total: map["total"],
                    metrics: map["metrics"].map { |it| AnalyticsMetric.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "metrics": @metrics.map { |it| it.to_map }
                }
            end
        end
    end
end
