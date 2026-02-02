#frozen_string_literal: true

module Appwrite
    module Models
        class HealthStatusList
            attr_reader :total
            attr_reader :statuses

            def initialize(
                total:,
                statuses:
            )
                @total = total
                @statuses = statuses
            end

            def self.from(map:)
                HealthStatusList.new(
                    total: map["total"],
                    statuses: map["statuses"].map { |it| HealthStatus.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "statuses": @statuses.map { |it| it.to_map }
                }
            end
        end
    end
end
