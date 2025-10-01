#frozen_string_literal: true

module Appwrite
    module Models
        class Row
            attr_reader :id
            attr_reader :sequence
            attr_reader :table_id
            attr_reader :database_id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :permissions
            attr_reader :data

            def initialize(
                id:,
                sequence:,
                table_id:,
                database_id:,
                created_at:,
                updated_at:,
                permissions:,
                data:
            )
                @id = id
                @sequence = sequence
                @table_id = table_id
                @database_id = database_id
                @created_at = created_at
                @updated_at = updated_at
                @permissions = permissions
                @data = data
            end

            def self.from(map:)
                Row.new(
                    id: map["$id"],
                    sequence: map["$sequence"],
                    table_id: map["$tableId"],
                    database_id: map["$databaseId"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    permissions: map["$permissions"],
                    data: map["data"] || map
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$sequence": @sequence,
                    "$tableId": @table_id,
                    "$databaseId": @database_id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "$permissions": @permissions,
                    "data": @data
                }
            end

            def convert_to(from_json)
                from_json.call(data)
            end
        end
    end
end
