# frozen_string_literal: true

module Appwrite
    module Models
        class AnalyticsProperty
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :domain
            attr_reader :enabled
            attr_reader :allowed_origins
            attr_reader :type
            attr_reader :identify_users
            attr_reader :accessed_at
            attr_reader :first_accessed_at

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                domain:,
                enabled:,
                allowed_origins:,
                type:,
                identify_users:,
                accessed_at:,
                first_accessed_at:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @domain = domain
                @enabled = enabled
                @allowed_origins = allowed_origins
                @type = validate_type(type)
                @identify_users = identify_users
                @accessed_at = accessed_at
                @first_accessed_at = first_accessed_at
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "name" => "", "domain" => "", "enabled" => true, "allowedOrigins" => ["*"], "type" => "web", "identifyUsers" => false, "accessedAt" => "", "firstAccessedAt" => "" }.merge(map)
                AnalyticsProperty.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    domain: map["domain"],
                    enabled: map["enabled"],
                    allowed_origins: map["allowedOrigins"],
                    type: map["type"],
                    identify_users: map["identifyUsers"],
                    accessed_at: map["accessedAt"],
                    first_accessed_at: map["firstAccessedAt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "domain": @domain,
                    "enabled": @enabled,
                    "allowedOrigins": @allowed_origins,
                    "type": @type,
                    "identifyUsers": @identify_users,
                    "accessedAt": @accessed_at,
                    "firstAccessedAt": @first_accessed_at
                }
            end

            private

            def validate_type(type)
                valid_type = [
                    Appwrite::Enums::AnalyticsPropertyType::WEB,
                    Appwrite::Enums::AnalyticsPropertyType::MOBILE,
                    Appwrite::Enums::AnalyticsPropertyType::AGENT,
                ]

                unless valid_type.include?(type)
                    raise ArgumentError, "Invalid " + type + ". Must be one of: " + valid_type.join(', ')
                end

                type
            end
        end
    end
end
