#frozen_string_literal: true

module Appwrite
    module Models
        class Document
            attr_reader :id
            attr_reader :sequence
            attr_reader :collection_id
            attr_reader :database_id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :permissions
            attr_reader :data

            def initialize(
                id:,
                sequence:,
                collection_id:,
                database_id:,
                created_at:,
                updated_at:,
                permissions:,
                data:
            )
                @id = id
                @sequence = sequence
                @collection_id = collection_id
                @database_id = database_id
                @created_at = created_at
                @updated_at = updated_at
                @permissions = permissions
                @data = data
            end

            def self.from(map:)
                Document.new(
                    id: map["$id"],
                    sequence: map["$sequence"],
                    collection_id: map["$collectionId"],
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
                    "$collectionId": @collection_id,
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
