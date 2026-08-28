# frozen_string_literal: true

module Appwrite
    module Models
        class Oauth2ConsentList
            attr_reader :total
            attr_reader :consents

            def initialize(
                total:,
                consents:
            )
                @total = total
                @consents = consents
            end

            def self.from(map:)
                Oauth2ConsentList.new(
                    total: map["total"],
                    consents: map["consents"].map { |it| Oauth2Consent.from(map: it) }
                )
            end

            def to_map
                {
                    "total": @total,
                    "consents": @consents.map { |it| it.to_map }
                }
            end
        end
    end
end
