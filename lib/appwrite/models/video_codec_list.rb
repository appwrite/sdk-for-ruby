# frozen_string_literal: true

module Appwrite
    module Models
        class VideoCodecList
            attr_reader :total
            attr_reader :codecs

            def initialize(
                total:,
                codecs:
            )
                @total = total
                @codecs = codecs
            end

            def self.from(map:)
                map = { "total" => 0, "codecs" => [] }.merge(map)
                VideoCodecList.new(
                    total: map["total"],
                    codecs: map["codecs"].map { |it| VideoCodec.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "codecs": @codecs.map { |it| it.to_map }
                }
            end
        end
    end
end
