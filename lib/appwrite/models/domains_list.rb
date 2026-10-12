# frozen_string_literal: true

module Appwrite
    module Models
        class DomainsList
            attr_reader :total
            attr_reader :domains

            def initialize(
                total:,
                domains:
            )
                @total = total
                @domains = domains
            end

            def self.from(map:)
                map = { "total" => 0 }.merge(map)
                DomainsList.new(
                    total: map["total"],
                    domains: map["domains"].map { |it| Domain.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "domains": @domains.map { |it| it.to_map }
                }
            end
        end
    end
end
