#frozen_string_literal: true

module Appwrite
    class Proxy < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all the proxy rules. You can use the query params to filter
        # your results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: domain, resourceType, resourceId, url
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [ProxyRuleList]
        def list_rules(queries: nil, search: nil)
            api_path = '/proxy/rules'

            params = {
                queries: queries,
                search: search,
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: headers,
                params: params,
                response_type: Models::ProxyRuleList
            )
        end

        
        # Create a new proxy rule.
        #
        # @param [String] domain Domain name.
        # @param [String] resource_type Action definition for the rule. Possible values are "api", "function"
        # @param [String] resource_id ID of resource for the action type. If resourceType is "api", leave empty. If resourceType is "function", provide ID of the function.
        #
        # @return [ProxyRule]
        def create_rule(domain:, resource_type:, resource_id: nil)
            api_path = '/proxy/rules'

            if domain.nil?
              raise Appwrite::Exception.new('Missing required parameter: "domain"')
            end

            if resource_type.nil?
              raise Appwrite::Exception.new('Missing required parameter: "resourceType"')
            end

            params = {
                domain: domain,
                resourceType: resource_type,
                resourceId: resource_id,
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: headers,
                params: params,
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

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: headers,
                params: params,
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

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: headers,
                params: params,
            )
        end

        
        # 
        #
        # @param [String] rule_id Rule ID.
        #
        # @return [ProxyRule]
        def update_rule_verification(rule_id:)
            api_path = '/proxy/rules/{ruleId}/verification'
                .gsub('{ruleId}', rule_id)

            if rule_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: headers,
                params: params,
                response_type: Models::ProxyRule
            )
        end

        
    end 
end