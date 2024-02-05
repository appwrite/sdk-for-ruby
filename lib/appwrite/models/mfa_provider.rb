#frozen_string_literal: true

module Appwrite
    module Models
        class MfaProvider
            attr_reader :backups
            attr_reader :secret
            attr_reader :uri

            def initialize(
                backups:,
                secret:,
                uri:
            )
                @backups = backups
                @secret = secret
                @uri = uri
            end

            def self.from(map:)
                MfaProvider.new(
                    backups: map["backups"],
                    secret: map["secret"],
                    uri: map["uri"]
                )
            end

            def to_map
                {
                    "backups": @backups,
                    "secret": @secret,
                    "uri": @uri
                }
            end
        end
    end
end