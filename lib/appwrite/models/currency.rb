#frozen_string_literal: true

module Appwrite
    module Models
        class Currency
            attr_reader :symbol
            attr_reader :name
            attr_reader :symbol_native
            attr_reader :decimal_digits
            attr_reader :rounding
            attr_reader :code
            attr_reader :name_plural

            def initialize(
                symbol:,
                name:,
                symbol_native:,
                decimal_digits:,
                rounding:,
                code:,
                name_plural:
            )
                @symbol = symbol
                @name = name
                @symbol_native = symbol_native
                @decimal_digits = decimal_digits
                @rounding = rounding
                @code = code
                @name_plural = name_plural
            end

            def self.from(map:)
                Currency.new(
                    symbol: map["symbol"],
                    name: map["name"],
                    symbol_native: map["symbolNative"],
                    decimal_digits: map["decimalDigits"],
                    rounding: map["rounding"],
                    code: map["code"],
                    name_plural: map["namePlural"]
                )
            end

            def to_map
                {
                    "symbol": @symbol,
                    "name": @name,
                    "symbolNative": @symbol_native,
                    "decimalDigits": @decimal_digits,
                    "rounding": @rounding,
                    "code": @code,
                    "namePlural": @name_plural
                }
            end
        end
    end
end
