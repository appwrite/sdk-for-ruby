#frozen_string_literal: true

module Appwrite
    module Models
        class ContinentList
            attr_reader :sum
            attr_reader :continents

            def initialize(
                sum:,
                continents:
            )
                @sum = sum
                @continents = continents
            end

            def self.from(map:)
                ContinentList.new(
                    sum: map["sum"],
                    continents: map["continents"].map { |it| Continent.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "continents": @continents.map { |it| it.to_map }
                }
            end
        end
    end
end