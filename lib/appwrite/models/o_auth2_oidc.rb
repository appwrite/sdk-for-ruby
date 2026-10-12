# frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Oidc
            attr_reader :id
            attr_reader :enabled
            attr_reader :client_id
            attr_reader :client_secret
            attr_reader :prompt
            attr_reader :well_known_url
            attr_reader :authorization_url
            attr_reader :token_url
            attr_reader :user_info_url
            attr_reader :max_age

            def initialize(
                id:,
                enabled:,
                client_id:,
                client_secret:,
                prompt:,
                well_known_url:,
                authorization_url:,
                token_url:,
                user_info_url:,
                max_age:
            )
                @id = id
                @enabled = enabled
                @client_id = client_id
                @client_secret = client_secret
                @prompt = validate_prompt(prompt)
                @well_known_url = well_known_url
                @authorization_url = authorization_url
                @token_url = token_url
                @user_info_url = user_info_url
                @max_age = max_age
            end

            def self.from(map:)
                map = { "$id" => "", "enabled" => false, "clientId" => "", "clientSecret" => "", "prompt" => [], "wellKnownURL" => "", "authorizationURL" => "", "tokenURL" => "", "userInfoURL" => "" }.merge(map)
                OAuth2Oidc.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    client_id: map["clientId"],
                    client_secret: map["clientSecret"],
                    prompt: map["prompt"],
                    well_known_url: map["wellKnownURL"],
                    authorization_url: map["authorizationURL"],
                    token_url: map["tokenURL"],
                    user_info_url: map["userInfoURL"],
                    max_age: map["maxAge"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "clientId": @client_id,
                    "clientSecret": @client_secret,
                    "prompt": @prompt,
                    "wellKnownURL": @well_known_url,
                    "authorizationURL": @authorization_url,
                    "tokenURL": @token_url,
                    "userInfoURL": @user_info_url,
                    "maxAge": @max_age
                }
            end

            private

            def validate_prompt(prompt)
                valid_prompt = [
                    Appwrite::Enums::OAuth2OidcPrompt::NONE,
                    Appwrite::Enums::OAuth2OidcPrompt::LOGIN,
                    Appwrite::Enums::OAuth2OidcPrompt::CONSENT,
                    Appwrite::Enums::OAuth2OidcPrompt::SELECT_ACCOUNT,
                ]

                unless valid_prompt.include?(prompt)
                    raise ArgumentError, "Invalid " + prompt + ". Must be one of: " + valid_prompt.join(', ')
                end

                prompt
            end
        end
    end
end
