# frozen_string_literal: true

module Appwrite
    module Models
        class CurrencyList
            attr_reader :total
            attr_reader :currencies

            def initialize(
                total:,
                currencies:
            )
                @total = total
                @currencies = currencies
            end

            def self.from(map:)
                map = { "total" => 0 }.merge(map)
                CurrencyList.new(
                    total: map["total"],
                    currencies: map["currencies"].map { |it| Currency.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "currencies": @currencies.map { |it| it.to_map }
                }
            end
        end
    end
end
