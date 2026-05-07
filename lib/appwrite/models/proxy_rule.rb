#frozen_string_literal: true

module Appwrite
    module Models
        class ProxyRule
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :domain
            attr_reader :type
            attr_reader :trigger
            attr_reader :redirect_url
            attr_reader :redirect_status_code
            attr_reader :deployment_id
            attr_reader :deployment_resource_type
            attr_reader :deployment_resource_id
            attr_reader :deployment_vcs_provider_branch
            attr_reader :status
            attr_reader :logs
            attr_reader :renew_at

            def initialize(
                id:,
                created_at:,
                updated_at:,
                domain:,
                type:,
                trigger:,
                redirect_url:,
                redirect_status_code:,
                deployment_id:,
                deployment_resource_type: ,
                deployment_resource_id:,
                deployment_vcs_provider_branch:,
                status:,
                logs:,
                renew_at:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @domain = domain
                @type = type
                @trigger = trigger
                @redirect_url = redirect_url
                @redirect_status_code = redirect_status_code
                @deployment_id = deployment_id
                @deployment_resource_type = deployment_resource_type.nil? ? deployment_resource_type : validate_deployment_resource_type(deployment_resource_type)
                @deployment_resource_id = deployment_resource_id
                @deployment_vcs_provider_branch = deployment_vcs_provider_branch
                @status = validate_status(status)
                @logs = logs
                @renew_at = renew_at
            end

            def self.from(map:)
                ProxyRule.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    domain: map["domain"],
                    type: map["type"],
                    trigger: map["trigger"],
                    redirect_url: map["redirectUrl"],
                    redirect_status_code: map["redirectStatusCode"],
                    deployment_id: map["deploymentId"],
                    deployment_resource_type: map["deploymentResourceType"],
                    deployment_resource_id: map["deploymentResourceId"],
                    deployment_vcs_provider_branch: map["deploymentVcsProviderBranch"],
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
                    "type": @type,
                    "trigger": @trigger,
                    "redirectUrl": @redirect_url,
                    "redirectStatusCode": @redirect_status_code,
                    "deploymentId": @deployment_id,
                    "deploymentResourceType": @deployment_resource_type,
                    "deploymentResourceId": @deployment_resource_id,
                    "deploymentVcsProviderBranch": @deployment_vcs_provider_branch,
                    "status": @status,
                    "logs": @logs,
                    "renewAt": @renew_at
                }
            end

            private

            def validate_deployment_resource_type(deployment_resource_type)
                valid_deployment_resource_type = [
                    Appwrite::Enums::ProxyRuleDeploymentResourceType::FUNCTION,
                    Appwrite::Enums::ProxyRuleDeploymentResourceType::SITE,
                ]

                unless valid_deployment_resource_type.include?(deployment_resource_type)
                    raise ArgumentError, "Invalid " + deployment_resource_type + ". Must be one of: " + valid_deployment_resource_type.join(', ')
                end

                deployment_resource_type
            end

            def validate_status(status)
                valid_status = [
                    Appwrite::Enums::ProxyRuleStatus::UNVERIFIED,
                    Appwrite::Enums::ProxyRuleStatus::VERIFYING,
                    Appwrite::Enums::ProxyRuleStatus::VERIFIED,
                ]

                unless valid_status.include?(status)
                    raise ArgumentError, "Invalid " + status + ". Must be one of: " + valid_status.join(', ')
                end

                status
            end

        end
    end
end
