# frozen_string_literal: true

module Appwrite
    module Models
        class BillingPlanLimits
            attr_reader :credits
            attr_reader :daily_credits

            def initialize(
                credits:,
                daily_credits:
            )
                @credits = credits
                @daily_credits = daily_credits
            end

            def self.from(map:)
                BillingPlanLimits.new(
                    credits: map["credits"],
                    daily_credits: map["dailyCredits"]
                )
            end

            def to_map
                {
                    "credits": @credits,
                    "dailyCredits": @daily_credits
                }
            end
        end
    end
end
