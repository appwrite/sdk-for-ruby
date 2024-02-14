#frozen_string_literal: true

module Appwrite
    module Models
        class AttributeInteger
            attr_reader :key
            attr_reader :type
            attr_reader :status
            attr_reader :error
            attr_reader :required
            attr_reader :array
            attr_reader :min
            attr_reader :max
            attr_reader :default

            def initialize(
                key:,
                type:,
                status:,
                error:,
                required:,
                array: ,
                min: ,
                max: ,
                default: 
            )
                @key = key
                @type = type
                @status = status
                @error = error
                @required = required
                @array = array
                @min = min
                @max = max
                @default = default
            end

            def self.from(map:)
                AttributeInteger.new(
                    key: map["key"],
                    type: map["type"],
                    status: map["status"],
                    error: map["error"],
                    required: map["required"],
                    array: map["array"],
                    min: map["min"],
                    max: map["max"],
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
                    "min": @min,
                    "max": @max,
                    "default": @default
                }
            end
        end
    end
end
