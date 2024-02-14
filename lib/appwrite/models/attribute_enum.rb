#frozen_string_literal: true

module Appwrite
    module Models
        class AttributeEnum
            attr_reader :key
            attr_reader :type
            attr_reader :status
            attr_reader :error
            attr_reader :required
            attr_reader :array
            attr_reader :elements
            attr_reader :format
            attr_reader :default

            def initialize(
                key:,
                type:,
                status:,
                error:,
                required:,
                array: ,
                elements:,
                format:,
                default: 
            )
                @key = key
                @type = type
                @status = status
                @error = error
                @required = required
                @array = array
                @elements = elements
                @format = format
                @default = default
            end

            def self.from(map:)
                AttributeEnum.new(
                    key: map["key"],
                    type: map["type"],
                    status: map["status"],
                    error: map["error"],
                    required: map["required"],
                    array: map["array"],
                    elements: map["elements"],
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
                    "elements": @elements,
                    "format": @format,
                    "default": @default
                }
            end
        end
    end
end
