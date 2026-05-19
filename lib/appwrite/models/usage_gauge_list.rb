#frozen_string_literal: true

module Appwrite
    module Models
        class UsageGaugeList
            attr_reader :total
            attr_reader :gauges

            def initialize(
                total:,
                gauges:
            )
                @total = total
                @gauges = gauges
            end

            def self.from(map:)
                UsageGaugeList.new(
                    total: map["total"],
                    gauges: map["gauges"].map { |it| UsageGauge.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "gauges": @gauges.map { |it| it.to_map }
                }
            end
        end
    end
end
