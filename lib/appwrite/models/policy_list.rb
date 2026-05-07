#frozen_string_literal: true

module Appwrite
    module Models
        class PolicyList
            attr_reader :total
            attr_reader :policies

            def initialize(
                total:,
                policies:
            )
                @total = total
                @policies = policies
            end

            def self.from(map:)
                PolicyList.new(
                    total: map["total"],
                    policies: map["policies"]
                )
            end

            def to_map
                {
                    "total": @total,
                    "policies": @policies
                }
            end
        end
    end
end
