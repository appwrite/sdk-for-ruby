#frozen_string_literal: true

module Appwrite
    module Models
        class IdentityList
            attr_reader :total
            attr_reader :identities

            def initialize(
                total:,
                identities:
            )
                @total = total
                @identities = identities
            end

            def self.from(map:)
                IdentityList.new(
                    total: map["total"],
                    identities: map["identities"].map { |it| Identity.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "identities": @identities.map { |it| it.to_map }
                }
            end
        end
    end
end