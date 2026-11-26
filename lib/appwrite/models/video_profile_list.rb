# frozen_string_literal: true

module Appwrite
    module Models
        class VideoProfileList
            attr_reader :total
            attr_reader :profiles

            def initialize(
                total:,
                profiles:
            )
                @total = total
                @profiles = profiles
            end

            def self.from(map:)
                map = { "total" => 0, "profiles" => [] }.merge(map)
                VideoProfileList.new(
                    total: map["total"],
                    profiles: map["profiles"].map { |it| VideoProfile.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "profiles": @profiles.map { |it| it.to_map }
                }
            end
        end
    end
end
