# frozen_string_literal: true

module Appwrite
    module Models
        class Country
            attr_reader :name
            attr_reader :code

            def initialize(
                name:,
                code:
            )
                @name = name
                @code = code
            end

            def self.from(map:)
                map = { "name" => "", "code" => "" }.merge(map)
                Country.new(
                    name: map["name"],
                    code: map["code"]
                )
            end

            def to_map
                {
                    "name": @name,
                    "code": @code
                }
            end
        end
    end
end
