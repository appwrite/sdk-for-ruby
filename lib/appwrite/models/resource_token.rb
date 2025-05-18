#frozen_string_literal: true

module Appwrite
    module Models
        class ResourceToken
            attr_reader :id
            attr_reader :created_at
            attr_reader :resource_id
            attr_reader :resource_type
            attr_reader :expire
            attr_reader :secret
            attr_reader :accessed_at

            def initialize(
                id:,
                created_at:,
                resource_id:,
                resource_type:,
                expire:,
                secret:,
                accessed_at:
            )
                @id = id
                @created_at = created_at
                @resource_id = resource_id
                @resource_type = resource_type
                @expire = expire
                @secret = secret
                @accessed_at = accessed_at
            end

            def self.from(map:)
                ResourceToken.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    resource_id: map["resourceId"],
                    resource_type: map["resourceType"],
                    expire: map["expire"],
                    secret: map["secret"],
                    accessed_at: map["accessedAt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "resourceId": @resource_id,
                    "resourceType": @resource_type,
                    "expire": @expire,
                    "secret": @secret,
                    "accessedAt": @accessed_at
                }
            end
        end
    end
end
