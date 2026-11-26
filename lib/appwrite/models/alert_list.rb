# frozen_string_literal: true

module Appwrite
    module Models
        class AlertList
            attr_reader :total
            attr_reader :alerts

            def initialize(
                total:,
                alerts:
            )
                @total = total
                @alerts = alerts
            end

            def self.from(map:)
                map = { "total" => 0, "alerts" => [] }.merge(map)
                AlertList.new(
                    total: map["total"],
                    alerts: map["alerts"].map { |it| Alert.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "alerts": @alerts.map { |it| it.to_map }
                }
            end
        end
    end
end
