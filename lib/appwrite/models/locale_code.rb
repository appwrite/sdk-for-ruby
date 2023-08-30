#frozen_string_literal: true

module Appwrite
    module Models
        class LocaleCode
            attr_reader :code
            attr_reader :name

            def initialize(
                code:,
                name:
            )
                @code = code
                @name = name
            end

            def self.from(map:)
                LocaleCode.new(
                    code: map["code"],
                    name: map["name"]
                )
            end

            def to_map
                {
                    "code": @code,
                    "name": @name
                }
            end
        end
    end
end