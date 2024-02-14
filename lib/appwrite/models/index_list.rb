#frozen_string_literal: true

module Appwrite
    module Models
        class IndexList
            attr_reader :total
            attr_reader :indexes

            def initialize(
                total:,
                indexes:
            )
                @total = total
                @indexes = indexes
            end

            def self.from(map:)
                IndexList.new(
                    total: map["total"],
                    indexes: map["indexes"].map { |it| Index.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "indexes": @indexes.map { |it| it.to_map }
                }
            end
        end
    end
end
