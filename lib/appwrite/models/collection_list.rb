#frozen_string_literal: true

module Appwrite
    module Models
        class CollectionList
            attr_reader :sum
            attr_reader :collections

            def initialize(
                sum:,
                collections:
            )
                @sum = sum
                @collections = collections
            end

            def self.from(map:)
                CollectionList.new(
                    sum: map["sum"],
                    collections: map["collections"].map { |it| Collection.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "collections": @collections.map { |it| it.to_map }
                }
            end
        end
    end
end