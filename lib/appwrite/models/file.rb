#frozen_string_literal: true

module Appwrite
    module Models
        class File
            attr_reader :id
            attr_reader :bucket_id
            attr_reader :read
            attr_reader :write
            attr_reader :name
            attr_reader :date_created
            attr_reader :signature
            attr_reader :mime_type
            attr_reader :size_original
            attr_reader :chunks_total
            attr_reader :chunks_uploaded

            def initialize(
                id:,
                bucket_id:,
                read:,
                write:,
                name:,
                date_created:,
                signature:,
                mime_type:,
                size_original:,
                chunks_total:,
                chunks_uploaded:
            )
                @id = id
                @bucket_id = bucket_id
                @read = read
                @write = write
                @name = name
                @date_created = date_created
                @signature = signature
                @mime_type = mime_type
                @size_original = size_original
                @chunks_total = chunks_total
                @chunks_uploaded = chunks_uploaded
            end

            def self.from(map:)
                File.new(
                    id: map["$id"],
                    bucket_id: map["bucketId"],
                    read: map["$read"],
                    write: map["$write"],
                    name: map["name"],
                    date_created: map["dateCreated"],
                    signature: map["signature"],
                    mime_type: map["mimeType"],
                    size_original: map["sizeOriginal"],
                    chunks_total: map["chunksTotal"],
                    chunks_uploaded: map["chunksUploaded"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "bucketId": @bucket_id,
                    "$read": @read,
                    "$write": @write,
                    "name": @name,
                    "dateCreated": @date_created,
                    "signature": @signature,
                    "mimeType": @mime_type,
                    "sizeOriginal": @size_original,
                    "chunksTotal": @chunks_total,
                    "chunksUploaded": @chunks_uploaded
                }
            end
        end
    end
end