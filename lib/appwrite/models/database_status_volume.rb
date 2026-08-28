# frozen_string_literal: true

module Appwrite
    module Models
        class DatabaseStatusVolume
            attr_reader :xpath
            attr_reader :used_percent
            attr_reader :available
            attr_reader :mounted

            def initialize(
                xpath:,
                used_percent:,
                available:,
                mounted:
            )
                @xpath = xpath
                @used_percent = used_percent
                @available = available
                @mounted = mounted
            end

            def self.from(map:)
                DatabaseStatusVolume.new(
                    xpath: map["path"],
                    used_percent: map["usedPercent"],
                    available: map["available"],
                    mounted: map["mounted"]
                )
            end

            def to_map
                {
                    "path": @xpath,
                    "usedPercent": @used_percent,
                    "available": @available,
                    "mounted": @mounted
                }
            end
        end
    end
end
