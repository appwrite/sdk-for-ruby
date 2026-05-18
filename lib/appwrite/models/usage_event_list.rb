#frozen_string_literal: true

module Appwrite
    module Models
        class UsageEventList
            attr_reader :total
            attr_reader :events

            def initialize(
                total:,
                events:
            )
                @total = total
                @events = events
            end

            def self.from(map:)
                UsageEventList.new(
                    total: map["total"],
                    events: map["events"].map { |it| UsageEvent.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "events": @events.map { |it| it.to_map }
                }
            end
        end
    end
end
