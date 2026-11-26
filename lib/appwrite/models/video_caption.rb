# frozen_string_literal: true

module Appwrite
    module Models
        class VideoCaption
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :video_id
            attr_reader :bucket_id
            attr_reader :file_id
            attr_reader :name
            attr_reader :language
            attr_reader :default
            attr_reader :embedded
            attr_reader :target_duration
            attr_reader :status
            attr_reader :error
            attr_reader :size

            def initialize(
                id:,
                created_at:,
                updated_at:,
                video_id:,
                bucket_id:,
                file_id:,
                name:,
                language:,
                default:,
                embedded:,
                target_duration:,
                status:,
                error:,
                size:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @video_id = video_id
                @bucket_id = bucket_id
                @file_id = file_id
                @name = name
                @language = language
                @default = default
                @embedded = embedded
                @target_duration = target_duration
                @status = validate_status(status)
                @error = error
                @size = size
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "videoId" => "", "bucketId" => "", "fileId" => "", "name" => "", "language" => "", "default" => false, "embedded" => false, "targetDuration" => 0, "status" => "pending", "error" => "", "size" => 0 }.merge(map)
                VideoCaption.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    video_id: map["videoId"],
                    bucket_id: map["bucketId"],
                    file_id: map["fileId"],
                    name: map["name"],
                    language: map["language"],
                    default: map["default"],
                    embedded: map["embedded"],
                    target_duration: map["targetDuration"],
                    status: map["status"],
                    error: map["error"],
                    size: map["size"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "videoId": @video_id,
                    "bucketId": @bucket_id,
                    "fileId": @file_id,
                    "name": @name,
                    "language": @language,
                    "default": @default,
                    "embedded": @embedded,
                    "targetDuration": @target_duration,
                    "status": @status,
                    "error": @error,
                    "size": @size
                }
            end

            private

            def validate_status(status)
                valid_status = [
                    Appwrite::Enums::VideoCaptionStatus::PENDING,
                    Appwrite::Enums::VideoCaptionStatus::STARTED,
                    Appwrite::Enums::VideoCaptionStatus::READY,
                    Appwrite::Enums::VideoCaptionStatus::ERROR,
                    Appwrite::Enums::VideoCaptionStatus::ABORTED,
                ]

                unless valid_status.include?(status)
                    raise ArgumentError, "Invalid " + status + ". Must be one of: " + valid_status.join(', ')
                end

                status
            end
        end
    end
end
