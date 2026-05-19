#frozen_string_literal: true

module Appwrite
    module Models
        class Presence
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :permissions
            attr_reader :user_id
            attr_reader :status
            attr_reader :source
            attr_reader :expires_at
            attr_reader :metadata

            def initialize(
                id:,
                created_at:,
                updated_at:,
                permissions:,
                user_id:,
                status: ,
                source:,
                expires_at: ,
                metadata:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @permissions = permissions
                @user_id = user_id
                @status = status
                @source = source
                @expires_at = expires_at
                @metadata = metadata
            end

            def self.from(map:)
                Presence.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    permissions: map["$permissions"],
                    user_id: map["userId"],
                    status: map["status"],
                    source: map["source"],
                    expires_at: map["expiresAt"],
                    metadata: map["metadata"] || map
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "$permissions": @permissions,
                    "userId": @user_id,
                    "status": @status,
                    "source": @source,
                    "expiresAt": @expires_at,
                    "metadata": @metadata
                }
            end

            def convert_to(from_json)
                from_json.call(metadata)
            end
        end
    end
end
