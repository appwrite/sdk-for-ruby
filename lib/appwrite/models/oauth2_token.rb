# frozen_string_literal: true

module Appwrite
    module Models
        class Oauth2Token
            attr_reader :access_token
            attr_reader :token_type
            attr_reader :expires_in
            attr_reader :refresh_token
            attr_reader :scope
            attr_reader :authorization_details
            attr_reader :id_token

            def initialize(
                access_token:,
                token_type:,
                expires_in:,
                refresh_token:,
                scope:,
                authorization_details:,
                id_token:
            )
                @access_token = access_token
                @token_type = token_type
                @expires_in = expires_in
                @refresh_token = refresh_token
                @scope = scope
                @authorization_details = authorization_details
                @id_token = id_token
            end

            def self.from(map:)
                Oauth2Token.new(
                    access_token: map["access_token"],
                    token_type: map["token_type"],
                    expires_in: map["expires_in"],
                    refresh_token: map["refresh_token"],
                    scope: map["scope"],
                    authorization_details: map["authorization_details"],
                    id_token: map["id_token"]
                )
            end

            def to_map
                {
                    "access_token": @access_token,
                    "token_type": @token_type,
                    "expires_in": @expires_in,
                    "refresh_token": @refresh_token,
                    "scope": @scope,
                    "authorization_details": @authorization_details,
                    "id_token": @id_token
                }
            end
        end
    end
end
