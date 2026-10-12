# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseSpecificationList
            attr_reader :specifications
            attr_reader :total

            def initialize(
                specifications:,
                total:
            )
                @specifications = specifications
                @total = total
            end

            def self.from(map:)
                map = { "total" => 0 }.merge(map)
                DedicatedDatabaseSpecificationList.new(
                    specifications: map["specifications"].map { |it| DedicatedDatabaseSpecification.from(map: it) },
                    total: map["total"]
                )
            end

            def to_map
                {
                    "specifications": @specifications.map { |it| it.to_map },
                    "total": @total
                }
            end
        end
    end
end
