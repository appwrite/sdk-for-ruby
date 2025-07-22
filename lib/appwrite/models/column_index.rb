#frozen_string_literal: true

module Appwrite
    module Models
        class ColumnIndex
            attr_reader :key
            attr_reader :type
            attr_reader :status
            attr_reader :error
            attr_reader :columns
            attr_reader :lengths
            attr_reader :orders
            attr_reader :created_at
            attr_reader :updated_at

            def initialize(
                key:,
                type:,
                status:,
                error:,
                columns:,
                lengths:,
                orders: ,
                created_at:,
                updated_at:
            )
                @key = key
                @type = type
                @status = status
                @error = error
                @columns = columns
                @lengths = lengths
                @orders = orders
                @created_at = created_at
                @updated_at = updated_at
            end

            def self.from(map:)
                ColumnIndex.new(
                    key: map["key"],
                    type: map["type"],
                    status: map["status"],
                    error: map["error"],
                    columns: map["columns"],
                    lengths: map["lengths"],
                    orders: map["orders"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"]
                )
            end

            def to_map
                {
                    "key": @key,
                    "type": @type,
                    "status": @status,
                    "error": @error,
                    "columns": @columns,
                    "lengths": @lengths,
                    "orders": @orders,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at
                }
            end
        end
    end
end
