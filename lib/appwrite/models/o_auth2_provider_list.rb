#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2ProviderList
            attr_reader :total
            attr_reader :providers

            def initialize(
                total:,
                providers:
            )
                @total = total
                @providers = providers
            end

            def self.from(map:)
                OAuth2ProviderList.new(
                    total: map["total"],
                    providers: map["providers"]
                )
            end

            def to_map
                {
                    "total": @total,
                    "providers": @providers
                }
            end
        end
    end
end
