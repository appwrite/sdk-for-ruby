# frozen_string_literal: true

module Appwrite
    module Models
        class Oauth2Introspection
            attr_reader :active
            attr_reader :token_use
            attr_reader :token_type
            attr_reader :scope
            attr_reader :client_id
            attr_reader :sub
            attr_reader :aud
            attr_reader :iss
            attr_reader :exp
            attr_reader :iat
            attr_reader :jti
            attr_reader :authorization_details

            def initialize(
                active:,
                token_use: nil,
                token_type: nil,
                scope: nil,
                client_id: nil,
                sub: nil,
                aud: nil,
                iss: nil,
                exp: nil,
                iat: nil,
                jti: nil,
                authorization_details: nil
            )
                @active = active
                @token_use = token_use
                @token_type = token_type
                @scope = scope
                @client_id = client_id
                @sub = sub
                @aud = aud
                @iss = iss
                @exp = exp
                @iat = iat
                @jti = jti
                @authorization_details = authorization_details
            end

            def self.from(map:)
                map = { "active" => false }.merge(map)
                Oauth2Introspection.new(
                    active: map["active"],
                    token_use: map["token_use"],
                    token_type: map["token_type"],
                    scope: map["scope"],
                    client_id: map["client_id"],
                    sub: map["sub"],
                    aud: map["aud"],
                    iss: map["iss"],
                    exp: map["exp"],
                    iat: map["iat"],
                    jti: map["jti"],
                    authorization_details: map["authorization_details"]
                )
            end

            def to_map
                {
                    "active": @active,
                    "token_use": @token_use,
                    "token_type": @token_type,
                    "scope": @scope,
                    "client_id": @client_id,
                    "sub": @sub,
                    "aud": @aud,
                    "iss": @iss,
                    "exp": @exp,
                    "iat": @iat,
                    "jti": @jti,
                    "authorization_details": @authorization_details
                }
            end
        end
    end
end
