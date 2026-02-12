#frozen_string_literal: true

module Appwrite
    module Models
        class Table
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :permissions
            attr_reader :database_id
            attr_reader :name
            attr_reader :enabled
            attr_reader :row_security
            attr_reader :columns
            attr_reader :indexes
            attr_reader :bytes_max
            attr_reader :bytes_used

            def initialize(
                id:,
                created_at:,
                updated_at:,
                permissions:,
                database_id:,
                name:,
                enabled:,
                row_security:,
                columns:,
                indexes:,
                bytes_max:,
                bytes_used:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @permissions = permissions
                @database_id = database_id
                @name = name
                @enabled = enabled
                @row_security = row_security
                @columns = columns
                @indexes = indexes
                @bytes_max = bytes_max
                @bytes_used = bytes_used
            end

            def self.from(map:)
                Table.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    permissions: map["$permissions"],
                    database_id: map["databaseId"],
                    name: map["name"],
                    enabled: map["enabled"],
                    row_security: map["rowSecurity"],
                    columns: map["columns"],
                    indexes: map["indexes"].map { |it| ColumnIndex.from(map: it) },
                    bytes_max: map["bytesMax"],
                    bytes_used: map["bytesUsed"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "$permissions": @permissions,
                    "databaseId": @database_id,
                    "name": @name,
                    "enabled": @enabled,
                    "rowSecurity": @row_security,
                    "columns": @columns,
                    "indexes": @indexes.map { |it| it.to_map },
                    "bytesMax": @bytes_max,
                    "bytesUsed": @bytes_used
                }
            end
        end
    end
end
