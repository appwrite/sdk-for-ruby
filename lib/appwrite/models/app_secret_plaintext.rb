#frozen_string_literal: true

module Appwrite
    module Models
        class AppSecretPlaintext
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :app_id
            attr_reader :secret
            attr_reader :hint
            attr_reader :created_by_id
            attr_reader :created_by_name
            attr_reader :last_accessed_at

            def initialize(
                id:,
                created_at:,
                updated_at:,
                app_id:,
                secret:,
                hint:,
                created_by_id:,
                created_by_name:,
                last_accessed_at: 
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @app_id = app_id
                @secret = secret
                @hint = hint
                @created_by_id = created_by_id
                @created_by_name = created_by_name
                @last_accessed_at = last_accessed_at
            end

            def self.from(map:)
                AppSecretPlaintext.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    app_id: map["appId"],
                    secret: map["secret"],
                    hint: map["hint"],
                    created_by_id: map["createdById"],
                    created_by_name: map["createdByName"],
                    last_accessed_at: map["lastAccessedAt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "appId": @app_id,
                    "secret": @secret,
                    "hint": @hint,
                    "createdById": @created_by_id,
                    "createdByName": @created_by_name,
                    "lastAccessedAt": @last_accessed_at
                }
            end
        end
    end
end
