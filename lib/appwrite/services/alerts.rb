# frozen_string_literal: true

module Appwrite
    class Alerts < Service
        def initialize(client)
            @client = client
        end

        # Get a list of the alerts the project&#039;s monitors raised, open and resolved.
        # An alert is created when a monitor starts firing and resolved when it
        # recovers. Use queries to filter by monitor, status, type or resource, order
        # by `$createdAt` for the latest first, and `Query.search(&#039;search&#039;, term)` to
        # search alert and monitor IDs, names and metrics.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: monitorId, name, status, type, resourceType, resourceId, metric, resolvedAt, severity, acknowledgedAt, escalationId, search
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [AlertList]
        def list(
            queries: nil,
            total: nil
        )
            api_path = '/alerts'

            api_params = {
                queries: queries,
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
                response_type: Models::AlertList
            )
        end

        # Get an alert by its unique ID: the monitor that raised it, when it fired
        # and resolved, and the readings while it fired.
        #
        # @param [String] alert_id Alert ID.
        #
        # @return [Alert]
        def get(
            alert_id:
        )
            if alert_id.nil? || alert_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "alertId"')
            end

            api_path = '/alerts/{alertId}'
                .gsub('{alertId}', @client.encode_path(alert_id))

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Alert
            )
        end

        # Acknowledge a firing alert, or undo that. Everyone who can read the alert
        # sees who acknowledged it and when. The alert keeps firing until its monitor
        # recovers; a resolved alert keeps its acknowledgement and cannot be changed.
        #
        # @param [String] alert_id Alert ID.
        # @param [] acknowledged Whether the alert is acknowledged. False undoes an acknowledgement.
        #
        # @return [Alert]
        def update(
            alert_id:,
            acknowledged:
        )
            if alert_id.nil? || alert_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "alertId"')
            end

            if acknowledged.nil?
                raise Appwrite::Exception.new('Missing required parameter: "acknowledged"')
            end

            api_path = '/alerts/{alertId}'
                .gsub('{alertId}', @client.encode_path(alert_id))

            api_params = {
                acknowledged: acknowledged,
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
                response_type: Models::Alert
            )
        end
    end
end
