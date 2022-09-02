#frozen_string_literal: true

module Appwrite
    module Models
        class AttributeBoolean
            attr_reader :key
            attr_reader :type
            attr_reader :status
            attr_reader :required
            attr_reader :array
            attr_reader :default

            def initialize(
                key:,
                type:,
                status:,
                required:,
                array:,
                default:
            )
                @key = key
                @type = type
                @status = status
                @required = required
                @array = array
                @default = default
            end

            def self.from(map:)
                AttributeBoolean.new(
                    key: map["key"],
                    type: map["type"],
                    status: map["status"],
                    required: map["required"],
                    array: map["array"],
                    default: map["default"]
                )
            end

            def to_map
                {
                    "key": @key,
                    "type": @type,
                    "status": @status,
                    "required": @required,
                    "array": @array,
                    "default": @default
                }
            end
        end
    end
end