#frozen_string_literal: true

module Appwrite
    module Models
        class CollectionList
            attr_reader :total
            attr_reader :collections

            def initialize(
                total:,
                collections:
            )
                @total = total
                @collections = collections
            end

            def self.from(map:)
                CollectionList.new(
                    total: map["total"],
                    collections: map["collections"].map { |it| Collection.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "collections": @collections.map { |it| it.to_map }
                }
            end
        end
    end
end