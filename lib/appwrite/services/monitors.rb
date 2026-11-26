# frozen_string_literal: true

module Appwrite
    class Monitors < Service
        def initialize(client)
            @client = client
        end

        # Get a list of the project&#039;s monitors of every type. Use queries to filter
        # by type, resource, severity or status, and `Query.search(&#039;search&#039;, term)`
        # to search monitor IDs, names, metrics and resources.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, type, resourceType, resourceId, enabled, severity, escalationId, status, evaluatedAt, triggeredAt, search
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [MonitorList]
        def list(
            queries: nil,
            total: nil
        )
            api_path = '/monitors'

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
                response_type: Models::MonitorList
            )
        end

        # Create a DNS monitor. It asks a resolver for a domain&#039;s records of one type
        # on its own interval, and opens an alert when the resolver fails, or when
        # its rules match the answers, by default when there is no such record. Each
        # alert fires the `monitors.[monitorId].alerts.[alertId].create` event when
        # it opens and `.update` when a check passes again, for project webhooks,
        # functions and realtime, and notifies the organization&#039;s members by email
        # and in the console.
        #
        # @param [String] monitor_id Monitor ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] name Monitor name. Max length: 128 chars.
        # @param [String] domain Domain to query, such as `example.com`.
        # @param [MonitorRecord] record Record type to query: `A`, `AAAA`, `CNAME`, `MX`, `TXT` or `NS`. Defaults to `A`.
        # @param [String] resolver Resolver to query, as an IP address with an optional port, such as `1.1.1.1` or `[2606:4700:4700::1111]:53`. Defaults to the server&#039;s DNS resolver.
        # @param [Array] rules Rules that describe the failing state, as query strings generated with the Query class. The monitor fires when they match. Transport failures, such as timeouts, DNS failures, refused connections and denied targets, always fire. Variables: `answer` (the first record returned, compared lowercased without the trailing dot), `answers` (number of records returned), `latency` (milliseconds the check took). Operators: `equal`, `notEqual`, `lessThan`, `lessThanEqual`, `greaterThan`, `greaterThanEqual`, `between`, `notBetween`. `answer` takes `equal` and `notEqual` only. Combine rules with `or` and `and`; top-level rules must all match. Without rules it fires when the resolver returns no answers.
        # @param [Integer] interval Seconds between two checks, between 1 and 2592000. The scheduler runs on a one second tick, so one second is the shortest interval. Defaults to 60, or to the shortest interval your plan allows when that is longer. Reads back raised to your plan&#039;s minimum interval when the plan no longer allows it.
        # @param [Integer] timeout Seconds a check may take before it fails, between 1 and 60, and no longer than the interval.
        # @param [Integer] cooldown Minimum seconds between two team notifications of this monitor firing, between 300 and 2592000. Events fire on every change between firing and resolved regardless.
        # @param [] enabled Set to false to create the monitor without checking it.
        # @param [Array] notify Organization roles whose confirmed members get an email and a console notification when the monitor fires and resolves. Each must be an organization role, such as `owner` or `developer`. Defaults to owners; pass an empty list to rely on the alert events alone.
        # @param [MonitorSeverity] severity How urgent the monitor&#039;s alerts are: `info`, `warning`, `error` or `critical`. Critical alerts may be delivered with higher urgency by the notification channels that support it, such as a push that rings through silent mode.
        # @param [String] escalation_id ID of an escalation of the organization that notifies the team of this monitor&#039;s alerts step by step, until a member acknowledges the alert or it resolves. When set, `notify` is not used. Leave empty to notify the `notify` roles once.
        #
        # @return [Monitor]
        def create_dns_monitor(
            monitor_id:,
            name:,
            domain:,
            record: nil,
            resolver: nil,
            rules: nil,
            interval: nil,
            timeout: nil,
            cooldown: nil,
            enabled: nil,
            notify: nil,
            severity: nil,
            escalation_id: nil
        )
            if monitor_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "monitorId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if domain.nil?
                raise Appwrite::Exception.new('Missing required parameter: "domain"')
            end

            api_path = '/monitors/dns'

            api_params = {
                monitorId: monitor_id,
                name: name,
                domain: domain,
                record: record,
                resolver: resolver,
                rules: rules,
                interval: interval,
                timeout: timeout,
                cooldown: cooldown,
                enabled: enabled,
                notify: notify,
                severity: severity,
                escalationId: escalation_id,
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
                response_type: Models::Monitor
            )
        end

        # Update a DNS monitor by its unique ID. Only the parameters passed change;
        # the monitor&#039;s state, its last check and its open alert are kept. Passing
        # `rules` replaces all of them.
        #
        # @param [String] monitor_id Monitor ID.
        # @param [String] name Monitor name. Max length: 128 chars.
        # @param [String] domain Domain to query, such as `example.com`.
        # @param [MonitorRecord] record Record type to query: `A`, `AAAA`, `CNAME`, `MX`, `TXT` or `NS`.
        # @param [String] resolver Resolver to query, as an IP address with an optional port, such as `1.1.1.1` or `[2606:4700:4700::1111]:53`. Pass an empty string to use the server&#039;s DNS resolver.
        # @param [Array] rules Rules that describe the failing state, as query strings generated with the Query class. The monitor fires when they match. Transport failures, such as timeouts, DNS failures, refused connections and denied targets, always fire. Variables: `answer` (the first record returned, compared lowercased without the trailing dot), `answers` (number of records returned), `latency` (milliseconds the check took). Operators: `equal`, `notEqual`, `lessThan`, `lessThanEqual`, `greaterThan`, `greaterThanEqual`, `between`, `notBetween`. `answer` takes `equal` and `notEqual` only. Combine rules with `or` and `and`; top-level rules must all match. Without rules it fires when the resolver returns no answers. Replaces the current rules; an empty list restores the defaults.
        # @param [Integer] interval Seconds between two checks, between 1 and 2592000. The scheduler runs on a one second tick, so one second is the shortest interval. Reads back raised to your plan&#039;s minimum interval when the plan no longer allows it.
        # @param [Integer] timeout Seconds a check may take before it fails, between 1 and 60, and no longer than the interval.
        # @param [Integer] cooldown Minimum seconds between two team notifications of this monitor firing, between 300 and 2592000. Events fire on every change between firing and resolved regardless.
        # @param [] enabled Whether the monitor is checked.
        # @param [Array] notify Organization roles whose confirmed members get an email and a console notification when the monitor fires and resolves. Each must be an organization role, such as `owner` or `developer`. Pass an empty list to rely on the alert events alone.
        # @param [MonitorSeverity] severity How urgent the monitor&#039;s alerts are: `info`, `warning`, `error` or `critical`. Critical alerts may be delivered with higher urgency by the notification channels that support it, such as a push that rings through silent mode.
        # @param [String] escalation_id ID of an escalation of the organization that notifies the team of this monitor&#039;s alerts step by step, until a member acknowledges the alert or it resolves. When set, `notify` is not used. Pass an empty string to go back to the `notify` roles.
        #
        # @return [Monitor]
        def update_dns_monitor(
            monitor_id:,
            name: nil,
            domain: nil,
            record: nil,
            resolver: nil,
            rules: nil,
            interval: nil,
            timeout: nil,
            cooldown: nil,
            enabled: nil,
            notify: nil,
            severity: nil,
            escalation_id: nil
        )
            if monitor_id.nil? || monitor_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "monitorId"')
            end

            api_path = '/monitors/dns/{monitorId}'
                .gsub('{monitorId}', @client.encode_path(monitor_id))

            api_params = {
                name: name,
                domain: domain,
                record: record,
                resolver: resolver,
                rules: rules,
                interval: interval,
                timeout: timeout,
                cooldown: cooldown,
                enabled: enabled,
                notify: notify,
                severity: severity,
                escalationId: escalation_id,
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
                response_type: Models::Monitor
            )
        end

        # Create an HTTP monitor. It requests a URL on its own interval, following
        # redirects, and opens an alert when the request fails or when its rules
        # match the response, by default a status outside 2xx or the certificate of
        # an HTTPS URL about to expire. The response body is discarded as it arrives.
        # Each alert fires the `monitors.[monitorId].alerts.[alertId].create` event
        # when it opens and `.update` when a check passes again, for project
        # webhooks, functions and realtime, and notifies the organization&#039;s members
        # by email and in the console.
        #
        # @param [String] monitor_id Monitor ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] name Monitor name. Max length: 128 chars.
        # @param [String] url URL to request, with an `http` or `https` scheme.
        # @param [MonitorMethod] method HTTP method to request the URL with: `GET`, `HEAD`, `POST`, `PUT`, `PATCH`, `DELETE` or `OPTIONS`. Defaults to `GET`.
        # @param [Hash] headers HTTP headers to send, as an object of header names and values. Each name must be a valid HTTP header name.
        # @param [String] body Request body to send. Max length: 16384 chars.
        # @param [Array] rules Rules that describe the failing state, as query strings generated with the Query class. The monitor fires when they match. Transport failures, such as timeouts, DNS failures, refused connections and denied targets, always fire. Variables: `statusCode` (HTTP status), `latency` (milliseconds the check took), `certificateDays` (whole days until the certificate expires), `certificateLifetime` (percent of the certificate&#039;s lifetime left). Operators: `equal`, `notEqual`, `lessThan`, `lessThanEqual`, `greaterThan`, `greaterThanEqual`, `between`, `notBetween`. Combine rules with `or` and `and`; top-level rules must all match. Without rules it fires on a status code outside 200 to 299, or on a certificate with fewer than 14 days and less than 25% of its lifetime left.
        # @param [Integer] interval Seconds between two checks, between 1 and 2592000. The scheduler runs on a one second tick, so one second is the shortest interval. Defaults to 60, or to the shortest interval your plan allows when that is longer. Reads back raised to your plan&#039;s minimum interval when the plan no longer allows it.
        # @param [Integer] timeout Seconds a check may take before it fails, between 1 and 60, and no longer than the interval.
        # @param [Integer] cooldown Minimum seconds between two team notifications of this monitor firing, between 300 and 2592000. Events fire on every change between firing and resolved regardless.
        # @param [] enabled Set to false to create the monitor without checking it.
        # @param [Array] notify Organization roles whose confirmed members get an email and a console notification when the monitor fires and resolves. Each must be an organization role, such as `owner` or `developer`. Defaults to owners; pass an empty list to rely on the alert events alone.
        # @param [MonitorSeverity] severity How urgent the monitor&#039;s alerts are: `info`, `warning`, `error` or `critical`. Critical alerts may be delivered with higher urgency by the notification channels that support it, such as a push that rings through silent mode.
        # @param [String] escalation_id ID of an escalation of the organization that notifies the team of this monitor&#039;s alerts step by step, until a member acknowledges the alert or it resolves. When set, `notify` is not used. Leave empty to notify the `notify` roles once.
        #
        # @return [Monitor]
        def create_http_monitor(
            monitor_id:,
            name:,
            url:,
            method: nil,
            headers: nil,
            body: nil,
            rules: nil,
            interval: nil,
            timeout: nil,
            cooldown: nil,
            enabled: nil,
            notify: nil,
            severity: nil,
            escalation_id: nil
        )
            if monitor_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "monitorId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if url.nil?
                raise Appwrite::Exception.new('Missing required parameter: "url"')
            end

            api_path = '/monitors/http'

            api_params = {
                monitorId: monitor_id,
                name: name,
                url: url,
                method: method,
                headers: headers,
                body: body,
                rules: rules,
                interval: interval,
                timeout: timeout,
                cooldown: cooldown,
                enabled: enabled,
                notify: notify,
                severity: severity,
                escalationId: escalation_id,
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
                response_type: Models::Monitor
            )
        end

        # Update an HTTP monitor by its unique ID. Only the parameters passed change;
        # the monitor&#039;s state, its last check and its open alert are kept. Passing
        # `rules` replaces all of them.
        #
        # @param [String] monitor_id Monitor ID.
        # @param [String] name Monitor name. Max length: 128 chars.
        # @param [String] url URL to request, with an `http` or `https` scheme.
        # @param [MonitorMethod] method HTTP method to request the URL with: `GET`, `HEAD`, `POST`, `PUT`, `PATCH`, `DELETE` or `OPTIONS`.
        # @param [Hash] headers HTTP headers to send, as an object of header names and values. Each name must be a valid HTTP header name.
        # @param [String] body Request body to send. Max length: 16384 chars.
        # @param [Array] rules Rules that describe the failing state, as query strings generated with the Query class. The monitor fires when they match. Transport failures, such as timeouts, DNS failures, refused connections and denied targets, always fire. Variables: `statusCode` (HTTP status), `latency` (milliseconds the check took), `certificateDays` (whole days until the certificate expires), `certificateLifetime` (percent of the certificate&#039;s lifetime left). Operators: `equal`, `notEqual`, `lessThan`, `lessThanEqual`, `greaterThan`, `greaterThanEqual`, `between`, `notBetween`. Combine rules with `or` and `and`; top-level rules must all match. Without rules it fires on a status code outside 200 to 299, or on a certificate with fewer than 14 days and less than 25% of its lifetime left. Replaces the current rules; an empty list restores the defaults.
        # @param [Integer] interval Seconds between two checks, between 1 and 2592000. The scheduler runs on a one second tick, so one second is the shortest interval. Reads back raised to your plan&#039;s minimum interval when the plan no longer allows it.
        # @param [Integer] timeout Seconds a check may take before it fails, between 1 and 60, and no longer than the interval.
        # @param [Integer] cooldown Minimum seconds between two team notifications of this monitor firing, between 300 and 2592000. Events fire on every change between firing and resolved regardless.
        # @param [] enabled Whether the monitor is checked.
        # @param [Array] notify Organization roles whose confirmed members get an email and a console notification when the monitor fires and resolves. Each must be an organization role, such as `owner` or `developer`. Pass an empty list to rely on the alert events alone.
        # @param [MonitorSeverity] severity How urgent the monitor&#039;s alerts are: `info`, `warning`, `error` or `critical`. Critical alerts may be delivered with higher urgency by the notification channels that support it, such as a push that rings through silent mode.
        # @param [String] escalation_id ID of an escalation of the organization that notifies the team of this monitor&#039;s alerts step by step, until a member acknowledges the alert or it resolves. When set, `notify` is not used. Pass an empty string to go back to the `notify` roles.
        #
        # @return [Monitor]
        def update_http_monitor(
            monitor_id:,
            name: nil,
            url: nil,
            method: nil,
            headers: nil,
            body: nil,
            rules: nil,
            interval: nil,
            timeout: nil,
            cooldown: nil,
            enabled: nil,
            notify: nil,
            severity: nil,
            escalation_id: nil
        )
            if monitor_id.nil? || monitor_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "monitorId"')
            end

            api_path = '/monitors/http/{monitorId}'
                .gsub('{monitorId}', @client.encode_path(monitor_id))

            api_params = {
                name: name,
                url: url,
                method: method,
                headers: headers,
                body: body,
                rules: rules,
                interval: interval,
                timeout: timeout,
                cooldown: cooldown,
                enabled: enabled,
                notify: notify,
                severity: severity,
                escalationId: escalation_id,
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
                response_type: Models::Monitor
            )
        end

        # Create an SMTP monitor. It reads a mail server&#039;s greeting, sends `EHLO`
        # and, as its TLS mode asks, upgrades with `STARTTLS` or speaks TLS from the
        # start, on its own interval. It opens an alert when the server cannot be
        # reached, refuses the session or fails the TLS handshake, or when its rules
        # match. It never authenticates or sends mail. Each alert fires the
        # `monitors.[monitorId].alerts.[alertId].create` event when it opens and
        # `.update` when a check passes again, for project webhooks, functions and
        # realtime, and notifies the organization&#039;s members by email and in the
        # console.
        #
        # @param [String] monitor_id Monitor ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] name Monitor name. Max length: 128 chars.
        # @param [String] host Hostname or IP address of the mail server.
        # @param [Integer] port Port to connect to, such as 25, 465 or 587.
        # @param [MonitorTlsMode] tls_mode TLS mode: `auto` (`implicit` on port 465, `starttls` on 587 and `none` otherwise), `none`, `starttls` (upgrade after the greeting, and fail when the server does not offer it) or `implicit` (TLS from the first byte). Defaults to `auto`.
        # @param [Array] rules Rules that describe the failing state, as query strings generated with the Query class. The monitor fires when they match. Transport failures, such as timeouts, DNS failures, refused connections and denied targets, always fire. Variables: `code` (SMTP reply code), `latency` (milliseconds the check took), `certificateDays` (whole days until the certificate expires), `certificateLifetime` (percent of the certificate&#039;s lifetime left). Operators: `equal`, `notEqual`, `lessThan`, `lessThanEqual`, `greaterThan`, `greaterThanEqual`, `between`, `notBetween`. Combine rules with `or` and `and`; top-level rules must all match. Without rules it fires on transport failures only.
        # @param [Integer] interval Seconds between two checks, between 1 and 2592000. The scheduler runs on a one second tick, so one second is the shortest interval. Defaults to 60, or to the shortest interval your plan allows when that is longer. Reads back raised to your plan&#039;s minimum interval when the plan no longer allows it.
        # @param [Integer] timeout Seconds a check may take before it fails, between 1 and 60, and no longer than the interval.
        # @param [Integer] cooldown Minimum seconds between two team notifications of this monitor firing, between 300 and 2592000. Events fire on every change between firing and resolved regardless.
        # @param [] enabled Set to false to create the monitor without checking it.
        # @param [Array] notify Organization roles whose confirmed members get an email and a console notification when the monitor fires and resolves. Each must be an organization role, such as `owner` or `developer`. Defaults to owners; pass an empty list to rely on the alert events alone.
        # @param [MonitorSeverity] severity How urgent the monitor&#039;s alerts are: `info`, `warning`, `error` or `critical`. Critical alerts may be delivered with higher urgency by the notification channels that support it, such as a push that rings through silent mode.
        # @param [String] escalation_id ID of an escalation of the organization that notifies the team of this monitor&#039;s alerts step by step, until a member acknowledges the alert or it resolves. When set, `notify` is not used. Leave empty to notify the `notify` roles once.
        #
        # @return [Monitor]
        def create_smtp_monitor(
            monitor_id:,
            name:,
            host:,
            port:,
            tls_mode: nil,
            rules: nil,
            interval: nil,
            timeout: nil,
            cooldown: nil,
            enabled: nil,
            notify: nil,
            severity: nil,
            escalation_id: nil
        )
            if monitor_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "monitorId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if host.nil?
                raise Appwrite::Exception.new('Missing required parameter: "host"')
            end

            if port.nil?
                raise Appwrite::Exception.new('Missing required parameter: "port"')
            end

            api_path = '/monitors/smtp'

            api_params = {
                monitorId: monitor_id,
                name: name,
                host: host,
                port: port,
                tlsMode: tls_mode,
                rules: rules,
                interval: interval,
                timeout: timeout,
                cooldown: cooldown,
                enabled: enabled,
                notify: notify,
                severity: severity,
                escalationId: escalation_id,
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
                response_type: Models::Monitor
            )
        end

        # Update an SMTP monitor by its unique ID. Only the parameters passed change;
        # the monitor&#039;s state, its last check and its open alert are kept. Passing
        # `rules` replaces all of them.
        #
        # @param [String] monitor_id Monitor ID.
        # @param [String] name Monitor name. Max length: 128 chars.
        # @param [String] host Hostname or IP address of the mail server.
        # @param [Integer] port Port to connect to, such as 25, 465 or 587.
        # @param [MonitorTlsMode] tls_mode TLS mode: `auto` (`implicit` on port 465, `starttls` on 587 and `none` otherwise), `none`, `starttls` (upgrade after the greeting, and fail when the server does not offer it) or `implicit` (TLS from the first byte).
        # @param [Array] rules Rules that describe the failing state, as query strings generated with the Query class. The monitor fires when they match. Transport failures, such as timeouts, DNS failures, refused connections and denied targets, always fire. Variables: `code` (SMTP reply code), `latency` (milliseconds the check took), `certificateDays` (whole days until the certificate expires), `certificateLifetime` (percent of the certificate&#039;s lifetime left). Operators: `equal`, `notEqual`, `lessThan`, `lessThanEqual`, `greaterThan`, `greaterThanEqual`, `between`, `notBetween`. Combine rules with `or` and `and`; top-level rules must all match. Without rules it fires on transport failures only. Replaces the current rules; an empty list removes them.
        # @param [Integer] interval Seconds between two checks, between 1 and 2592000. The scheduler runs on a one second tick, so one second is the shortest interval. Reads back raised to your plan&#039;s minimum interval when the plan no longer allows it.
        # @param [Integer] timeout Seconds a check may take before it fails, between 1 and 60, and no longer than the interval.
        # @param [Integer] cooldown Minimum seconds between two team notifications of this monitor firing, between 300 and 2592000. Events fire on every change between firing and resolved regardless.
        # @param [] enabled Whether the monitor is checked.
        # @param [Array] notify Organization roles whose confirmed members get an email and a console notification when the monitor fires and resolves. Each must be an organization role, such as `owner` or `developer`. Pass an empty list to rely on the alert events alone.
        # @param [MonitorSeverity] severity How urgent the monitor&#039;s alerts are: `info`, `warning`, `error` or `critical`. Critical alerts may be delivered with higher urgency by the notification channels that support it, such as a push that rings through silent mode.
        # @param [String] escalation_id ID of an escalation of the organization that notifies the team of this monitor&#039;s alerts step by step, until a member acknowledges the alert or it resolves. When set, `notify` is not used. Pass an empty string to go back to the `notify` roles.
        #
        # @return [Monitor]
        def update_smtp_monitor(
            monitor_id:,
            name: nil,
            host: nil,
            port: nil,
            tls_mode: nil,
            rules: nil,
            interval: nil,
            timeout: nil,
            cooldown: nil,
            enabled: nil,
            notify: nil,
            severity: nil,
            escalation_id: nil
        )
            if monitor_id.nil? || monitor_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "monitorId"')
            end

            api_path = '/monitors/smtp/{monitorId}'
                .gsub('{monitorId}', @client.encode_path(monitor_id))

            api_params = {
                name: name,
                host: host,
                port: port,
                tlsMode: tls_mode,
                rules: rules,
                interval: interval,
                timeout: timeout,
                cooldown: cooldown,
                enabled: enabled,
                notify: notify,
                severity: severity,
                escalationId: escalation_id,
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
                response_type: Models::Monitor
            )
        end

        # Create a TCP monitor. It opens a connection to a host and port on its own
        # interval and closes it at once, and opens an alert when the connection
        # cannot be made, or when its rules match. Each alert fires the
        # `monitors.[monitorId].alerts.[alertId].create` event when it opens and
        # `.update` when a check passes again, for project webhooks, functions and
        # realtime, and notifies the organization&#039;s members by email and in the
        # console.
        #
        # @param [String] monitor_id Monitor ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] name Monitor name. Max length: 128 chars.
        # @param [String] host Hostname or IP address to connect to.
        # @param [Integer] port Port to connect to.
        # @param [Array] rules Rules that describe the failing state, as query strings generated with the Query class. The monitor fires when they match. Transport failures, such as timeouts, DNS failures, refused connections and denied targets, always fire. Variables: `latency` (milliseconds the check took). Operators: `equal`, `notEqual`, `lessThan`, `lessThanEqual`, `greaterThan`, `greaterThanEqual`, `between`, `notBetween`. Combine rules with `or` and `and`; top-level rules must all match. Without rules it fires on transport failures only.
        # @param [Integer] interval Seconds between two checks, between 1 and 2592000. The scheduler runs on a one second tick, so one second is the shortest interval. Defaults to 60, or to the shortest interval your plan allows when that is longer. Reads back raised to your plan&#039;s minimum interval when the plan no longer allows it.
        # @param [Integer] timeout Seconds a check may take before it fails, between 1 and 60, and no longer than the interval.
        # @param [Integer] cooldown Minimum seconds between two team notifications of this monitor firing, between 300 and 2592000. Events fire on every change between firing and resolved regardless.
        # @param [] enabled Set to false to create the monitor without checking it.
        # @param [Array] notify Organization roles whose confirmed members get an email and a console notification when the monitor fires and resolves. Each must be an organization role, such as `owner` or `developer`. Defaults to owners; pass an empty list to rely on the alert events alone.
        # @param [MonitorSeverity] severity How urgent the monitor&#039;s alerts are: `info`, `warning`, `error` or `critical`. Critical alerts may be delivered with higher urgency by the notification channels that support it, such as a push that rings through silent mode.
        # @param [String] escalation_id ID of an escalation of the organization that notifies the team of this monitor&#039;s alerts step by step, until a member acknowledges the alert or it resolves. When set, `notify` is not used. Leave empty to notify the `notify` roles once.
        #
        # @return [Monitor]
        def create_tcp_monitor(
            monitor_id:,
            name:,
            host:,
            port:,
            rules: nil,
            interval: nil,
            timeout: nil,
            cooldown: nil,
            enabled: nil,
            notify: nil,
            severity: nil,
            escalation_id: nil
        )
            if monitor_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "monitorId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if host.nil?
                raise Appwrite::Exception.new('Missing required parameter: "host"')
            end

            if port.nil?
                raise Appwrite::Exception.new('Missing required parameter: "port"')
            end

            api_path = '/monitors/tcp'

            api_params = {
                monitorId: monitor_id,
                name: name,
                host: host,
                port: port,
                rules: rules,
                interval: interval,
                timeout: timeout,
                cooldown: cooldown,
                enabled: enabled,
                notify: notify,
                severity: severity,
                escalationId: escalation_id,
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
                response_type: Models::Monitor
            )
        end

        # Update a TCP monitor by its unique ID. Only the parameters passed change;
        # the monitor&#039;s state, its last check and its open alert are kept. Passing
        # `rules` replaces all of them.
        #
        # @param [String] monitor_id Monitor ID.
        # @param [String] name Monitor name. Max length: 128 chars.
        # @param [String] host Hostname or IP address to connect to.
        # @param [Integer] port Port to connect to.
        # @param [Array] rules Rules that describe the failing state, as query strings generated with the Query class. The monitor fires when they match. Transport failures, such as timeouts, DNS failures, refused connections and denied targets, always fire. Variables: `latency` (milliseconds the check took). Operators: `equal`, `notEqual`, `lessThan`, `lessThanEqual`, `greaterThan`, `greaterThanEqual`, `between`, `notBetween`. Combine rules with `or` and `and`; top-level rules must all match. Without rules it fires on transport failures only. Replaces the current rules; an empty list removes them.
        # @param [Integer] interval Seconds between two checks, between 1 and 2592000. The scheduler runs on a one second tick, so one second is the shortest interval. Reads back raised to your plan&#039;s minimum interval when the plan no longer allows it.
        # @param [Integer] timeout Seconds a check may take before it fails, between 1 and 60, and no longer than the interval.
        # @param [Integer] cooldown Minimum seconds between two team notifications of this monitor firing, between 300 and 2592000. Events fire on every change between firing and resolved regardless.
        # @param [] enabled Whether the monitor is checked.
        # @param [Array] notify Organization roles whose confirmed members get an email and a console notification when the monitor fires and resolves. Each must be an organization role, such as `owner` or `developer`. Pass an empty list to rely on the alert events alone.
        # @param [MonitorSeverity] severity How urgent the monitor&#039;s alerts are: `info`, `warning`, `error` or `critical`. Critical alerts may be delivered with higher urgency by the notification channels that support it, such as a push that rings through silent mode.
        # @param [String] escalation_id ID of an escalation of the organization that notifies the team of this monitor&#039;s alerts step by step, until a member acknowledges the alert or it resolves. When set, `notify` is not used. Pass an empty string to go back to the `notify` roles.
        #
        # @return [Monitor]
        def update_tcp_monitor(
            monitor_id:,
            name: nil,
            host: nil,
            port: nil,
            rules: nil,
            interval: nil,
            timeout: nil,
            cooldown: nil,
            enabled: nil,
            notify: nil,
            severity: nil,
            escalation_id: nil
        )
            if monitor_id.nil? || monitor_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "monitorId"')
            end

            api_path = '/monitors/tcp/{monitorId}'
                .gsub('{monitorId}', @client.encode_path(monitor_id))

            api_params = {
                name: name,
                host: host,
                port: port,
                rules: rules,
                interval: interval,
                timeout: timeout,
                cooldown: cooldown,
                enabled: enabled,
                notify: notify,
                severity: severity,
                escalationId: escalation_id,
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
                response_type: Models::Monitor
            )
        end

        # Create a usage monitor. It reads a usage metric of the project, or of one
        # of its databases, buckets, functions or sites, on a schedule, and opens an
        # alert when all its rules hold. Each alert fires the
        # `monitors.[monitorId].alerts.[alertId].create` event when it opens and
        # `.update` when usage recovers, for project webhooks, functions and
        # realtime, and notifies the confirmed members of the `notify` roles by email
        # and in the console, or the steps of the escalation set by `escalationId`.
        #
        # @param [String] monitor_id Monitor ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] name Monitor name. Max length: 128 chars.
        # @param [Array] rules Rules that must all hold for the monitor to fire, as query strings generated with the Query class: one comparing a usage metric, named as the usage endpoints name it (such as `network.outbound` or `databases.operations.reads`), with a threshold in the metric&#039;s unit (bytes for storage and bandwidth, MB-seconds for GB-hours, a count otherwise), and optionally `equal` rules on `resourceType` and `resourceId` to watch one database, bucket, function or site instead of the whole project.
        # @param [Integer] window Seconds a counter metric is summed over, between 60 and 2592000. Gauges compare their latest value.
        # @param [Integer] cooldown Minimum seconds between two team notifications of this monitor firing, between 300 and 2592000. Events fire on every change between firing and resolved regardless.
        # @param [] enabled Set to false to create the monitor without evaluating it.
        # @param [Array] notify Organization roles whose confirmed members get an email and a console notification when the monitor fires and resolves. Each must be an organization role, such as `owner` or `developer`. Defaults to owners; pass an empty list to rely on the alert events alone.
        # @param [MonitorSeverity] severity How urgent the monitor&#039;s alerts are: `info`, `warning`, `error` or `critical`. Critical alerts may be delivered with higher urgency by the notification channels that support it, such as a push that rings through silent mode.
        # @param [String] escalation_id ID of an escalation of the organization that notifies the team of this monitor&#039;s alerts step by step, until a member acknowledges the alert or it resolves. When set, `notify` is not used. Leave empty to notify the `notify` roles once.
        #
        # @return [Monitor]
        def create_usage_monitor(
            monitor_id:,
            name:,
            rules:,
            window: nil,
            cooldown: nil,
            enabled: nil,
            notify: nil,
            severity: nil,
            escalation_id: nil
        )
            if monitor_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "monitorId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if rules.nil?
                raise Appwrite::Exception.new('Missing required parameter: "rules"')
            end

            api_path = '/monitors/usage'

            api_params = {
                monitorId: monitor_id,
                name: name,
                rules: rules,
                window: window,
                cooldown: cooldown,
                enabled: enabled,
                notify: notify,
                severity: severity,
                escalationId: escalation_id,
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
                response_type: Models::Monitor
            )
        end

        # Update a usage monitor by its unique ID. Only the parameters passed change;
        # the monitor&#039;s state and its open alert are kept. Passing `rules` replaces
        # all of them.
        #
        # @param [String] monitor_id Monitor ID.
        # @param [String] name Monitor name. Max length: 128 chars.
        # @param [Array] rules Rules that must all hold for the monitor to fire, as query strings generated with the Query class: one comparing a usage metric, named as the usage endpoints name it (such as `network.outbound` or `databases.operations.reads`), with a threshold in the metric&#039;s unit (bytes for storage and bandwidth, MB-seconds for GB-hours, a count otherwise), and optionally `equal` rules on `resourceType` and `resourceId` to watch one database, bucket, function or site instead of the whole project. Replaces the current rules.
        # @param [Integer] window Seconds a counter metric is summed over, between 60 and 2592000. Gauges compare their latest value.
        # @param [Integer] cooldown Minimum seconds between two team notifications of this monitor firing, between 300 and 2592000. Events fire on every change between firing and resolved regardless.
        # @param [] enabled Whether the monitor is evaluated.
        # @param [Array] notify Organization roles whose confirmed members get an email and a console notification when the monitor fires and resolves. Each must be an organization role, such as `owner` or `developer`. Pass an empty list to rely on the alert events alone; pass null or omit to keep the current roles.
        # @param [MonitorSeverity] severity How urgent the monitor&#039;s alerts are: `info`, `warning`, `error` or `critical`. Critical alerts may be delivered with higher urgency by the notification channels that support it, such as a push that rings through silent mode. Omit to keep the current one.
        # @param [String] escalation_id ID of an escalation of the organization that notifies the team of this monitor&#039;s alerts step by step, until a member acknowledges the alert or it resolves. When set, `notify` is not used. Pass an empty string to go back to the `notify` roles; pass null or omit to keep the current one.
        #
        # @return [Monitor]
        def update_usage_monitor(
            monitor_id:,
            name: nil,
            rules: nil,
            window: nil,
            cooldown: nil,
            enabled: nil,
            notify: nil,
            severity: nil,
            escalation_id: nil
        )
            if monitor_id.nil? || monitor_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "monitorId"')
            end

            api_path = '/monitors/usage/{monitorId}'
                .gsub('{monitorId}', @client.encode_path(monitor_id))

            api_params = {
                name: name,
                rules: rules,
                window: window,
                cooldown: cooldown,
                enabled: enabled,
                notify: notify,
                severity: severity,
                escalationId: escalation_id,
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
                response_type: Models::Monitor
            )
        end

        # Get a monitor by its unique ID, with its state as of its last evaluation.
        #
        # @param [String] monitor_id Monitor ID.
        #
        # @return [Monitor]
        def get(
            monitor_id:
        )
            if monitor_id.nil? || monitor_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "monitorId"')
            end

            api_path = '/monitors/{monitorId}'
                .gsub('{monitorId}', @client.encode_path(monitor_id))

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
                response_type: Models::Monitor
            )
        end

        # Delete a monitor by its unique ID. It stops being evaluated; an alert it is
        # firing is resolved and kept with the rest of its alert history.
        #
        # @param [String] monitor_id Monitor ID.
        #
        # @return []
        def delete(
            monitor_id:
        )
            if monitor_id.nil? || monitor_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "monitorId"')
            end

            api_path = '/monitors/{monitorId}'
                .gsub('{monitorId}', @client.encode_path(monitor_id))

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
