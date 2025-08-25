#frozen_string_literal: true

module Appwrite
    module Models
        class ColumnList
            attr_reader :total
            attr_reader :columns

            def initialize(
                total:,
                columns:
            )
                @total = total
                @columns = columns
            end

            def self.from(map:)
                ColumnList.new(
                    total: map["total"],
                    columns: map["columns"]
                )
            end

            def to_map
                {
                    "total": @total,
                    "columns": @columns
                }
            end
        end
    end
end
