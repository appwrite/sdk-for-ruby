#frozen_string_literal: true

module Appwrite
    module Models
        class HealthQueue
            attr_reader :size

            def initialize(
                size:
            )
                @size = size
            end

            def self.from(map:)
                HealthQueue.new(
                    size: map["size"]
                )
            end

            def to_map
                {
                    "size": @size
                }
            end
        end
    end
end