#frozen_string_literal: true

module Appwrite
    module Models
        class PolicyPasswordHistory
            attr_reader :id
            attr_reader :total

            def initialize(
                id:,
                total:
            )
                @id = id
                @total = total
            end

            def self.from(map:)
                PolicyPasswordHistory.new(
                    id: map["$id"],
                    total: map["total"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "total": @total
                }
            end
        end
    end
end
