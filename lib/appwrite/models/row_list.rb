#frozen_string_literal: true

module Appwrite
    module Models
        class RowList
            attr_reader :total
            attr_reader :rows

            def initialize(
                total:,
                rows:
            )
                @total = total
                @rows = rows
            end

            def self.from(map:)
                RowList.new(
                    total: map["total"],
                    rows: map["rows"].map { |it| Row.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "rows": @rows.map { |it| it.to_map }
                }
            end

            def convert_to(from_json)
                rows.map { |it| it.convert_to(from_json) }
            end
        end
    end
end
