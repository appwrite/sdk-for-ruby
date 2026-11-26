# frozen_string_literal: true

module Appwrite
    module Models
        class Video
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :permissions
            attr_reader :bucket_id
            attr_reader :file_id
            attr_reader :name
            attr_reader :size
            attr_reader :format
            attr_reader :duration
            attr_reader :width
            attr_reader :height
            attr_reader :aspect_ratio
            attr_reader :video_codec
            attr_reader :video_format
            attr_reader :video_format_profile
            attr_reader :video_bit_rate
            attr_reader :video_frame_rate
            attr_reader :video_frame_rate_mode
            attr_reader :audio_codec
            attr_reader :audio_format
            attr_reader :audio_bit_rate
            attr_reader :audio_sample_rate
            attr_reader :timeline_status
            attr_reader :timeline_error

            def initialize(
                id:,
                created_at:,
                updated_at:,
                permissions:,
                bucket_id:,
                file_id:,
                name:,
                size:,
                format:,
                duration:,
                width:,
                height:,
                aspect_ratio:,
                video_codec:,
                video_format:,
                video_format_profile:,
                video_bit_rate:,
                video_frame_rate:,
                video_frame_rate_mode:,
                audio_codec:,
                audio_format:,
                audio_bit_rate:,
                audio_sample_rate:,
                timeline_status:,
                timeline_error:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @permissions = permissions
                @bucket_id = bucket_id
                @file_id = file_id
                @name = name
                @size = size
                @format = format
                @duration = duration
                @width = width
                @height = height
                @aspect_ratio = aspect_ratio
                @video_codec = video_codec
                @video_format = video_format
                @video_format_profile = video_format_profile
                @video_bit_rate = video_bit_rate
                @video_frame_rate = video_frame_rate
                @video_frame_rate_mode = video_frame_rate_mode
                @audio_codec = audio_codec
                @audio_format = audio_format
                @audio_bit_rate = audio_bit_rate
                @audio_sample_rate = audio_sample_rate
                @timeline_status = validate_timeline_status(timeline_status)
                @timeline_error = timeline_error
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "$permissions" => [], "bucketId" => "", "fileId" => "", "name" => "", "size" => 0, "format" => "", "duration" => 0, "width" => 0, "height" => 0, "aspectRatio" => "", "videoCodec" => "", "videoFormat" => "", "videoFormatProfile" => "", "videoBitRate" => 0, "videoFrameRate" => 0, "videoFrameRateMode" => "", "audioCodec" => "", "audioFormat" => "", "audioBitRate" => 0, "audioSampleRate" => 0, "timelineStatus" => "pending", "timelineError" => "" }.merge(map)
                Video.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    permissions: map["$permissions"],
                    bucket_id: map["bucketId"],
                    file_id: map["fileId"],
                    name: map["name"],
                    size: map["size"],
                    format: map["format"],
                    duration: map["duration"],
                    width: map["width"],
                    height: map["height"],
                    aspect_ratio: map["aspectRatio"],
                    video_codec: map["videoCodec"],
                    video_format: map["videoFormat"],
                    video_format_profile: map["videoFormatProfile"],
                    video_bit_rate: map["videoBitRate"],
                    video_frame_rate: map["videoFrameRate"],
                    video_frame_rate_mode: map["videoFrameRateMode"],
                    audio_codec: map["audioCodec"],
                    audio_format: map["audioFormat"],
                    audio_bit_rate: map["audioBitRate"],
                    audio_sample_rate: map["audioSampleRate"],
                    timeline_status: map["timelineStatus"],
                    timeline_error: map["timelineError"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "$permissions": @permissions,
                    "bucketId": @bucket_id,
                    "fileId": @file_id,
                    "name": @name,
                    "size": @size,
                    "format": @format,
                    "duration": @duration,
                    "width": @width,
                    "height": @height,
                    "aspectRatio": @aspect_ratio,
                    "videoCodec": @video_codec,
                    "videoFormat": @video_format,
                    "videoFormatProfile": @video_format_profile,
                    "videoBitRate": @video_bit_rate,
                    "videoFrameRate": @video_frame_rate,
                    "videoFrameRateMode": @video_frame_rate_mode,
                    "audioCodec": @audio_codec,
                    "audioFormat": @audio_format,
                    "audioBitRate": @audio_bit_rate,
                    "audioSampleRate": @audio_sample_rate,
                    "timelineStatus": @timeline_status,
                    "timelineError": @timeline_error
                }
            end

            private

            def validate_timeline_status(timeline_status)
                valid_timeline_status = [
                    Appwrite::Enums::VideoTimelineStatus::PENDING,
                    Appwrite::Enums::VideoTimelineStatus::STARTED,
                    Appwrite::Enums::VideoTimelineStatus::READY,
                    Appwrite::Enums::VideoTimelineStatus::SKIPPED,
                    Appwrite::Enums::VideoTimelineStatus::ERROR,
                ]

                unless valid_timeline_status.include?(timeline_status)
                    raise ArgumentError, "Invalid " + timeline_status + ". Must be one of: " + valid_timeline_status.join(', ')
                end

                timeline_status
            end
        end
    end
end
