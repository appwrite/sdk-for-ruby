#frozen_string_literal: true

module Appwrite
    module Models
        class Oauth2Organization
            attr_reader :id

            def initialize(
                id:
            )
                @id = id
            end

            def self.from(map:)
                Oauth2Organization.new(
                    id: map["$id"]
                )
            end

            def to_map
                {
                    "$id": @id
                }
            end
        end
    end
end
