#frozen_string_literal: true

module Appwrite
    module Models
        class ColumnText
            attr_reader :key
            attr_reader :type
            attr_reader :status
            attr_reader :error
            attr_reader :required
            attr_reader :array
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :default
            attr_reader :encrypt

            def initialize(
                key:,
                type:,
                status:,
                error:,
                required:,
                array: ,
                created_at:,
                updated_at:,
                default: ,
                encrypt: 
            )
                @key = key
                @type = type
                @status = validate_status(status)
                @error = error
                @required = required
                @array = array
                @created_at = created_at
                @updated_at = updated_at
                @default = default
                @encrypt = encrypt
            end

            def self.from(map:)
                ColumnText.new(
                    key: map["key"],
                    type: map["type"],
                    status: map["status"],
                    error: map["error"],
                    required: map["required"],
                    array: map["array"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    default: map["default"],
                    encrypt: map["encrypt"]
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
                    "default": @default,
                    "encrypt": @encrypt
                }
            end

            private

            def validate_status(status)
                valid_status = [
                    Appwrite::Enums::ColumnStatus::AVAILABLE,
                    Appwrite::Enums::ColumnStatus::PROCESSING,
                    Appwrite::Enums::ColumnStatus::DELETING,
                    Appwrite::Enums::ColumnStatus::STUCK,
                    Appwrite::Enums::ColumnStatus::FAILED,
                ]

                unless valid_status.include?(status)
                    raise ArgumentError, "Invalid " + status + ". Must be one of: " + valid_status.join(', ')
                end

                status
            end

        end
    end
end
