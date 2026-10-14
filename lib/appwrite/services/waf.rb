# frozen_string_literal: true

module Appwrite
    class Waf < Service
        def initialize(client)
            @client = client
        end

        # List WAF rules for the current project.
        #
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [WafRuleList]
        def list_rules(
            queries: nil,
            search: nil,
            total: nil
        )
            api_path = '/waf/rules'

            api_params = {
                queries: queries,
                search: search,
                total: total,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::WafRuleList
            )
        end

        # Create a bypass WAF rule. Conditions can match request attributes including
        # `ip` (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`, `path`,
        # `host`, `country`, `continent`, `headers.&lt;name&gt;`, `query.&lt;key&gt;`,
        # `queryKeys`, `userAgent`, `os`, `osVersion`, `browser`, and
        # `browserVersion`. Conditions on `city` and `state` require the premium Geo
        # DB addon.
        #
        #
        # @param [String] rule_id Rule ID. Choose a custom ID or pass `ID.unique()` to generate a unique one.
        # @param [String] resource_type Resource type the rule applies to.
        # @param [String] name Rule name.
        # @param [String] resource_id Resource identifier. Leave empty for the API resource type.
        # @param [String] description Optional description for the rule.
        # @param [Integer] priority Evaluation priority. Lower numbers run earlier.
        # @param [] enabled Set to false to create the rule in a disabled state.
        # @param [Array] conditions Array of condition strings generated using the WAF Condition builder. Maximum of 100 conditions are allowed, each 4096 characters long.
        #
        # @return [WafRuleBypass]
        def create_bypass_rule(
            rule_id:,
            resource_type:,
            name:,
            resource_id: nil,
            description: nil,
            priority: nil,
            enabled: nil,
            conditions: nil
        )
            if rule_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            if resource_type.nil?
                raise Appwrite::Exception.new('Missing required parameter: "resourceType"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_path = '/waf/rules/bypass'

            api_params = {
                ruleId: rule_id,
                resourceType: resource_type,
                resourceId: resource_id,
                name: name,
                description: description,
                priority: priority,
                enabled: enabled,
                conditions: conditions,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::WafRuleBypass
            )
        end

        # Update a bypass WAF rule. Conditions can match request attributes including
        # `ip` (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`, `path`,
        # `host`, `country`, `continent`, `headers.&lt;name&gt;`, `query.&lt;key&gt;`,
        # `queryKeys`, `userAgent`, `os`, `osVersion`, `browser`, and
        # `browserVersion`. Conditions on `city` and `state` require the premium Geo
        # DB addon.
        #
        #
        # @param [String] rule_id Rule ID.
        # @param [String] resource_type Resource type the rule applies to.
        # @param [String] resource_id Resource identifier. Required for functions and sites.
        # @param [String] name Rule name.
        # @param [String] description Optional description for the rule.
        # @param [Integer] priority Evaluation priority. Lower numbers run earlier.
        # @param [] enabled Set to false to disable the rule.
        # @param [Array] conditions Array of condition strings generated using the WAF Condition builder. Maximum of 100 conditions are allowed, each 4096 characters long.
        #
        # @return [WafRuleBypass]
        def update_bypass_rule(
            rule_id:,
            resource_type: nil,
            resource_id: nil,
            name: nil,
            description: nil,
            priority: nil,
            enabled: nil,
            conditions: nil
        )
            if rule_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            api_path = '/waf/rules/bypass/{ruleId}'
                .gsub('{ruleId}', rule_id)

            api_params = {
                resourceType: resource_type,
                resourceId: resource_id,
                name: name,
                description: description,
                priority: priority,
                enabled: enabled,
                conditions: conditions,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::WafRuleBypass
            )
        end

        # Create a challenge WAF rule. Use `difficulty` (1 easiest to 5 hardest) to
        # tune the client-side proof-of-work cost, and `ttl` to control how long, in
        # seconds, a visitor stays cleared after passing the challenge before being
        # challenged again. Conditions can match request attributes including `ip`
        # (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`, `path`, `host`,
        # `country`, `continent`, `headers.&lt;name&gt;`, `query.&lt;key&gt;`, `queryKeys`,
        # `userAgent`, `os`, `osVersion`, `browser`, and `browserVersion`. Conditions
        # on `city` and `state` require the premium Geo DB addon.
        #
        #
        # @param [String] rule_id Rule ID. Choose a custom ID or pass `ID.unique()` to generate a unique one.
        # @param [String] resource_type Resource type the rule applies to.
        # @param [String] name Rule name.
        # @param [String] resource_id Resource identifier. Required for functions and sites.
        # @param [String] description Optional description for the rule.
        # @param [String] challenge_type Challenge type enforced by the rule.
        # @param [Integer] priority Evaluation priority. Lower numbers run earlier.
        # @param [] enabled Set to false to create the rule in a disabled state.
        # @param [Array] conditions Array of condition strings generated using the WAF Condition builder. Maximum of 100 conditions are allowed, each 4096 characters long.
        # @param [Integer] difficulty Challenge difficulty from 1 (easiest) to 5 (hardest). Higher values demand more client-side proof-of-work.
        # @param [Integer] ttl How long, in seconds, a visitor stays cleared after passing the challenge before being challenged again.
        #
        # @return [WafRuleChallenge]
        def create_challenge_rule(
            rule_id:,
            resource_type:,
            name:,
            resource_id: nil,
            description: nil,
            challenge_type: nil,
            priority: nil,
            enabled: nil,
            conditions: nil,
            difficulty: nil,
            ttl: nil
        )
            if rule_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            if resource_type.nil?
                raise Appwrite::Exception.new('Missing required parameter: "resourceType"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_path = '/waf/rules/challenge'

            api_params = {
                ruleId: rule_id,
                resourceType: resource_type,
                resourceId: resource_id,
                name: name,
                description: description,
                challengeType: challenge_type,
                priority: priority,
                enabled: enabled,
                conditions: conditions,
                difficulty: difficulty,
                ttl: ttl,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::WafRuleChallenge
            )
        end

        # Update a challenge WAF rule. Use `difficulty` (1 easiest to 5 hardest) to
        # tune the client-side proof-of-work cost, and `ttl` to control how long, in
        # seconds, a visitor stays cleared after passing the challenge before being
        # challenged again. Conditions can match request attributes including `ip`
        # (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`, `path`, `host`,
        # `country`, `continent`, `headers.&lt;name&gt;`, `query.&lt;key&gt;`, `queryKeys`,
        # `userAgent`, `os`, `osVersion`, `browser`, and `browserVersion`. Conditions
        # on `city` and `state` require the premium Geo DB addon.
        #
        #
        # @param [String] rule_id Rule ID.
        # @param [String] resource_type Resource type the rule applies to.
        # @param [String] resource_id Resource identifier. Required for functions and sites.
        # @param [String] name Rule name.
        # @param [String] description Optional description for the rule.
        # @param [String] challenge_type Challenge type enforced by the rule.
        # @param [Integer] priority Evaluation priority. Lower numbers run earlier.
        # @param [] enabled Set to false to disable the rule.
        # @param [Array] conditions Array of condition strings generated using the WAF Condition builder. Maximum of 100 conditions are allowed, each 4096 characters long.
        # @param [Integer] difficulty Challenge difficulty from 1 (easiest) to 5 (hardest). Higher values demand more client-side proof-of-work.
        # @param [Integer] ttl How long, in seconds, a visitor stays cleared after passing the challenge before being challenged again.
        #
        # @return [WafRuleChallenge]
        def update_challenge_rule(
            rule_id:,
            resource_type: nil,
            resource_id: nil,
            name: nil,
            description: nil,
            challenge_type: nil,
            priority: nil,
            enabled: nil,
            conditions: nil,
            difficulty: nil,
            ttl: nil
        )
            if rule_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            api_path = '/waf/rules/challenge/{ruleId}'
                .gsub('{ruleId}', rule_id)

            api_params = {
                resourceType: resource_type,
                resourceId: resource_id,
                name: name,
                description: description,
                challengeType: challenge_type,
                priority: priority,
                enabled: enabled,
                conditions: conditions,
                difficulty: difficulty,
                ttl: ttl,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::WafRuleChallenge
            )
        end

        # Create a deny WAF rule. Conditions can match request attributes including
        # `ip` (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`, `path`,
        # `host`, `country`, `continent`, `headers.&lt;name&gt;`, `query.&lt;key&gt;`,
        # `queryKeys`, `userAgent`, `os`, `osVersion`, `browser`, and
        # `browserVersion`. Conditions on `city` and `state` require the premium Geo
        # DB addon.
        #
        #
        # @param [String] rule_id Rule ID. Choose a custom ID or pass `ID.unique()` to generate a unique one.
        # @param [String] resource_type Resource type the rule applies to.
        # @param [String] name Rule name.
        # @param [String] resource_id Resource identifier. Required for functions and sites.
        # @param [String] description Optional description for the rule.
        # @param [Integer] priority Evaluation priority. Lower numbers run earlier.
        # @param [] enabled Set to false to create the rule in a disabled state.
        # @param [Array] conditions Array of condition strings generated using the WAF Condition builder. Maximum of 100 conditions are allowed, each 4096 characters long.
        #
        # @return [WafRuleDeny]
        def create_deny_rule(
            rule_id:,
            resource_type:,
            name:,
            resource_id: nil,
            description: nil,
            priority: nil,
            enabled: nil,
            conditions: nil
        )
            if rule_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            if resource_type.nil?
                raise Appwrite::Exception.new('Missing required parameter: "resourceType"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_path = '/waf/rules/deny'

            api_params = {
                ruleId: rule_id,
                resourceType: resource_type,
                resourceId: resource_id,
                name: name,
                description: description,
                priority: priority,
                enabled: enabled,
                conditions: conditions,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::WafRuleDeny
            )
        end

        # Update a deny WAF rule. Conditions can match request attributes including
        # `ip` (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`, `path`,
        # `host`, `country`, `continent`, `headers.&lt;name&gt;`, `query.&lt;key&gt;`,
        # `queryKeys`, `userAgent`, `os`, `osVersion`, `browser`, and
        # `browserVersion`. Conditions on `city` and `state` require the premium Geo
        # DB addon.
        #
        #
        # @param [String] rule_id Rule ID.
        # @param [String] resource_type Resource type the rule applies to.
        # @param [String] resource_id Resource identifier. Required for functions and sites.
        # @param [String] name Rule name.
        # @param [String] description Optional description for the rule.
        # @param [Integer] priority Evaluation priority. Lower numbers run earlier.
        # @param [] enabled Set to false to disable the rule.
        # @param [Array] conditions Array of condition strings generated using the WAF Condition builder. Maximum of 100 conditions are allowed, each 4096 characters long.
        #
        # @return [WafRuleDeny]
        def update_deny_rule(
            rule_id:,
            resource_type: nil,
            resource_id: nil,
            name: nil,
            description: nil,
            priority: nil,
            enabled: nil,
            conditions: nil
        )
            if rule_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            api_path = '/waf/rules/deny/{ruleId}'
                .gsub('{ruleId}', rule_id)

            api_params = {
                resourceType: resource_type,
                resourceId: resource_id,
                name: name,
                description: description,
                priority: priority,
                enabled: enabled,
                conditions: conditions,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::WafRuleDeny
            )
        end

        # Create a rate limit WAF rule. Use `key` to choose the counter: `ip` limits
        # per client IP, while `userId` limits per authenticated user (requests
        # without an authenticated user skip `userId` rules). Conditions can match
        # request attributes including `ip` (plain IPs or CIDR blocks like
        # `10.0.0.0/8`), `method`, `path`, `host`, `country`, `continent`,
        # `headers.&lt;name&gt;`, `query.&lt;key&gt;`, `queryKeys`, `userAgent`, `os`,
        # `osVersion`, `browser`, and `browserVersion`. Conditions on `city` and
        # `state` require the premium Geo DB addon.
        #
        #
        # @param [String] rule_id Rule ID. Choose a custom ID or pass `ID.unique()` to generate a unique one.
        # @param [String] resource_type Resource type the rule applies to.
        # @param [String] name Rule name.
        # @param [Integer] limit Maximum number of matching requests allowed in the configured interval.
        # @param [Integer] interval Interval in seconds used for rate limiting.
        # @param [String] resource_id Resource identifier. Required for functions and sites.
        # @param [String] description Optional description for the rule.
        # @param [String] key Rate limit key. Use `ip` to limit per client IP or `userId` to limit per authenticated user. Requests without an authenticated user skip `userId` rules.
        # @param [String] strategy Rate limit strategy. `fixedWindow` counts requests in discrete intervals, `slidingWindow` weights the previous interval for smoother limiting, and `tokenBucket` refills allowance continuously to permit short bursts.
        # @param [Integer] max_bucket_size Maximum number of tokens the bucket can hold for the `tokenBucket` strategy, controlling how large a burst is allowed. The sustained refill rate is `limit / interval`. Defaults to `limit` when omitted. Ignored by other strategies.
        # @param [Integer] priority Evaluation priority. Lower numbers run earlier.
        # @param [] enabled Set to false to create the rule in a disabled state.
        # @param [Array] conditions Array of condition strings generated using the WAF Condition builder. Maximum of 100 conditions are allowed, each 4096 characters long.
        #
        # @return [WafRuleRateLimit]
        def create_rate_limit_rule(
            rule_id:,
            resource_type:,
            name:,
            limit:,
            interval:,
            resource_id: nil,
            description: nil,
            key: nil,
            strategy: nil,
            max_bucket_size: nil,
            priority: nil,
            enabled: nil,
            conditions: nil
        )
            if rule_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            if resource_type.nil?
                raise Appwrite::Exception.new('Missing required parameter: "resourceType"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if limit.nil?
                raise Appwrite::Exception.new('Missing required parameter: "limit"')
            end

            if interval.nil?
                raise Appwrite::Exception.new('Missing required parameter: "interval"')
            end

            api_path = '/waf/rules/rate-limit'

            api_params = {
                ruleId: rule_id,
                resourceType: resource_type,
                resourceId: resource_id,
                name: name,
                description: description,
                limit: limit,
                interval: interval,
                key: key,
                strategy: strategy,
                maxBucketSize: max_bucket_size,
                priority: priority,
                enabled: enabled,
                conditions: conditions,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::WafRuleRateLimit
            )
        end

        # Update a rate limit WAF rule. Use `key` to choose the counter: `ip` limits
        # per client IP, while `userId` limits per authenticated user (requests
        # without an authenticated user skip `userId` rules). Conditions can match
        # request attributes including `ip` (plain IPs or CIDR blocks like
        # `10.0.0.0/8`), `method`, `path`, `host`, `country`, `continent`,
        # `headers.&lt;name&gt;`, `query.&lt;key&gt;`, `queryKeys`, `userAgent`, `os`,
        # `osVersion`, `browser`, and `browserVersion`. Conditions on `city` and
        # `state` require the premium Geo DB addon.
        #
        #
        # @param [String] rule_id Rule ID.
        # @param [String] resource_type Resource type the rule applies to.
        # @param [String] resource_id Resource identifier. Required for functions and sites.
        # @param [String] name Rule name.
        # @param [String] description Optional description for the rule.
        # @param [Integer] limit Maximum number of matching requests allowed in the configured interval.
        # @param [Integer] interval Interval in seconds used for rate limiting.
        # @param [String] key Rate limit key. Use `ip` to limit per client IP or `userId` to limit per authenticated user. Requests without an authenticated user skip `userId` rules.
        # @param [Integer] max_bucket_size Maximum number of tokens the bucket can hold for the `tokenBucket` strategy, controlling how large a burst is allowed. The sustained refill rate is `limit / interval`. Ignored by other strategies. The strategy itself cannot be changed after creation.
        # @param [Integer] priority Evaluation priority. Lower numbers run earlier.
        # @param [] enabled Set to false to disable the rule.
        # @param [Array] conditions Array of condition strings generated using the WAF Condition builder. Maximum of 100 conditions are allowed, each 4096 characters long.
        #
        # @return [WafRuleRateLimit]
        def update_rate_limit_rule(
            rule_id:,
            resource_type: nil,
            resource_id: nil,
            name: nil,
            description: nil,
            limit: nil,
            interval: nil,
            key: nil,
            max_bucket_size: nil,
            priority: nil,
            enabled: nil,
            conditions: nil
        )
            if rule_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            api_path = '/waf/rules/rate-limit/{ruleId}'
                .gsub('{ruleId}', rule_id)

            api_params = {
                resourceType: resource_type,
                resourceId: resource_id,
                name: name,
                description: description,
                limit: limit,
                interval: interval,
                key: key,
                maxBucketSize: max_bucket_size,
                priority: priority,
                enabled: enabled,
                conditions: conditions,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::WafRuleRateLimit
            )
        end

        # Create a redirect WAF rule. Conditions can match request attributes
        # including `ip` (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`,
        # `path`, `host`, `country`, `continent`, `headers.&lt;name&gt;`, `query.&lt;key&gt;`,
        # `queryKeys`, `userAgent`, `os`, `osVersion`, `browser`, and
        # `browserVersion`. Conditions on `city` and `state` require the premium Geo
        # DB addon.
        #
        #
        # @param [String] rule_id Rule ID. Choose a custom ID or pass `ID.unique()` to generate a unique one.
        # @param [String] resource_type Resource type the rule applies to.
        # @param [String] name Rule name.
        # @param [String] location Location used for redirect responses.
        # @param [Integer] status_code Integer status code used for redirect responses.
        # @param [String] resource_id Resource identifier. Required for functions and sites.
        # @param [String] description Optional description for the rule.
        # @param [Integer] priority Evaluation priority. Lower numbers run earlier.
        # @param [] enabled Set to false to create the rule in a disabled state.
        # @param [Array] conditions Array of condition strings generated using the WAF Condition builder. Maximum of 100 conditions are allowed, each 4096 characters long.
        #
        # @return [WafRuleRedirect]
        def create_redirect_rule(
            rule_id:,
            resource_type:,
            name:,
            location:,
            status_code:,
            resource_id: nil,
            description: nil,
            priority: nil,
            enabled: nil,
            conditions: nil
        )
            if rule_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            if resource_type.nil?
                raise Appwrite::Exception.new('Missing required parameter: "resourceType"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if location.nil?
                raise Appwrite::Exception.new('Missing required parameter: "location"')
            end

            if status_code.nil?
                raise Appwrite::Exception.new('Missing required parameter: "statusCode"')
            end

            api_path = '/waf/rules/redirect'

            api_params = {
                ruleId: rule_id,
                resourceType: resource_type,
                resourceId: resource_id,
                name: name,
                description: description,
                location: location,
                statusCode: status_code,
                priority: priority,
                enabled: enabled,
                conditions: conditions,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::WafRuleRedirect
            )
        end

        # Update a redirect WAF rule. Conditions can match request attributes
        # including `ip` (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`,
        # `path`, `host`, `country`, `continent`, `headers.&lt;name&gt;`, `query.&lt;key&gt;`,
        # `queryKeys`, `userAgent`, `os`, `osVersion`, `browser`, and
        # `browserVersion`. Conditions on `city` and `state` require the premium Geo
        # DB addon.
        #
        #
        # @param [String] rule_id Rule ID.
        # @param [String] resource_type Resource type the rule applies to.
        # @param [String] resource_id Resource identifier. Required for functions and sites.
        # @param [String] name Rule name.
        # @param [String] description Optional description for the rule.
        # @param [String] location Location used for redirect responses.
        # @param [Integer] status_code Integer status code used for redirect responses.
        # @param [Integer] priority Evaluation priority. Lower numbers run earlier.
        # @param [] enabled Set to false to disable the rule.
        # @param [Array] conditions Array of condition strings generated using the WAF Condition builder. Maximum of 100 conditions are allowed, each 4096 characters long.
        #
        # @return [WafRuleRedirect]
        def update_redirect_rule(
            rule_id:,
            resource_type: nil,
            resource_id: nil,
            name: nil,
            description: nil,
            location: nil,
            status_code: nil,
            priority: nil,
            enabled: nil,
            conditions: nil
        )
            if rule_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            api_path = '/waf/rules/redirect/{ruleId}'
                .gsub('{ruleId}', rule_id)

            api_params = {
                resourceType: resource_type,
                resourceId: resource_id,
                name: name,
                description: description,
                location: location,
                statusCode: status_code,
                priority: priority,
                enabled: enabled,
                conditions: conditions,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::WafRuleRedirect
            )
        end

        # Get a WAF rule by its ID.
        #
        #
        # @param [String] rule_id Rule ID.
        #
        # @return [WafRuleBypass, WafRuleDeny, WafRuleChallenge, WafRuleRateLimit, WafRuleRedirect]
        def get_rule(
            rule_id:
        )
            if rule_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            api_path = '/waf/rules/{ruleId}'
                .gsub('{ruleId}', rule_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            response = @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

            unless response.is_a?(Hash)
                raise Exception, "Expected object response when hydrating a response model"
            end

            if response['action'] == 'bypass'

                return Models::WafRuleBypass.from(map: response)
            end

            if response['action'] == 'deny'

                return Models::WafRuleDeny.from(map: response)
            end

            if response['action'] == 'challenge'

                return Models::WafRuleChallenge.from(map: response)
            end

            if response['action'] == 'rateLimit'

                return Models::WafRuleRateLimit.from(map: response)
            end

            if response['action'] == 'redirect'

                return Models::WafRuleRedirect.from(map: response)
            end

            raise Exception, "Unable to match response to any expected response model"
        end

        # Delete a WAF rule.
        #
        #
        # @param [String] rule_id Rule ID.
        #
        # @return []
        def delete_rule(
            rule_id:
        )
            if rule_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "ruleId"')
            end

            api_path = '/waf/rules/{ruleId}'
                .gsub('{ruleId}', rule_id)

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end
    end
end
