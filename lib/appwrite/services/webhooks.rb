#frozen_string_literal: true

module Appwrite
    class Webhooks < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all webhooks belonging to the project. You can use the query
        # params to filter your results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, url, authUsername, tls, events, enabled, logs, attempts
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [WebhookList]
        def list(queries: nil, total: nil)
            api_path = '/webhooks'

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
                response_type: Models::WebhookList
            )

        end

        # Create a new webhook. Use this endpoint to configure a URL that will
        # receive events from Appwrite when specific events occur.
        #
        # @param [String] webhook_id Webhook ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] url Webhook URL.
        # @param [String] name Webhook name. Max length: 128 chars.
        # @param [Array] events Events list. Maximum of 100 events are allowed.
        # @param [] enabled Enable or disable a webhook.
        # @param [] tls Certificate verification, false for disabled or true for enabled.
        # @param [String] auth_username Webhook HTTP user. Max length: 256 chars.
        # @param [String] auth_password Webhook HTTP password. Max length: 256 chars.
        # @param [String] secret Webhook secret key. If not provided, a new key will be generated automatically. Key must be at least 8 characters long, and at max 256 characters.
        #
        # @return [Webhook]
        def create(webhook_id:, url:, name:, events:, enabled: nil, tls: nil, auth_username: nil, auth_password: nil, secret: nil)
            api_path = '/webhooks'

            if webhook_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "webhookId"')
            end

            if url.nil?
              raise Appwrite::Exception.new('Missing required parameter: "url"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if events.nil?
              raise Appwrite::Exception.new('Missing required parameter: "events"')
            end

            api_params = {
                webhookId: webhook_id,
                url: url,
                name: name,
                events: events,
                enabled: enabled,
                tls: tls,
                authUsername: auth_username,
                authPassword: auth_password,
                secret: secret,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Webhook
            )

        end

        # Get a webhook by its unique ID. This endpoint returns details about a
        # specific webhook configured for a project. 
        #
        # @param [String] webhook_id Webhook ID.
        #
        # @return [Webhook]
        def get(webhook_id:)
            api_path = '/webhooks/{webhookId}'
                .gsub('{webhookId}', webhook_id)

            if webhook_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "webhookId"')
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
                response_type: Models::Webhook
            )

        end

        # Update a webhook by its unique ID. Use this endpoint to update the URL,
        # events, or status of an existing webhook.
        #
        # @param [String] webhook_id Webhook ID.
        # @param [String] name Webhook name. Max length: 128 chars.
        # @param [String] url Webhook URL.
        # @param [Array] events Events list. Maximum of 100 events are allowed.
        # @param [] enabled Enable or disable a webhook.
        # @param [] tls Certificate verification, false for disabled or true for enabled.
        # @param [String] auth_username Webhook HTTP user. Max length: 256 chars.
        # @param [String] auth_password Webhook HTTP password. Max length: 256 chars.
        #
        # @return [Webhook]
        def update(webhook_id:, name:, url:, events:, enabled: nil, tls: nil, auth_username: nil, auth_password: nil)
            api_path = '/webhooks/{webhookId}'
                .gsub('{webhookId}', webhook_id)

            if webhook_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "webhookId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if url.nil?
              raise Appwrite::Exception.new('Missing required parameter: "url"')
            end

            if events.nil?
              raise Appwrite::Exception.new('Missing required parameter: "events"')
            end

            api_params = {
                name: name,
                url: url,
                events: events,
                enabled: enabled,
                tls: tls,
                authUsername: auth_username,
                authPassword: auth_password,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Webhook
            )

        end

        # Delete a webhook by its unique ID. Once deleted, the webhook will no longer
        # receive project events. 
        #
        # @param [String] webhook_id Webhook ID.
        #
        # @return []
        def delete(webhook_id:)
            api_path = '/webhooks/{webhookId}'
                .gsub('{webhookId}', webhook_id)

            if webhook_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "webhookId"')
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

        # Update the webhook signing key. This endpoint can be used to regenerate the
        # signing key used to sign and validate payload deliveries for a specific
        # webhook.
        #
        # @param [String] webhook_id Webhook ID.
        # @param [String] secret Webhook secret key. If not provided, a new key will be generated automatically. Key must be at least 8 characters long, and at max 256 characters.
        #
        # @return [Webhook]
        def update_secret(webhook_id:, secret: nil)
            api_path = '/webhooks/{webhookId}/secret'
                .gsub('{webhookId}', webhook_id)

            if webhook_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "webhookId"')
            end

            api_params = {
                secret: secret,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Webhook
            )

        end

    end 
end
