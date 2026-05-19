#frozen_string_literal: true

module Appwrite
    module Models
        class UsageGauge
            attr_reader :metric
            attr_reader :value
            attr_reader :time

            def initialize(
                metric:,
                value:,
                time:
            )
                @metric = metric
                @value = value
                @time = time
            end

            def self.from(map:)
                UsageGauge.new(
                    metric: map["metric"],
                    value: map["value"],
                    time: map["time"]
                )
            end

            def to_map
                {
                    "metric": @metric,
                    "value": @value,
                    "time": @time
                }
            end
        end
    end
end
