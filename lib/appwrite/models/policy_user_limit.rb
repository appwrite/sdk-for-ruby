#frozen_string_literal: true

module Appwrite
    module Models
        class PolicyUserLimit
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
                PolicyUserLimit.new(
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
