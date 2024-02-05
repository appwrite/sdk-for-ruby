#frozen_string_literal: true

module Appwrite
    module Models
        class Provider
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :provider
            attr_reader :enabled
            attr_reader :type
            attr_reader :credentials
            attr_reader :options

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                provider:,
                enabled:,
                type:,
                credentials:,
                options: 
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @provider = provider
                @enabled = enabled
                @type = type
                @credentials = credentials
                @options = options
            end

            def self.from(map:)
                Provider.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    provider: map["provider"],
                    enabled: map["enabled"],
                    type: map["type"],
                    credentials: map["credentials"],
                    options: map["options"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "provider": @provider,
                    "enabled": @enabled,
                    "type": @type,
                    "credentials": @credentials,
                    "options": @options
                }
            end
        end
    end
end