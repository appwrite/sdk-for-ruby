# frozen_string_literal: true

module Appwrite
    module Models
        class DomainPricesList
            attr_reader :total
            attr_reader :prices

            def initialize(
                total:,
                prices:
            )
                @total = total
                @prices = prices
            end

            def self.from(map:)
                map = { "total" => 0 }.merge(map)
                DomainPricesList.new(
                    total: map["total"],
                    prices: map["prices"].map { |it| DomainPrice.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "prices": @prices.map { |it| it.to_map }
                }
            end
        end
    end
end
