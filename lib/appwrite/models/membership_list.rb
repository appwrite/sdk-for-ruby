#frozen_string_literal: true

module Appwrite
    module Models
        class MembershipList
            attr_reader :total
            attr_reader :memberships

            def initialize(
                total:,
                memberships:
            )
                @total = total
                @memberships = memberships
            end

            def self.from(map:)
                MembershipList.new(
                    total: map["total"],
                    memberships: map["memberships"].map { |it| Membership.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "memberships": @memberships.map { |it| it.to_map }
                }
            end
        end
    end
end