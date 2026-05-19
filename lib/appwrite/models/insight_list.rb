#frozen_string_literal: true

module Appwrite
    module Models
        class InsightList
            attr_reader :total
            attr_reader :insights

            def initialize(
                total:,
                insights:
            )
                @total = total
                @insights = insights
            end

            def self.from(map:)
                InsightList.new(
                    total: map["total"],
                    insights: map["insights"].map { |it| Insight.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "insights": @insights.map { |it| it.to_map }
                }
            end
        end
    end
end
