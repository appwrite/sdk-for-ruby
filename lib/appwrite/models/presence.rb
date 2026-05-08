#frozen_string_literal: true

module Appwrite
    module Models
        class Presence
            attr_reader :id
            attr_reader :sequence
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :permissions
            attr_reader :user_internal_id
            attr_reader :user_id
            attr_reader :status
            attr_reader :source
            attr_reader :expires_at
            attr_reader :data

            def initialize(
                id:,
                sequence:,
                created_at:,
                updated_at:,
                permissions:,
                user_internal_id:,
                user_id:,
                status: ,
                source:,
                expires_at: ,
                data:
            )
                @id = id
                @sequence = sequence
                @created_at = created_at
                @updated_at = updated_at
                @permissions = permissions
                @user_internal_id = user_internal_id
                @user_id = user_id
                @status = status
                @source = source
                @expires_at = expires_at
                @data = data
            end

            def self.from(map:)
                Presence.new(
                    id: map["$id"],
                    sequence: map["$sequence"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    permissions: map["$permissions"],
                    user_internal_id: map["userInternalId"],
                    user_id: map["userId"],
                    status: map["status"],
                    source: map["source"],
                    expires_at: map["expiresAt"],
                    data: map["data"] || map
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$sequence": @sequence,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "$permissions": @permissions,
                    "userInternalId": @user_internal_id,
                    "userId": @user_id,
                    "status": @status,
                    "source": @source,
                    "expiresAt": @expires_at,
                    "data": @data
                }
            end

            def convert_to(from_json)
                from_json.call(data)
            end
        end
    end
end
