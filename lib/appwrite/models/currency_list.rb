#frozen_string_literal: true

module Appwrite
    module Models
        class CurrencyList
            attr_reader :sum
            attr_reader :currencies

            def initialize(
                sum:,
                currencies:
            )
                @sum = sum
                @currencies = currencies
            end

            def self.from(map:)
                CurrencyList.new(
                    sum: map["sum"],
                    currencies: map["currencies"].map { |it| Currency.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "currencies": @currencies.map { |it| it.to_map }
                }
            end
        end
    end
end