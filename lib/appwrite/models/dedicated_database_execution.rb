# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseExecution
            attr_reader :rows
            attr_reader :row_count
            attr_reader :columns
            attr_reader :duration_ms
            attr_reader :truncated
            attr_reader :bytes

            def initialize(
                rows:,
                row_count:,
                columns:,
                duration_ms:,
                truncated:,
                bytes:
            )
                @rows = rows
                @row_count = row_count
                @columns = columns
                @duration_ms = duration_ms
                @truncated = truncated
                @bytes = bytes
            end

            def self.from(map:)
                DedicatedDatabaseExecution.new(
                    rows: map["rows"],
                    row_count: map["rowCount"],
                    columns: map["columns"].map { |it| DedicatedDatabaseExecutionColumn.from(map: it) },
                    duration_ms: map["durationMs"],
                    truncated: map["truncated"],
                    bytes: map["bytes"]
                )
            end

            def to_map
                {
                    "rows": @rows,
                    "rowCount": @row_count,
                    "columns": @columns.map { |it| it.to_map },
                    "durationMs": @duration_ms,
                    "truncated": @truncated,
                    "bytes": @bytes
                }
            end
        end
    end
end
