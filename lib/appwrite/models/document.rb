#frozen_string_literal: true

module Appwrite
    module Models
        class Document
            attr_reader :id
            attr_reader :collection
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :permissions

            def initialize(
                id:,
                collection:,
                created_at:,
                updated_at:,
                permissions:,
                data:
            )
                @id = id
                @collection = collection
                @created_at = created_at
                @updated_at = updated_at
                @permissions = permissions
                @data = data
            end

            def self.from(map:)
                Document.new(
                    id: map["$id"],
                    collection: map["$collection"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    permissions: map["$permissions"],
                    data: map["data"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$collection": @collection,
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