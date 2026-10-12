# frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Salesforce
            attr_reader :id
            attr_reader :enabled
            attr_reader :customer_key
            attr_reader :customer_secret
            attr_reader :prompt

            def initialize(
                id:,
                enabled:,
                customer_key:,
                customer_secret:,
                prompt:
            )
                @id = id
                @enabled = enabled
                @customer_key = customer_key
                @customer_secret = customer_secret
                @prompt = validate_prompt(prompt)
            end

            def self.from(map:)
                map = { "$id" => "", "enabled" => false, "customerKey" => "", "customerSecret" => "", "prompt" => [] }.merge(map)
                OAuth2Salesforce.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    customer_key: map["customerKey"],
                    customer_secret: map["customerSecret"],
                    prompt: map["prompt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "customerKey": @customer_key,
                    "customerSecret": @customer_secret,
                    "prompt": @prompt
                }
            end

            private

            def validate_prompt(prompt)
                valid_prompt = [
                    Appwrite::Enums::OAuth2SalesforcePrompt::LOGIN,
                    Appwrite::Enums::OAuth2SalesforcePrompt::CONSENT,
                ]

                unless valid_prompt.include?(prompt)
                    raise ArgumentError, "Invalid " + prompt + ". Must be one of: " + valid_prompt.join(', ')
                end

                prompt
            end
        end
    end
end
