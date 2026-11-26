# frozen_string_literal: true

module Appwrite
    module Models
        class MonitorList
            attr_reader :total
            attr_reader :monitors

            def initialize(
                total:,
                monitors:
            )
                @total = total
                @monitors = monitors
            end

            def self.from(map:)
                map = { "total" => 0, "monitors" => [] }.merge(map)
                MonitorList.new(
                    total: map["total"],
                    monitors: map["monitors"].map { |it| Monitor.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "monitors": @monitors.map { |it| it.to_map }
                }
            end
        end
    end
end
