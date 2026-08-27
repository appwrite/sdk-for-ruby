# frozen_string_literal: true

module Appwrite
    module Models
        class Oauth2Authorize
            attr_reader :grant_id
            attr_reader :redirect_url

            def initialize(
                grant_id:,
                redirect_url:
            )
                @grant_id = grant_id
                @redirect_url = redirect_url
            end

            def self.from(map:)
                Oauth2Authorize.new(
                    grant_id: map["grantId"],
                    redirect_url: map["redirectUrl"]
                )
            end

            def to_map
                {
                    "grantId": @grant_id,
                    "redirectUrl": @redirect_url
                }
            end
        end
    end
end
