#frozen_string_literal: true

module Appwrite
    module Models
        class AttributeString
            attr_reader :key
            attr_reader :type
            attr_reader :status
            attr_reader :error
            attr_reader :required
            attr_reader :array
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :size
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
                size:,
                default: ,
                encrypt: 
            )
                @key = key
                @type = type
                @status = status
                @error = error
                @required = required
                @array = array
                @created_at = created_at
                @updated_at = updated_at
                @size = size
                @default = default
                @encrypt = encrypt
            end

            def self.from(map:)
                AttributeString.new(
                    key: map["key"],
                    type: map["type"],
                    status: map["status"],
                    error: map["error"],
                    required: map["required"],
                    array: map["array"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    size: map["size"],
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
                    "size": @size,
                    "default": @default,
                    "encrypt": @encrypt
                }
            end
        end
    end
end
