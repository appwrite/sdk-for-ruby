# frozen_string_literal: true

module Appwrite
    module Models
        class Bucket
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :permissions
            attr_reader :file_security
            attr_reader :name
            attr_reader :description
            attr_reader :enabled
            attr_reader :maximum_file_size
            attr_reader :allowed_file_extensions
            attr_reader :compression
            attr_reader :encryption
            attr_reader :antivirus
            attr_reader :transformations
            attr_reader :total_size

            def initialize(
                id:,
                created_at:,
                updated_at:,
                permissions:,
                file_security:,
                name:,
                description:,
                enabled:,
                maximum_file_size:,
                allowed_file_extensions:,
                compression:,
                encryption:,
                antivirus:,
                transformations:,
                total_size:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @permissions = permissions
                @file_security = file_security
                @name = name
                @description = description
                @enabled = enabled
                @maximum_file_size = maximum_file_size
                @allowed_file_extensions = allowed_file_extensions
                @compression = compression
                @encryption = encryption
                @antivirus = antivirus
                @transformations = transformations
                @total_size = total_size
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "$permissions" => [], "fileSecurity" => false, "name" => "", "description" => "", "enabled" => true, "maximumFileSize" => 0, "allowedFileExtensions" => [], "compression" => "", "encryption" => true, "antivirus" => true, "transformations" => true, "totalSize" => 0 }.merge(map)
                Bucket.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    permissions: map["$permissions"],
                    file_security: map["fileSecurity"],
                    name: map["name"],
                    description: map["description"],
                    enabled: map["enabled"],
                    maximum_file_size: map["maximumFileSize"],
                    allowed_file_extensions: map["allowedFileExtensions"],
                    compression: map["compression"],
                    encryption: map["encryption"],
                    antivirus: map["antivirus"],
                    transformations: map["transformations"],
                    total_size: map["totalSize"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "$permissions": @permissions,
                    "fileSecurity": @file_security,
                    "name": @name,
                    "description": @description,
                    "enabled": @enabled,
                    "maximumFileSize": @maximum_file_size,
                    "allowedFileExtensions": @allowed_file_extensions,
                    "compression": @compression,
                    "encryption": @encryption,
                    "antivirus": @antivirus,
                    "transformations": @transformations,
                    "totalSize": @total_size
                }
            end
        end
    end
end
