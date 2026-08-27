# frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Google
            attr_reader :id
            attr_reader :enabled
            attr_reader :client_id
            attr_reader :client_secret
            attr_reader :prompt

            def initialize(
                id:,
                enabled:,
                client_id:,
                client_secret:,
                prompt:
            )
                @id = id
                @enabled = enabled
                @client_id = client_id
                @client_secret = client_secret
                @prompt = validate_prompt(prompt)
            end

            def self.from(map:)
                OAuth2Google.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    client_id: map["clientId"],
                    client_secret: map["clientSecret"],
                    prompt: map["prompt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "clientId": @client_id,
                    "clientSecret": @client_secret,
                    "prompt": @prompt
                }
            end

            private

            def validate_prompt(prompt)
                valid_prompt = [
                    Appwrite::Enums::OAuth2GooglePrompt::NONE,
                    Appwrite::Enums::OAuth2GooglePrompt::CONSENT,
                    Appwrite::Enums::OAuth2GooglePrompt::SELECT_ACCOUNT,
                ]

                unless valid_prompt.include?(prompt)
                    raise ArgumentError, "Invalid " + prompt + ". Must be one of: " + valid_prompt.join(', ')
                end

                prompt
            end
        end
    end
end
