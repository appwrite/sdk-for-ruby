#frozen_string_literal: true

module Appwrite
    module Models
        class TableList
            attr_reader :total
            attr_reader :tables

            def initialize(
                total:,
                tables:
            )
                @total = total
                @tables = tables
            end

            def self.from(map:)
                TableList.new(
                    total: map["total"],
                    tables: map["tables"].map { |it| Table.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "tables": @tables.map { |it| it.to_map }
                }
            end
        end
    end
end
