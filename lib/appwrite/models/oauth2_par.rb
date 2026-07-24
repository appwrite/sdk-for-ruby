#frozen_string_literal: true

module Appwrite
    module Models
        class Oauth2PAR
            attr_reader :request_uri
            attr_reader :expires_in

            def initialize(
                request_uri:,
                expires_in:
            )
                @request_uri = request_uri
                @expires_in = expires_in
            end

            def self.from(map:)
                Oauth2PAR.new(
                    request_uri: map["request_uri"],
                    expires_in: map["expires_in"]
                )
            end

            def to_map
                {
                    "request_uri": @request_uri,
                    "expires_in": @expires_in
                }
            end
        end
    end
end
