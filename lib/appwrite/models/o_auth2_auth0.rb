# frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Auth0
            attr_reader :id
            attr_reader :enabled
            attr_reader :client_id
            attr_reader :client_secret
            attr_reader :prompt
            attr_reader :endpoint

            def initialize(
                id:,
                enabled:,
                client_id:,
                client_secret:,
                prompt:,
                endpoint:
            )
                @id = id
                @enabled = enabled
                @client_id = client_id
                @client_secret = client_secret
                @prompt = validate_prompt(prompt)
                @endpoint = endpoint
            end

            def self.from(map:)
                map = { "$id" => "", "enabled" => false, "clientId" => "", "clientSecret" => "", "prompt" => [], "endpoint" => "" }.merge(map)
                OAuth2Auth0.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    client_id: map["clientId"],
                    client_secret: map["clientSecret"],
                    prompt: map["prompt"],
                    endpoint: map["endpoint"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "clientId": @client_id,
                    "clientSecret": @client_secret,
                    "prompt": @prompt,
                    "endpoint": @endpoint
                }
            end

            private

            def validate_prompt(prompt)
                valid_prompt = [
                    Appwrite::Enums::OAuth2Auth0Prompt::NONE,
                    Appwrite::Enums::OAuth2Auth0Prompt::LOGIN,
                    Appwrite::Enums::OAuth2Auth0Prompt::CONSENT,
                ]

                (prompt || []).each do |value|
                    unless valid_prompt.include?(value)
                        raise ArgumentError, "Invalid " + value.to_s + ". Must be one of: " + valid_prompt.join(', ')
                    end
                end

                prompt
            end
        end
    end
end
