#frozen_string_literal: true

module Appwrite
    module Models
        class Preferences

            def initialize(
                data:
            )
                @data = data
            end

            def self.from(map:)
                Preferences.new(
                    data: map["data"]
                )
            end

            def to_map
                {
                    "data": @data
                }
            end

            def convert_to(from_json)
                from_json.call(data)
            end
        end
    end
end