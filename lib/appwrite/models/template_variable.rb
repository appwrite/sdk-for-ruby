#frozen_string_literal: true

module Appwrite
    module Models
        class TemplateVariable
            attr_reader :name
            attr_reader :description
            attr_reader :value
            attr_reader :placeholder
            attr_reader :required
            attr_reader :type

            def initialize(
                name:,
                description:,
                value:,
                placeholder:,
                required:,
                type:
            )
                @name = name
                @description = description
                @value = value
                @placeholder = placeholder
                @required = required
                @type = type
            end

            def self.from(map:)
                TemplateVariable.new(
                    name: map["name"],
                    description: map["description"],
                    value: map["value"],
                    placeholder: map["placeholder"],
                    required: map["required"],
                    type: map["type"]
                )
            end

            def to_map
                {
                    "name": @name,
                    "description": @description,
                    "value": @value,
                    "placeholder": @placeholder,
                    "required": @required,
                    "type": @type
                }
            end
        end
    end
end
