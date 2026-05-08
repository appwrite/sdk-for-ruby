#frozen_string_literal: true

module Appwrite
    module Models
        class Block
            attr_reader :created_at
            attr_reader :resource_type
            attr_reader :resource_id
            attr_reader :reason
            attr_reader :expired_at
            attr_reader :project_name
            attr_reader :region
            attr_reader :organization_name
            attr_reader :organization_id
            attr_reader :billing_plan

            def initialize(
                created_at:,
                resource_type:,
                resource_id:,
                reason: ,
                expired_at: ,
                project_name:,
                region:,
                organization_name:,
                organization_id:,
                billing_plan:
            )
                @created_at = created_at
                @resource_type = resource_type
                @resource_id = resource_id
                @reason = reason
                @expired_at = expired_at
                @project_name = project_name
                @region = region
                @organization_name = organization_name
                @organization_id = organization_id
                @billing_plan = billing_plan
            end

            def self.from(map:)
                Block.new(
                    created_at: map["$createdAt"],
                    resource_type: map["resourceType"],
                    resource_id: map["resourceId"],
                    reason: map["reason"],
                    expired_at: map["expiredAt"],
                    project_name: map["projectName"],
                    region: map["region"],
                    organization_name: map["organizationName"],
                    organization_id: map["organizationId"],
                    billing_plan: map["billingPlan"]
                )
            end

            def to_map
                {
                    "$createdAt": @created_at,
                    "resourceType": @resource_type,
                    "resourceId": @resource_id,
                    "reason": @reason,
                    "expiredAt": @expired_at,
                    "projectName": @project_name,
                    "region": @region,
                    "organizationName": @organization_name,
                    "organizationId": @organization_id,
                    "billingPlan": @billing_plan
                }
            end
        end
    end
end
