#frozen_string_literal: true

module Appwrite
    module Models
        class AlgoBcrypt
            attr_reader :type

            def initialize(
                type:
            )
                @type = type
            end

            def self.from(map:)
                AlgoBcrypt.new(
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
