# frozen_string_literal: true

module Appwrite
    module Models
        class VideoList
            attr_reader :total
            attr_reader :videos

            def initialize(
                total:,
                videos:
            )
                @total = total
                @videos = videos
            end

            def self.from(map:)
                map = { "total" => 0, "videos" => [] }.merge(map)
                VideoList.new(
                    total: map["total"],
                    videos: map["videos"].map { |it| Video.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "videos": @videos.map { |it| it.to_map }
                }
            end
        end
    end
end
