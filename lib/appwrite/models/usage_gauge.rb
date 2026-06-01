#frozen_string_literal: true

module Appwrite
    module Models
        class UsageGauge
            attr_reader :metric
            attr_reader :value
            attr_reader :time
            attr_reader :resource_type
            attr_reader :resource_id

            def initialize(
                metric:,
                value:,
                time:,
                resource_type:,
                resource_id:
            )
                @metric = metric
                @value = value
                @time = time
                @resource_type = resource_type
                @resource_id = resource_id
            end

            def self.from(map:)
                UsageGauge.new(
                    metric: map["metric"],
                    value: map["value"],
                    time: map["time"],
                    resource_type: map["resourceType"],
                    resource_id: map["resourceId"]
                )
            end

            def to_map
                {
                    "metric": @metric,
                    "value": @value,
                    "time": @time,
                    "resourceType": @resource_type,
                    "resourceId": @resource_id
                }
            end
        end
    end
end
