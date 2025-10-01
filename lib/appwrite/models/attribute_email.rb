#frozen_string_literal: true

module Appwrite
    module Models
        class AttributeEmail
            attr_reader :key
            attr_reader :type
            attr_reader :status
            attr_reader :error
            attr_reader :required
            attr_reader :array
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :format
            attr_reader :default

            def initialize(
                key:,
                type:,
                status:,
                error:,
                required:,
                array: ,
                created_at:,
                updated_at:,
                format:,
                default: 
            )
                @key = key
                @type = type
                @status = validate_status(status)
                @error = error
                @required = required
                @array = array
                @created_at = created_at
                @updated_at = updated_at
                @format = format
                @default = default
            end

            def self.from(map:)
                AttributeEmail.new(
                    key: map["key"],
                    type: map["type"],
                    status: map["status"],
                    error: map["error"],
                    required: map["required"],
                    array: map["array"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    format: map["format"],
                    default: map["default"]
                )
            end

            def to_map
                {
                    "key": @key,
                    "type": @type,
                    "status": @status,
                    "error": @error,
                    "required": @required,
                    "array": @array,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "format": @format,
                    "default": @default
                }
            end

            private

            def validate_status(status)
                valid_status = [
                    Appwrite::Enums::AttributeStatus::AVAILABLE,
                    Appwrite::Enums::AttributeStatus::PROCESSING,
                    Appwrite::Enums::AttributeStatus::DELETING,
                    Appwrite::Enums::AttributeStatus::STUCK,
                    Appwrite::Enums::AttributeStatus::FAILED,
                ]

                unless valid_status.include?(status)
                    raise ArgumentError, "Invalid " + status + ". Must be one of: " + valid_status.join(', ')
                end

                status
            end

        end
    end
end
