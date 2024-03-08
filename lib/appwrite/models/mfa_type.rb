#frozen_string_literal: true

module Appwrite
    module Models
        class MfaType
            attr_reader :secret
            attr_reader :uri

            def initialize(
                secret:,
                uri:
            )
                @secret = secret
                @uri = uri
            end

            def self.from(map:)
                MfaType.new(
                    secret: map["secret"],
                    uri: map["uri"]
                )
            end

            def to_map
                {
                    "secret": @secret,
                    "uri": @uri
                }
            end
        end
    end
end
