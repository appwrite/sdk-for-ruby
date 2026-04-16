#frozen_string_literal: true

module Appwrite
    module Models
        class PlatformAndroid
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :type
            attr_reader :application_id

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                type:,
                application_id:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @type = validate_type(type)
                @application_id = application_id
            end

            def self.from(map:)
                PlatformAndroid.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    type: map["type"],
                    application_id: map["applicationId"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "type": @type,
                    "applicationId": @application_id
                }
            end

            private

            def validate_type(type)
                valid_type = [
                    Appwrite::Enums::PlatformType::WINDOWS,
                    Appwrite::Enums::PlatformType::APPLE,
                    Appwrite::Enums::PlatformType::ANDROID,
                    Appwrite::Enums::PlatformType::LINUX,
                    Appwrite::Enums::PlatformType::WEB,
                ]

                unless valid_type.include?(type)
                    raise ArgumentError, "Invalid " + type + ". Must be one of: " + valid_type.join(', ')
                end

                type
            end

        end
    end
end
