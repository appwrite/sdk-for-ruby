#frozen_string_literal: true

module Appwrite
    module Models
        class ActivityEventList
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
                ActivityEventList.new(
                    total: map["total"],
                    events: map["events"].map { |it| ActivityEvent.from(map: it) }
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
