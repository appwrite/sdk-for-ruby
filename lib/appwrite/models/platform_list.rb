# frozen_string_literal: true

module Appwrite
    module Models
        class PlatformList
            attr_reader :total
            attr_reader :platforms

            def initialize(
                total:,
                platforms:
            )
                @total = total
                @platforms = platforms
            end

            def self.from(map:)
                map = { "total" => 0, "platforms" => [] }.merge(map)
                PlatformList.new(
                    total: map["total"],
                    platforms: map["platforms"]
                )
            end

            def to_map
                {
                    "total": @total,
                    "platforms": @platforms
                }
            end
        end
    end
end
