#frozen_string_literal: true

module Appwrite
    module Models
        class ProviderList
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
                ProviderList.new(
                    total: map["total"],
                    providers: map["providers"].map { |it| Provider.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "providers": @providers.map { |it| it.to_map }
                }
            end
        end
    end
end
