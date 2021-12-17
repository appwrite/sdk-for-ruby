#frozen_string_literal: true

module Appwrite
    module Models
        class Language
            attr_reader :name
            attr_reader :code
            attr_reader :native_name

            def initialize(
                name:,
                code:,
                native_name:
            )
                @name = name
                @code = code
                @native_name = native_name
            end

            def self.from(map:)
                Language.new(
                    name: map["name"],
                    code: map["code"],
                    native_name: map["nativeName"]
                )
            end

            def to_map
                {
                    "name": @name,
                    "code": @code,
                    "nativeName": @native_name
                }
            end
        end
    end
end