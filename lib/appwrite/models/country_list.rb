#frozen_string_literal: true

module Appwrite
    module Models
        class CountryList
            attr_reader :sum
            attr_reader :countries

            def initialize(
                sum:,
                countries:
            )
                @sum = sum
                @countries = countries
            end

            def self.from(map:)
                CountryList.new(
                    sum: map["sum"],
                    countries: map["countries"].map { |it| Country.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "countries": @countries.map { |it| it.to_map }
                }
            end
        end
    end
end