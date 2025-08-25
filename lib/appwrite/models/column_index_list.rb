#frozen_string_literal: true

module Appwrite
    module Models
        class ColumnIndexList
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
                ColumnIndexList.new(
                    total: map["total"],
                    indexes: map["indexes"].map { |it| ColumnIndex.from(map: it) }
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
