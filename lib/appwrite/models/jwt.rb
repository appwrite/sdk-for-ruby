#frozen_string_literal: true

module Appwrite
    module Models
        class Jwt
            attr_reader :jwt

            def initialize(
                jwt:
            )
                @jwt = jwt
            end

            def self.from(map:)
                Jwt.new(
                    jwt: map["jwt"]
                )
            end

            def to_map
                {
                    "jwt": @jwt
                }
            end
        end
    end
end
