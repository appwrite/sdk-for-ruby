# frozen_string_literal: true

module Appwrite
    module Models
        class VideoCaptionList
            attr_reader :total
            attr_reader :captions

            def initialize(
                total:,
                captions:
            )
                @total = total
                @captions = captions
            end

            def self.from(map:)
                map = { "total" => 0, "captions" => [] }.merge(map)
                VideoCaptionList.new(
                    total: map["total"],
                    captions: map["captions"].map { |it| VideoCaption.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "captions": @captions.map { |it| it.to_map }
                }
            end
        end
    end
end
