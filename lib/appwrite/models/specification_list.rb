#frozen_string_literal: true

module Appwrite
    module Models
        class SpecificationList
            attr_reader :total
            attr_reader :specifications

            def initialize(
                total:,
                specifications:
            )
                @total = total
                @specifications = specifications
            end

            def self.from(map:)
                SpecificationList.new(
                    total: map["total"],
                    specifications: map["specifications"].map { |it| Specification.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "specifications": @specifications.map { |it| it.to_map }
                }
            end
        end
    end
end
