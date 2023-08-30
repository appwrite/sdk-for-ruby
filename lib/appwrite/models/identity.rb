#frozen_string_literal: true

module Appwrite
    module Models
        class Identity
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :user_id
            attr_reader :provider
            attr_reader :provider_uid
            attr_reader :provider_email
            attr_reader :provider_access_token
            attr_reader :provider_access_token_expiry
            attr_reader :provider_refresh_token

            def initialize(
                id:,
                created_at:,
                updated_at:,
                user_id:,
                provider:,
                provider_uid:,
                provider_email:,
                provider_access_token:,
                provider_access_token_expiry:,
                provider_refresh_token:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @user_id = user_id
                @provider = provider
                @provider_uid = provider_uid
                @provider_email = provider_email
                @provider_access_token = provider_access_token
                @provider_access_token_expiry = provider_access_token_expiry
                @provider_refresh_token = provider_refresh_token
            end

            def self.from(map:)
                Identity.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    user_id: map["userId"],
                    provider: map["provider"],
                    provider_uid: map["providerUid"],
                    provider_email: map["providerEmail"],
                    provider_access_token: map["providerAccessToken"],
                    provider_access_token_expiry: map["providerAccessTokenExpiry"],
                    provider_refresh_token: map["providerRefreshToken"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "userId": @user_id,
                    "provider": @provider,
                    "providerUid": @provider_uid,
                    "providerEmail": @provider_email,
                    "providerAccessToken": @provider_access_token,
                    "providerAccessTokenExpiry": @provider_access_token_expiry,
                    "providerRefreshToken": @provider_refresh_token
                }
            end
        end
    end
end