# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseSpecificationList
            attr_reader :specifications
            attr_reader :total
            attr_reader :pricing

            def initialize(
                specifications:,
                total:,
                pricing:
            )
                @specifications = specifications
                @total = total
                @pricing = pricing
            end

            def self.from(map:)
                DedicatedDatabaseSpecificationList.new(
                    specifications: map["specifications"].map { |it| DedicatedDatabaseSpecification.from(map: it) },
                    total: map["total"],
                    pricing: DedicatedDatabaseSpecificationPricing.from(map: map["pricing"])
                )
            end

            def to_map
                {
                    "specifications": @specifications.map { |it| it.to_map },
                    "total": @total,
                    "pricing": @pricing.to_map
                }
            end
        end
    end
end
