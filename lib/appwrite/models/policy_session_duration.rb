#frozen_string_literal: true

module Appwrite
    module Models
        class PolicySessionDuration
            attr_reader :id
            attr_reader :duration

            def initialize(
                id:,
                duration:
            )
                @id = id
                @duration = duration
            end

            def self.from(map:)
                PolicySessionDuration.new(
                    id: map["$id"],
                    duration: map["duration"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "duration": @duration
                }
            end
        end
    end
end
