#frozen_string_literal: true

module Appwrite
    module Models
        class AlgoSha
            attr_reader :type

            def initialize(
                type:
            )
                @type = type
            end

            def self.from(map:)
                AlgoSha.new(
                    type: map["type"]
                )
            end

            def to_map
                {
                    "type": @type
                }
            end
        end
    end
end
