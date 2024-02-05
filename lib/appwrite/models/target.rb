#frozen_string_literal: true

module Appwrite
    module Models
        class Target
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :user_id
            attr_reader :provider_id
            attr_reader :provider_type
            attr_reader :identifier

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                user_id:,
                provider_id: ,
                provider_type:,
                identifier:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @user_id = user_id
                @provider_id = provider_id
                @provider_type = provider_type
                @identifier = identifier
            end

            def self.from(map:)
                Target.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    user_id: map["userId"],
                    provider_id: map["providerId"],
                    provider_type: map["providerType"],
                    identifier: map["identifier"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "userId": @user_id,
                    "providerId": @provider_id,
                    "providerType": @provider_type,
                    "identifier": @identifier
                }
            end
        end
    end
end