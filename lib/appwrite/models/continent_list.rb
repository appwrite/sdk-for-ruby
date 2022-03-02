#frozen_string_literal: true

module Appwrite
    module Models
        class ContinentList
            attr_reader :total
            attr_reader :continents

            def initialize(
                total:,
                continents:
            )
                @total = total
                @continents = continents
            end

            def self.from(map:)
                ContinentList.new(
                    total: map["total"],
                    continents: map["continents"].map { |it| Continent.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "continents": @continents.map { |it| it.to_map }
                }
            end
        end
    end
end