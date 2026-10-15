# frozen_string_literal: true

module Appwrite
    module Models
        class DomainPrice
            attr_reader :domain
            attr_reader :tld
            attr_reader :available
            attr_reader :price
            attr_reader :period_years
            attr_reader :premium
            attr_reader :renewal_price
            attr_reader :renewal_period_years

            def initialize(
                domain:,
                tld:,
                available:,
                price: nil,
                period_years:,
                premium:,
                renewal_price: nil,
                renewal_period_years:
            )
                @domain = domain
                @tld = tld
                @available = available
                @price = price
                @period_years = period_years
                @premium = premium
                @renewal_price = renewal_price
                @renewal_period_years = renewal_period_years
            end

            def self.from(map:)
                map = { "domain" => "", "tld" => "", "available" => false, "periodYears" => 1, "premium" => false, "renewalPeriodYears" => 1 }.merge(map)
                DomainPrice.new(
                    domain: map["domain"],
                    tld: map["tld"],
                    available: map["available"],
                    price: map["price"],
                    period_years: map["periodYears"],
                    premium: map["premium"],
                    renewal_price: map["renewalPrice"],
                    renewal_period_years: map["renewalPeriodYears"]
                )
            end

            def to_map
                {
                    "domain": @domain,
                    "tld": @tld,
                    "available": @available,
                    "price": @price,
                    "periodYears": @period_years,
                    "premium": @premium,
                    "renewalPrice": @renewal_price,
                    "renewalPeriodYears": @renewal_period_years
                }
            end
        end
    end
end
