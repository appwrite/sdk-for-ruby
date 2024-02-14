#frozen_string_literal: true

module Appwrite
    module Models
        class CountryList
            attr_reader :total
            attr_reader :countries

            def initialize(
                total:,
                countries:
            )
                @total = total
                @countries = countries
            end

            def self.from(map:)
                CountryList.new(
                    total: map["total"],
                    countries: map["countries"].map { |it| Country.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "countries": @countries.map { |it| it.to_map }
                }
            end
        end
    end
end
