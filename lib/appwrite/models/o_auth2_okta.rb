# frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Okta
            attr_reader :id
            attr_reader :enabled
            attr_reader :client_id
            attr_reader :client_secret
            attr_reader :prompt
            attr_reader :domain
            attr_reader :authorization_server_id

            def initialize(
                id:,
                enabled:,
                client_id:,
                client_secret:,
                prompt:,
                domain:,
                authorization_server_id:
            )
                @id = id
                @enabled = enabled
                @client_id = client_id
                @client_secret = client_secret
                @prompt = validate_prompt(prompt)
                @domain = domain
                @authorization_server_id = authorization_server_id
            end

            def self.from(map:)
                map = { "$id" => "", "enabled" => false, "clientId" => "", "clientSecret" => "", "prompt" => [], "domain" => "", "authorizationServerId" => "" }.merge(map)
                OAuth2Okta.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    client_id: map["clientId"],
                    client_secret: map["clientSecret"],
                    prompt: map["prompt"],
                    domain: map["domain"],
                    authorization_server_id: map["authorizationServerId"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "clientId": @client_id,
                    "clientSecret": @client_secret,
                    "prompt": @prompt,
                    "domain": @domain,
                    "authorizationServerId": @authorization_server_id
                }
            end

            private

            def validate_prompt(prompt)
                valid_prompt = [
                    Appwrite::Enums::OAuth2OktaPrompt::NONE,
                    Appwrite::Enums::OAuth2OktaPrompt::LOGIN,
                    Appwrite::Enums::OAuth2OktaPrompt::CONSENT,
                ]

                unless valid_prompt.include?(prompt)
                    raise ArgumentError, "Invalid " + prompt + ". Must be one of: " + valid_prompt.join(', ')
                end

                prompt
            end
        end
    end
end
