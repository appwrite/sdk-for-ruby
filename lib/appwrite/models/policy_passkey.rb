# frozen_string_literal: true

module Appwrite
    module Models
        class PolicyPasskey
            attr_reader :id
            attr_reader :rp_id
            attr_reader :origins

            def initialize(
                id:,
                rp_id:,
                origins:
            )
                @id = id
                @rp_id = rp_id
                @origins = origins
            end

            def self.from(map:)
                map = { "$id" => "", "rpId" => "", "origins" => [] }.merge(map)
                PolicyPasskey.new(
                    id: map["$id"],
                    rp_id: map["rpId"],
                    origins: map["origins"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "rpId": @rp_id,
                    "origins": @origins
                }
            end
        end
    end
end
