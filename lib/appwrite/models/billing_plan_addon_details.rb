# frozen_string_literal: true

module Appwrite
    module Models
        class BillingPlanAddonDetails
            attr_reader :supported
            attr_reader :plan_included
            attr_reader :limit
            attr_reader :type
            attr_reader :currency
            attr_reader :price
            attr_reader :value
            attr_reader :invoice_desc

            def initialize(
                supported:,
                plan_included:,
                limit:,
                type:,
                currency:,
                price:,
                value:,
                invoice_desc:
            )
                @supported = supported
                @plan_included = plan_included
                @limit = limit
                @type = type
                @currency = currency
                @price = price
                @value = value
                @invoice_desc = invoice_desc
            end

            def self.from(map:)
                BillingPlanAddonDetails.new(
                    supported: map["supported"],
                    plan_included: map["planIncluded"],
                    limit: map["limit"],
                    type: map["type"],
                    currency: map["currency"],
                    price: map["price"],
                    value: map["value"],
                    invoice_desc: map["invoiceDesc"]
                )
            end

            def to_map
                {
                    "supported": @supported,
                    "planIncluded": @plan_included,
                    "limit": @limit,
                    "type": @type,
                    "currency": @currency,
                    "price": @price,
                    "value": @value,
                    "invoiceDesc": @invoice_desc
                }
            end
        end
    end
end
