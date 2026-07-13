#frozen_string_literal: true

module Appwrite
    module Models
        class BillingPlanAddon
            attr_reader :seats
            attr_reader :projects

            def initialize(
                seats:,
                projects:
            )
                @seats = seats
                @projects = projects
            end

            def self.from(map:)
                BillingPlanAddon.new(
                    seats: BillingPlanAddonDetails.from(map: map["seats"]),
                    projects: BillingPlanAddonDetails.from(map: map["projects"])
                )
            end

            def to_map
                {
                    "seats": @seats.to_map,
                    "projects": @projects.to_map
                }
            end
        end
    end
end
