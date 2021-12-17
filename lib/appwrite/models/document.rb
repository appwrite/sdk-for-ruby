#frozen_string_literal: true

module Appwrite
    module Models
        class Document
            attr_reader :id
            attr_reader :collection
            attr_reader :permissions

            def initialize(
                id:,
                collection:,
                permissions:,
                data:
            )
                @id = id
                @collection = collection
                @permissions = permissions
                @data = data
            end

            def self.from(map:)
                Document.new(
                    id: map["$id"],
                    collection: map["$collection"],
                    permissions: Permissions.from(map: map["$permissions"]),
                    data: map["data"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$collection": @collection,
                    "$permissions": @permissions.to_map,
                    "data": @data
                }
            end

            def convert_to(from_json)
                from_json.call(data)
            end
        end
    end
end