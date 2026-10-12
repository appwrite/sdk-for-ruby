# frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Microsoft
            attr_reader :id
            attr_reader :enabled
            attr_reader :application_id
            attr_reader :application_secret
            attr_reader :prompt
            attr_reader :tenant

            def initialize(
                id:,
                enabled:,
                application_id:,
                application_secret:,
                prompt:,
                tenant:
            )
                @id = id
                @enabled = enabled
                @application_id = application_id
                @application_secret = application_secret
                @prompt = validate_prompt(prompt)
                @tenant = tenant
            end

            def self.from(map:)
                map = { "$id" => "", "enabled" => false, "applicationId" => "", "applicationSecret" => "", "prompt" => [], "tenant" => "" }.merge(map)
                OAuth2Microsoft.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    application_id: map["applicationId"],
                    application_secret: map["applicationSecret"],
                    prompt: map["prompt"],
                    tenant: map["tenant"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "applicationId": @application_id,
                    "applicationSecret": @application_secret,
                    "prompt": @prompt,
                    "tenant": @tenant
                }
            end

            private

            def validate_prompt(prompt)
                valid_prompt = [
                    Appwrite::Enums::OAuth2MicrosoftPrompt::NONE,
                    Appwrite::Enums::OAuth2MicrosoftPrompt::LOGIN,
                    Appwrite::Enums::OAuth2MicrosoftPrompt::CONSENT,
                    Appwrite::Enums::OAuth2MicrosoftPrompt::SELECT_ACCOUNT,
                ]

                unless valid_prompt.include?(prompt)
                    raise ArgumentError, "Invalid " + prompt + ". Must be one of: " + valid_prompt.join(', ')
                end

                prompt
            end
        end
    end
end
