#frozen_string_literal: true

module Appwrite
    module Models
        class MembershipList
            attr_reader :sum
            attr_reader :memberships

            def initialize(
                sum:,
                memberships:
            )
                @sum = sum
                @memberships = memberships
            end

            def self.from(map:)
                MembershipList.new(
                    sum: map["sum"],
                    memberships: map["memberships"].map { |it| Membership.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "memberships": @memberships.map { |it| it.to_map }
                }
            end
        end
    end
end