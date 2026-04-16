#frozen_string_literal: true

module Appwrite
    module Models
        class DevKey
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :expire
            attr_reader :secret
            attr_reader :accessed_at
            attr_reader :sdks

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                expire:,
                secret:,
                accessed_at:,
                sdks:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @expire = expire
                @secret = secret
                @accessed_at = accessed_at
                @sdks = sdks
            end

            def self.from(map:)
                DevKey.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    expire: map["expire"],
                    secret: map["secret"],
                    accessed_at: map["accessedAt"],
                    sdks: map["sdks"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "expire": @expire,
                    "secret": @secret,
                    "accessedAt": @accessed_at,
                    "sdks": @sdks
                }
            end
        end
    end
end
