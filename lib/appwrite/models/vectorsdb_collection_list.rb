#frozen_string_literal: true

module Appwrite
    module Models
        class VectorsdbCollectionList
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
                VectorsdbCollectionList.new(
                    total: map["total"],
                    collections: map["collections"].map { |it| VectorsdbCollection.from(map: it) }
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
