#frozen_string_literal: true

module Appwrite
    module Models
        class AttributeIp
            attr_reader :key
            attr_reader :type
            attr_reader :status
            attr_reader :error
            attr_reader :required
            attr_reader :array
            attr_reader :format
            attr_reader :default

            def initialize(
                key:,
                type:,
                status:,
                error:,
                required:,
                array: ,
                format:,
                default: 
            )
                @key = key
                @type = type
                @status = status
                @error = error
                @required = required
                @array = array
                @format = format
                @default = default
            end

            def self.from(map:)
                AttributeIp.new(
                    key: map["key"],
                    type: map["type"],
                    status: map["status"],
                    error: map["error"],
                    required: map["required"],
                    array: map["array"],
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
                    "format": @format,
                    "default": @default
                }
            end
        end
    end
end