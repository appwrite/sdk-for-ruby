#frozen_string_literal: true

module Appwrite
    module Models
        class Rule
            attr_reader :id
            attr_reader :collection
            attr_reader :type
            attr_reader :key
            attr_reader :label
            attr_reader :default
            attr_reader :array
            attr_reader :required
            attr_reader :list

            def initialize(
                id:,
                collection:,
                type:,
                key:,
                label:,
                default:,
                array:,
                required:,
                list:
            )
                @id = id
                @collection = collection
                @type = type
                @key = key
                @label = label
                @default = default
                @array = array
                @required = required
                @list = list
            end

            def self.from(map:)
                Rule.new(
                    id: map["$id"],
                    collection: map["$collection"],
                    type: map["type"],
                    key: map["key"],
                    label: map["label"],
                    default: map["default"],
                    array: map["array"],
                    required: map["required"],
                    list: map["list"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$collection": @collection,
                    "type": @type,
                    "key": @key,
                    "label": @label,
                    "default": @default,
                    "array": @array,
                    "required": @required,
                    "list": @list
                }
            end
        end
    end
end