# frozen_string_literal: true

module Appwrite
    module Models
        class Oauth2Project
            attr_reader :id
            attr_reader :region
            attr_reader :endpoint

            def initialize(
                id:,
                region:,
                endpoint:
            )
                @id = id
                @region = region
                @endpoint = endpoint
            end

            def self.from(map:)
                Oauth2Project.new(
                    id: map["$id"],
                    region: map["region"],
                    endpoint: map["endpoint"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "region": @region,
                    "endpoint": @endpoint
                }
            end
        end
    end
end
