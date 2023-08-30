#frozen_string_literal: true

module Appwrite
    module Models
        class ProxyRule
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :domain
            attr_reader :resource_type
            attr_reader :resource_id
            attr_reader :status
            attr_reader :logs
            attr_reader :renew_at

            def initialize(
                id:,
                created_at:,
                updated_at:,
                domain:,
                resource_type:,
                resource_id:,
                status:,
                logs:,
                renew_at:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @domain = domain
                @resource_type = resource_type
                @resource_id = resource_id
                @status = status
                @logs = logs
                @renew_at = renew_at
            end

            def self.from(map:)
                ProxyRule.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    domain: map["domain"],
                    resource_type: map["resourceType"],
                    resource_id: map["resourceId"],
                    status: map["status"],
                    logs: map["logs"],
                    renew_at: map["renewAt"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "domain": @domain,
                    "resourceType": @resource_type,
                    "resourceId": @resource_id,
                    "status": @status,
                    "logs": @logs,
                    "renewAt": @renew_at
                }
            end
        end
    end
end