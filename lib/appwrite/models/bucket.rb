#frozen_string_literal: true

module Appwrite
    module Models
        class Bucket
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :read
            attr_reader :write
            attr_reader :permission
            attr_reader :name
            attr_reader :enabled
            attr_reader :maximum_file_size
            attr_reader :allowed_file_extensions
            attr_reader :encryption
            attr_reader :antivirus

            def initialize(
                id:,
                created_at:,
                updated_at:,
                read:,
                write:,
                permission:,
                name:,
                enabled:,
                maximum_file_size:,
                allowed_file_extensions:,
                encryption:,
                antivirus:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @read = read
                @write = write
                @permission = permission
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
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    read: map["$read"],
                    write: map["$write"],
                    permission: map["permission"],
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
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "$read": @read,
                    "$write": @write,
                    "permission": @permission,
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