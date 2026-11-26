# frozen_string_literal: true

module Appwrite
    module Models
        class VideoRenditionList
            attr_reader :total
            attr_reader :renditions

            def initialize(
                total:,
                renditions:
            )
                @total = total
                @renditions = renditions
            end

            def self.from(map:)
                map = { "total" => 0, "renditions" => [] }.merge(map)
                VideoRenditionList.new(
                    total: map["total"],
                    renditions: map["renditions"].map { |it| VideoRendition.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "renditions": @renditions.map { |it| it.to_map }
                }
            end
        end
    end
end
