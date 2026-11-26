# frozen_string_literal: true

module Appwrite
    module Models
        class VideoProfile
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :codec
            attr_reader :video_bit_rate
            attr_reader :audio_bit_rate
            attr_reader :width
            attr_reader :height

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                codec:,
                video_bit_rate:,
                audio_bit_rate:,
                width:,
                height:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @codec = validate_codec(codec)
                @video_bit_rate = video_bit_rate
                @audio_bit_rate = audio_bit_rate
                @width = width
                @height = height
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "name" => "", "codec" => "h264", "videoBitRate" => 0, "audioBitRate" => 0, "width" => 0, "height" => 0 }.merge(map)
                VideoProfile.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    codec: map["codec"],
                    video_bit_rate: map["videoBitRate"],
                    audio_bit_rate: map["audioBitRate"],
                    width: map["width"],
                    height: map["height"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "codec": @codec,
                    "videoBitRate": @video_bit_rate,
                    "audioBitRate": @audio_bit_rate,
                    "width": @width,
                    "height": @height
                }
            end

            private

            def validate_codec(codec)
                valid_codec = [
                    Appwrite::Enums::VideoCodecId::H264,
                    Appwrite::Enums::VideoCodecId::HEVC,
                    Appwrite::Enums::VideoCodecId::VP9,
                ]

                unless valid_codec.include?(codec)
                    raise ArgumentError, "Invalid " + codec + ". Must be one of: " + valid_codec.join(', ')
                end

                codec
            end
        end
    end
end
