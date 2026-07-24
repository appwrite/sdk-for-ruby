#frozen_string_literal: true

module Appwrite
    module Models
        class Oauth2Reject
            attr_reader :redirect_url

            def initialize(
                redirect_url:
            )
                @redirect_url = redirect_url
            end

            def self.from(map:)
                Oauth2Reject.new(
                    redirect_url: map["redirectUrl"]
                )
            end

            def to_map
                {
                    "redirectUrl": @redirect_url
                }
            end
        end
    end
end
