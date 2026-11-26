# frozen_string_literal: true

module Appwrite
    module Models
        class VideoRendition
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :video_id
            attr_reader :profile_id
            attr_reader :name
            attr_reader :started_at
            attr_reader :ended_at
            attr_reader :width
            attr_reader :height
            attr_reader :video_bit_rate
            attr_reader :audio_bit_rate
            attr_reader :target_duration
            attr_reader :status
            attr_reader :error
            attr_reader :progress
            attr_reader :output
            attr_reader :codec
            attr_reader :size

            def initialize(
                id:,
                created_at:,
                updated_at:,
                video_id:,
                profile_id:,
                name:,
                started_at:,
                ended_at:,
                width:,
                height:,
                video_bit_rate:,
                audio_bit_rate:,
                target_duration:,
                status:,
                error:,
                progress:,
                output:,
                codec:,
                size:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @video_id = video_id
                @profile_id = profile_id
                @name = name
                @started_at = started_at
                @ended_at = ended_at
                @width = width
                @height = height
                @video_bit_rate = video_bit_rate
                @audio_bit_rate = audio_bit_rate
                @target_duration = target_duration
                @status = validate_status(status)
                @error = error
                @progress = progress
                @output = validate_output(output)
                @codec = validate_codec(codec)
                @size = size
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "videoId" => "", "profileId" => "", "name" => "", "startedAt" => "", "endedAt" => "", "width" => 0, "height" => 0, "videoBitRate" => 0, "audioBitRate" => 0, "targetDuration" => 0, "status" => "pending", "error" => "", "progress" => 0, "output" => "hls", "codec" => "h264", "size" => 0 }.merge(map)
                VideoRendition.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    video_id: map["videoId"],
                    profile_id: map["profileId"],
                    name: map["name"],
                    started_at: map["startedAt"],
                    ended_at: map["endedAt"],
                    width: map["width"],
                    height: map["height"],
                    video_bit_rate: map["videoBitRate"],
                    audio_bit_rate: map["audioBitRate"],
                    target_duration: map["targetDuration"],
                    status: map["status"],
                    error: map["error"],
                    progress: map["progress"],
                    output: map["output"],
                    codec: map["codec"],
                    size: map["size"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "videoId": @video_id,
                    "profileId": @profile_id,
                    "name": @name,
                    "startedAt": @started_at,
                    "endedAt": @ended_at,
                    "width": @width,
                    "height": @height,
                    "videoBitRate": @video_bit_rate,
                    "audioBitRate": @audio_bit_rate,
                    "targetDuration": @target_duration,
                    "status": @status,
                    "error": @error,
                    "progress": @progress,
                    "output": @output,
                    "codec": @codec,
                    "size": @size
                }
            end

            private

            def validate_status(status)
                valid_status = [
                    Appwrite::Enums::VideoRenditionStatus::PENDING,
                    Appwrite::Enums::VideoRenditionStatus::STARTED,
                    Appwrite::Enums::VideoRenditionStatus::ENDED,
                    Appwrite::Enums::VideoRenditionStatus::READY,
                    Appwrite::Enums::VideoRenditionStatus::ERROR,
                    Appwrite::Enums::VideoRenditionStatus::ABORTED,
                ]

                unless valid_status.include?(status)
                    raise ArgumentError, "Invalid " + status + ". Must be one of: " + valid_status.join(', ')
                end

                status
            end

            def validate_output(output)
                valid_output = [
                    Appwrite::Enums::VideoOutput::HLS,
                    Appwrite::Enums::VideoOutput::DASH,
                    Appwrite::Enums::VideoOutput::CMAF,
                ]

                unless valid_output.include?(output)
                    raise ArgumentError, "Invalid " + output + ". Must be one of: " + valid_output.join(', ')
                end

                output
            end

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
