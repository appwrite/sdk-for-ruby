# frozen_string_literal: true

module Appwrite
    module Models
        class AdditionalResource
            attr_reader :name
            attr_reader :unit
            attr_reader :currency
            attr_reader :price
            attr_reader :value
            attr_reader :invoice_desc

            def initialize(
                name:,
                unit:,
                currency:,
                price:,
                value:,
                invoice_desc:
            )
                @name = name
                @unit = unit
                @currency = currency
                @price = price
                @value = value
                @invoice_desc = invoice_desc
            end

            def self.from(map:)
                AdditionalResource.new(
                    name: map["name"],
                    unit: map["unit"],
                    currency: map["currency"],
                    price: map["price"],
                    value: map["value"],
                    invoice_desc: map["invoiceDesc"]
                )
            end

            def to_map
                {
                    "name": @name,
                    "unit": @unit,
                    "currency": @currency,
                    "price": @price,
                    "value": @value,
                    "invoiceDesc": @invoice_desc
                }
            end
        end
    end
end
