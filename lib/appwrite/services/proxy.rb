#frozen_string_literal: true

module Appwrite
    class Proxy < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all the proxy rules. You can use the query params to filter
        # your results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: domain, type, trigger, deploymentResourceType, deploymentResourceId, deploymentId, deploymentVcsProviderBranch
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [ProxyRuleList]
        def list_rules(queries: nil, total: nil)
            api_path = '/proxy/rules'

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::ProxyRuleList
            )

        end

        # Create a new proxy rule for serving Appwrite's API on custom domain.
        # 
        # Rule ID is automatically generated as MD5 hash of a rule domain for
        # performance purposes.
        #
        # @param [String] domain Domain name.
        #
        # @return [ProxyRule]
        def create_api_rule(domain:)
            api_path = '/proxy/rules/api'

            if domain.nil?
              raise Appwrite::Exception.new('Missing required parameter: "domain"')
            end

            api_params = {
                domain: domain,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::ProxyRule
            )

        end

        # Create a new proxy rule for executing Appwrite Function on custom domain.
        # 
        # Rule ID is automatically generated as MD5 hash of a rule domain for
        # performance purposes.
        #
        # @param [String] domain Domain name.
        # @param [String] function_id ID of function to be executed.
        # @param [String] branch Name of VCS branch to deploy changes automatically
        #
        # @return [ProxyRule]
        def create_function_rule(domain:, function_id:, branch: nil)
            api_path = '/proxy/rules/function'

            if domain.nil?
              raise Appwrite::Exception.new('Missing required parameter: "domain"')
            end

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            api_params = {
                domain: domain,
                functionId: function_id,
                branch: branch,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::ProxyRule
            )

        end

        # Create a new proxy rule for to redirect from custom domain to another
        # domain.
        # 
        # Rule ID is automatically generated as MD5 hash of a rule domain for
        # performance purposes.
        #
        # @param [String] domain Domain name.
        # @param [String] url Target URL of redirection
        # @param [StatusCode] status_code Status code of redirection
        # @param [String] resource_id ID of parent resource.
        # @param [ProxyResourceType] resource_type Type of parent resource.
        #
        # @return [ProxyRule]
        def create_redirect_rule(domain:, url:, status_code:, resource_id:, resource_type:)
            api_path = '/proxy/rules/redirect'

            if domain.nil?
              raise Appwrite::Exception.new('Missing required parameter: "domain"')
            end

            if url.nil?
              raise Appwrite::Exception.new('Missing required parameter: "url"')
            end

            if status_code.nil?
              raise Appwrite::Exception.new('Missing required parameter: "statusCode"')
            end

            if resource_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "resourceId"')
            end

            if resource_type.nil?
              raise Appwrite::Exception.new('Missing required parameter: "resourceType"')
            end

            api_params = {
                domain: domain,
                url: url,
                statusCode: status_code,
                resourceId: resource_id,
                resourceType: resource_type,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::ProxyRule
            )

        end

        # Create a new proxy rule for serving Appwrite Site on custom domain.
        # 
        # Rule ID is automatically generated as MD5 hash of a rule domain for
        # performance purposes.
        #
        # @param [String] domain Domain name.
        # @param [String] site_id ID of site to be executed.
        # @param [String] branch Name of VCS branch to deploy changes automatically
        #
        # @return [ProxyRule]
        def create_site_rule(domain:, site_id:, branch: nil)
            api_path = '/proxy/rules/site'

            if domain.nil?
              raise Appwrite::Exception.new('Missing required parameter: "domain"')
            end

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

            api_params = {
                domain: domain,
                siteId: site_id,
                branch: branch,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::ProxyRule
            )

        end

        # Get a proxy rule by its unique ID.
        #
        # @param [String] rule_id Rule ID.
        #
        # @return [ProxyRule]
        def get_rule(rule_id:)
            api_path = '/proxy/rules/{ruleId}'
                .gsub('{ruleId}', rule_id)

            if rule_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            api_params = {
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::ProxyRule
            )

        end

        # Delete a proxy rule by its unique ID.
        #
        # @param [String] rule_id Rule ID.
        #
        # @return []
        def delete_rule(rule_id:)
            api_path = '/proxy/rules/{ruleId}'
                .gsub('{ruleId}', rule_id)

            if rule_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

        end

        # If not succeeded yet, retry verification process of a proxy rule domain.
        # This endpoint triggers domain verification by checking DNS records. If
        # verification is successful, a TLS certificate will be automatically
        # provisioned for the domain asynchronously in the background.
        #
        # @param [String] rule_id Rule ID.
        #
        # @return [ProxyRule]
        def update_rule_status(rule_id:)
            api_path = '/proxy/rules/{ruleId}/status'
                .gsub('{ruleId}', rule_id)

            if rule_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::ProxyRule
            )

        end

    end 
end
