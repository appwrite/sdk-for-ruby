#frozen_string_literal: true

module Appwrite
    module Models
        class Document
            attr_reader :id
            attr_reader :collection
            attr_reader :read
            attr_reader :write

            def initialize(
                id:,
                collection:,
                read:,
                write:,
                data:
            )
                @id = id
                @collection = collection
                @read = read
                @write = write
                @data = data
            end

            def self.from(map:)
                Document.new(
                    id: map["$id"],
                    collection: map["$collection"],
                    read: map["$read"],
                    write: map["$write"],
                    data: map["data"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$collection": @collection,
                    "$read": @read,
                    "$write": @write,
                    "data": @data
                }
            end

            def convert_to(from_json)
                from_json.call(data)
            end
        end
    end
end