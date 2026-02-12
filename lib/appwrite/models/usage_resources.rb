#frozen_string_literal: true

module Appwrite
    module Models
        class UsageResources
            attr_reader :name
            attr_reader :value
            attr_reader :amount
            attr_reader :rate
            attr_reader :desc
            attr_reader :resource_id

            def initialize(
                name:,
                value:,
                amount:,
                rate:,
                desc:,
                resource_id:
            )
                @name = name
                @value = value
                @amount = amount
                @rate = rate
                @desc = desc
                @resource_id = resource_id
            end

            def self.from(map:)
                UsageResources.new(
                    name: map["name"],
                    value: map["value"],
                    amount: map["amount"],
                    rate: map["rate"],
                    desc: map["desc"],
                    resource_id: map["resourceId"]
                )
            end

            def to_map
                {
                    "name": @name,
                    "value": @value,
                    "amount": @amount,
                    "rate": @rate,
                    "desc": @desc,
                    "resourceId": @resource_id
                }
            end
        end
    end
end
