#frozen_string_literal: true

module Appwrite
    module Models
        class Block
            attr_reader :created_at
            attr_reader :resource_type
            attr_reader :resource_id
            attr_reader :reason
            attr_reader :expired_at

            def initialize(
                created_at:,
                resource_type:,
                resource_id:,
                reason: ,
                expired_at: 
            )
                @created_at = created_at
                @resource_type = resource_type
                @resource_id = resource_id
                @reason = reason
                @expired_at = expired_at
            end

            def self.from(map:)
                Block.new(
                    created_at: map["$createdAt"],
                    resource_type: map["resourceType"],
                    resource_id: map["resourceId"],
                    reason: map["reason"],
                    expired_at: map["expiredAt"]
                )
            end

            def to_map
                {
                    "$createdAt": @created_at,
                    "resourceType": @resource_type,
                    "resourceId": @resource_id,
                    "reason": @reason,
                    "expiredAt": @expired_at
                }
            end
        end
    end
end
