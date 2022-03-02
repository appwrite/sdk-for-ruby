#frozen_string_literal: true

module Appwrite
    module Models
        class Bucket
            attr_reader :id
            attr_reader :read
            attr_reader :write
            attr_reader :permission
            attr_reader :date_created
            attr_reader :date_updated
            attr_reader :name
            attr_reader :enabled
            attr_reader :maximum_file_size
            attr_reader :allowed_file_extensions
            attr_reader :encryption
            attr_reader :antivirus

            def initialize(
                id:,
                read:,
                write:,
                permission:,
                date_created:,
                date_updated:,
                name:,
                enabled:,
                maximum_file_size:,
                allowed_file_extensions:,
                encryption:,
                antivirus:
            )
                @id = id
                @read = read
                @write = write
                @permission = permission
                @date_created = date_created
                @date_updated = date_updated
                @name = name
                @enabled = enabled
                @maximum_file_size = maximum_file_size
                @allowed_file_extensions = allowed_file_extensions
                @encryption = encryption
                @antivirus = antivirus
            end

            def self.from(map:)
                Bucket.new(
                    id: map["$id"],
                    read: map["$read"],
                    write: map["$write"],
                    permission: map["permission"],
                    date_created: map["dateCreated"],
                    date_updated: map["dateUpdated"],
                    name: map["name"],
                    enabled: map["enabled"],
                    maximum_file_size: map["maximumFileSize"],
                    allowed_file_extensions: map["allowedFileExtensions"],
                    encryption: map["encryption"],
                    antivirus: map["antivirus"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$read": @read,
                    "$write": @write,
                    "permission": @permission,
                    "dateCreated": @date_created,
                    "dateUpdated": @date_updated,
                    "name": @name,
                    "enabled": @enabled,
                    "maximumFileSize": @maximum_file_size,
                    "allowedFileExtensions": @allowed_file_extensions,
                    "encryption": @encryption,
                    "antivirus": @antivirus
                }
            end
        end
    end
end