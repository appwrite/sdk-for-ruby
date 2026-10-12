# frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Google
            attr_reader :id
            attr_reader :enabled
            attr_reader :client_id
            attr_reader :client_secret
            attr_reader :prompt
            attr_reader :native_enabled
            attr_reader :native_client_ids

            def initialize(
                id:,
                enabled:,
                client_id:,
                client_secret:,
                prompt:,
                native_enabled:,
                native_client_ids:
            )
                @id = id
                @enabled = enabled
                @client_id = client_id
                @client_secret = client_secret
                @prompt = validate_prompt(prompt)
                @native_enabled = native_enabled
                @native_client_ids = native_client_ids
            end

            def self.from(map:)
                map = { "$id" => "", "enabled" => false, "clientId" => "", "clientSecret" => "", "prompt" => ["consent"], "nativeEnabled" => false, "nativeClientIds" => [] }.merge(map)
                OAuth2Google.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    client_id: map["clientId"],
                    client_secret: map["clientSecret"],
                    prompt: map["prompt"],
                    native_enabled: map["nativeEnabled"],
                    native_client_ids: map["nativeClientIds"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "clientId": @client_id,
                    "clientSecret": @client_secret,
                    "prompt": @prompt,
                    "nativeEnabled": @native_enabled,
                    "nativeClientIds": @native_client_ids
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
