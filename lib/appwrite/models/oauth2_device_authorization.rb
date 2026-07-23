#frozen_string_literal: true

module Appwrite
    module Models
        class Oauth2DeviceAuthorization
            attr_reader :device_code
            attr_reader :user_code
            attr_reader :verification_uri
            attr_reader :verification_uri_complete
            attr_reader :expires_in
            attr_reader :interval

            def initialize(
                device_code:,
                user_code:,
                verification_uri:,
                verification_uri_complete:,
                expires_in:,
                interval:
            )
                @device_code = device_code
                @user_code = user_code
                @verification_uri = verification_uri
                @verification_uri_complete = verification_uri_complete
                @expires_in = expires_in
                @interval = interval
            end

            def self.from(map:)
                Oauth2DeviceAuthorization.new(
                    device_code: map["device_code"],
                    user_code: map["user_code"],
                    verification_uri: map["verification_uri"],
                    verification_uri_complete: map["verification_uri_complete"],
                    expires_in: map["expires_in"],
                    interval: map["interval"]
                )
            end

            def to_map
                {
                    "device_code": @device_code,
                    "user_code": @user_code,
                    "verification_uri": @verification_uri,
                    "verification_uri_complete": @verification_uri_complete,
                    "expires_in": @expires_in,
                    "interval": @interval
                }
            end
        end
    end
end
