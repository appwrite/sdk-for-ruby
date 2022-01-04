#frozen_string_literal: true

module Appwrite
    module Models
        class IndexList
            attr_reader :sum
            attr_reader :indexes

            def initialize(
                sum:,
                indexes:
            )
                @sum = sum
                @indexes = indexes
            end

            def self.from(map:)
                IndexList.new(
                    sum: map["sum"],
                    indexes: map["indexes"].map { |it| Index.from(map: it) }
                )
            end

            def to_map
                {
                    "sum": @sum,
                    "indexes": @indexes.map { |it| it.to_map }
                }
            end
        end
    end
end