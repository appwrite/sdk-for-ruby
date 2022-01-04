#frozen_string_literal: true

module Appwrite
    module Models
        class File
            attr_reader :id
            attr_reader :read
            attr_reader :write
            attr_reader :name
            attr_reader :date_created
            attr_reader :signature
            attr_reader :mime_type
            attr_reader :size_original

            def initialize(
                id:,
                read:,
                write:,
                name:,
                date_created:,
                signature:,
                mime_type:,
                size_original:
            )
                @id = id
                @read = read
                @write = write
                @name = name
                @date_created = date_created
                @signature = signature
                @mime_type = mime_type
                @size_original = size_original
            end

            def self.from(map:)
                File.new(
                    id: map["$id"],
                    read: map["$read"],
                    write: map["$write"],
                    name: map["name"],
                    date_created: map["dateCreated"],
                    signature: map["signature"],
                    mime_type: map["mimeType"],
                    size_original: map["sizeOriginal"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$read": @read,
                    "$write": @write,
                    "name": @name,
                    "dateCreated": @date_created,
                    "signature": @signature,
                    "mimeType": @mime_type,
                    "sizeOriginal": @size_original
                }
            end
        end
    end
end