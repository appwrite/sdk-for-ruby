# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabasePITRWindows
            attr_reader :earliest
            attr_reader :latest

            def initialize(
                earliest:,
                latest:
            )
                @earliest = earliest
                @latest = latest
            end

            def self.from(map:)
                DedicatedDatabasePITRWindows.new(
                    earliest: map["earliest"],
                    latest: map["latest"]
                )
            end

            def to_map
                {
                    "earliest": @earliest,
                    "latest": @latest
                }
            end
        end
    end
end
