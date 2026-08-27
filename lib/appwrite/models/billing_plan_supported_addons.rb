# frozen_string_literal: true

module Appwrite
    module Models
        class BillingPlanSupportedAddons
            attr_reader :baa
            attr_reader :premium_geo_db
            attr_reader :premium_geo_db_org

            def initialize(
                baa:,
                premium_geo_db:,
                premium_geo_db_org:
            )
                @baa = baa
                @premium_geo_db = premium_geo_db
                @premium_geo_db_org = premium_geo_db_org
            end

            def self.from(map:)
                BillingPlanSupportedAddons.new(
                    baa: map["baa"],
                    premium_geo_db: map["premiumGeoDB"],
                    premium_geo_db_org: map["premiumGeoDBOrg"]
                )
            end

            def to_map
                {
                    "baa": @baa,
                    "premiumGeoDB": @premium_geo_db,
                    "premiumGeoDBOrg": @premium_geo_db_org
                }
            end
        end
    end
end
