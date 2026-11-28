# frozen_string_literal: true

module Appwrite
    class Analytics < Service
        def initialize(client)
            @client = client
        end

        # List analytics properties for the current project.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, domain, enabled, type
        # @param [String] search Search term to filter your list results. Matches the property ID, name and domain. Max length: 256 chars.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [AnalyticsPropertyList]
        def list_properties(
            queries: nil,
            search: nil,
            total: nil
        )
            api_path = '/analytics/properties'

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
                response_type: Models::AnalyticsPropertyList
            )
        end

        # Create a new analytics property to track a website or application.
        #
        # @param [String] property_id Unique ID. Choose a custom ID or generate a random ID with `ID.unique()`. Max length is 36 chars.
        # @param [String] name Human-readable name for this property.
        # @param [String] domain Primary domain to track (e.g. example.com). May be empty for mobile and agent properties.
        # @param [] enabled Whether the property accepts events. Events sent to a disabled property are rejected as not found.
        # @param [Array] allowed_origins Allowed origins for tracking. Use [&quot;*&quot;] to allow all.
        # @param [] identify_users Record the signed-in user&#039;s ID on events sent from a client session, so traffic can be broken down and counted by user. Off by default.
        # @param [AnalyticsPropertyType] type Kind of product this property tracks. Only changes which panels the dashboard shows; ingestion accepts the same events for every type.
        #
        # @return [AnalyticsProperty]
        def create_property(
            property_id:,
            name:,
            domain: nil,
            enabled: nil,
            allowed_origins: nil,
            identify_users: nil,
            type: nil
        )
            if property_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "propertyId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_path = '/analytics/properties'

            api_params = {
                propertyId: property_id,
                name: name,
                domain: domain,
                enabled: enabled,
                allowedOrigins: allowed_origins,
                identifyUsers: identify_users,
                type: type,
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
                response_type: Models::AnalyticsProperty
            )
        end

        # Get an analytics property by ID.
        #
        # @param [String] property_id Analytics property unique ID.
        #
        # @return [AnalyticsProperty]
        def get_property(
            property_id:
        )
            if property_id.nil? || property_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "propertyId"')
            end

            api_path = '/analytics/properties/{propertyId}'
                .gsub('{propertyId}', @client.encode_path(property_id))

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
                response_type: Models::AnalyticsProperty
            )
        end

        # Update an analytics property. Only the attributes you pass are changed;
        # omitted attributes keep their current value.
        #
        # @param [String] property_id Analytics property unique ID.
        # @param [String] name Human-readable name for this property.
        # @param [String] domain Primary domain to track (e.g. example.com). Pass an empty string to clear it.
        # @param [] enabled Whether the property accepts events. Events sent to a disabled property are rejected as not found.
        # @param [Array] allowed_origins Allowed origins for tracking. Use [&quot;*&quot;] to allow all. On a property linked to a site, Appwrite manages this list: it is rewritten from the site&#039;s production domains whenever they change.
        # @param [] identify_users Record the signed-in user&#039;s ID on events sent from a client session, so traffic can be broken down and counted by user.
        # @param [AnalyticsPropertyType] type Kind of product this property tracks. Only changes which panels the dashboard shows; stored events are kept.
        #
        # @return [AnalyticsProperty]
        def update_property(
            property_id:,
            name: nil,
            domain: nil,
            enabled: nil,
            allowed_origins: nil,
            identify_users: nil,
            type: nil
        )
            if property_id.nil? || property_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "propertyId"')
            end

            api_path = '/analytics/properties/{propertyId}'
                .gsub('{propertyId}', @client.encode_path(property_id))

            api_params = {
                name: name,
                domain: domain,
                enabled: enabled,
                allowedOrigins: allowed_origins,
                identifyUsers: identify_users,
                type: type,
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
                response_type: Models::AnalyticsProperty
            )
        end

        # Delete an analytics property along with every event and session collected
        # for it. This cannot be undone.
        #
        # @param [String] property_id Analytics property unique ID.
        #
        # @return []
        def delete_property(
            property_id:
        )
            if property_id.nil? || property_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "propertyId"')
            end

            api_path = '/analytics/properties/{propertyId}'
                .gsub('{propertyId}', @client.encode_path(property_id))

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

        # List the annotations of an analytics property. Filter on `date` to fetch
        # the annotations inside a chart&#039;s time range.
        #
        # @param [String] property_id Analytics property unique ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: date
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [AnalyticsAnnotationList]
        def list_annotations(
            property_id:,
            queries: nil,
            total: nil
        )
            if property_id.nil? || property_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "propertyId"')
            end

            api_path = '/analytics/properties/{propertyId}/annotations'
                .gsub('{propertyId}', @client.encode_path(property_id))

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
                response_type: Models::AnalyticsAnnotationList
            )
        end

        # Create an annotation that marks a point in time on an analytics property&#039;s
        # charts.
        #
        # @param [String] property_id Analytics property unique ID.
        # @param [String] annotation_id Unique ID. Choose a custom ID or generate a random ID with `ID.unique()`. Max length is 36 chars.
        # @param [String] date Point in time the annotation marks, in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
        # @param [String] content Annotation text. Max length: 512 chars.
        #
        # @return [AnalyticsAnnotation]
        def create_annotation(
            property_id:,
            annotation_id:,
            date:,
            content:
        )
            if property_id.nil? || property_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "propertyId"')
            end

            if annotation_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "annotationId"')
            end

            if date.nil?
                raise Appwrite::Exception.new('Missing required parameter: "date"')
            end

            if content.nil?
                raise Appwrite::Exception.new('Missing required parameter: "content"')
            end

            api_path = '/analytics/properties/{propertyId}/annotations'
                .gsub('{propertyId}', @client.encode_path(property_id))

            api_params = {
                annotationId: annotation_id,
                date: date,
                content: content,
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
                response_type: Models::AnalyticsAnnotation
            )
        end

        # Get an analytics annotation by ID.
        #
        # @param [String] property_id Analytics property unique ID.
        # @param [String] annotation_id Annotation unique ID.
        #
        # @return [AnalyticsAnnotation]
        def get_annotation(
            property_id:,
            annotation_id:
        )
            if property_id.nil? || property_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "propertyId"')
            end

            if annotation_id.nil? || annotation_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "annotationId"')
            end

            api_path = '/analytics/properties/{propertyId}/annotations/{annotationId}'
                .gsub('{propertyId}', @client.encode_path(property_id))
                .gsub('{annotationId}', @client.encode_path(annotation_id))

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
                response_type: Models::AnalyticsAnnotation
            )
        end

        # Update an analytics annotation. Only the attributes you pass are changed;
        # omitted attributes keep their current value.
        #
        # @param [String] property_id Analytics property unique ID.
        # @param [String] annotation_id Annotation unique ID.
        # @param [String] date Point in time the annotation marks, in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
        # @param [String] content Annotation text. Max length: 512 chars.
        #
        # @return [AnalyticsAnnotation]
        def update_annotation(
            property_id:,
            annotation_id:,
            date: nil,
            content: nil
        )
            if property_id.nil? || property_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "propertyId"')
            end

            if annotation_id.nil? || annotation_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "annotationId"')
            end

            api_path = '/analytics/properties/{propertyId}/annotations/{annotationId}'
                .gsub('{propertyId}', @client.encode_path(property_id))
                .gsub('{annotationId}', @client.encode_path(annotation_id))

            api_params = {
                date: date,
                content: content,
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
                response_type: Models::AnalyticsAnnotation
            )
        end

        # Delete an analytics annotation.
        #
        # @param [String] property_id Analytics property unique ID.
        # @param [String] annotation_id Annotation unique ID.
        #
        # @return []
        def delete_annotation(
            property_id:,
            annotation_id:
        )
            if property_id.nil? || property_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "propertyId"')
            end

            if annotation_id.nil? || annotation_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "annotationId"')
            end

            api_path = '/analytics/properties/{propertyId}/annotations/{annotationId}'
                .gsub('{propertyId}', @client.encode_path(property_id))
                .gsub('{annotationId}', @client.encode_path(annotation_id))

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

        # Send a tracking event from a browser, native app, or server-side SDK.
        #
        # @param [String] property_id Analytics property ID.
        # @param [String] name Event name. &quot;pageview&quot; and &quot;screen_view&quot; are counted as views, every other name is a custom event.
        # @param [String] url Full page URL or screen identifier.
        # @param [String] domain Hostname (e.g. example.com).
        # @param [String] referrer Referrer URL.
        # @param [Integer] screen_width Viewport width in CSS pixels.
        # @param [String] session_hash Optional session hash (provided by SDK).
        # @param [Integer] scroll_depth Scroll depth percentage 0-100.
        # @param [Integer] engagement_time Engagement time in seconds, 0-4294967295.
        # @param [Array] props Custom string properties as a flat key=value list (max 32 entries, alternating key,value).
        # @param [String] user_id Override user ID. Pass an opaque ID, not personal data such as an email. Requires API-key auth with analytics.write scope.
        # @param [String] ip Override IP address. Requires API-key auth with analytics.write scope.
        # @param [String] user_agent Override user agent. Requires API-key auth with analytics.write scope.
        # @param [] interactive Whether this event is a visitor interaction that ends a bounce. Set false for telemetry such as heartbeats or background syncs. Defaults to true for custom events and false for the automatic engagement, scroll and app lifecycle events. Ignored for views.
        #
        # @return []
        def create_event(
            property_id:,
            name:,
            url:,
            domain: nil,
            referrer: nil,
            screen_width: nil,
            session_hash: nil,
            scroll_depth: nil,
            engagement_time: nil,
            props: nil,
            user_id: nil,
            ip: nil,
            user_agent: nil,
            interactive: nil
        )
            if property_id.nil? || property_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "propertyId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if url.nil?
                raise Appwrite::Exception.new('Missing required parameter: "url"')
            end

            api_path = '/analytics/properties/{propertyId}/events'
                .gsub('{propertyId}', @client.encode_path(property_id))

            api_params = {
                name: name,
                url: url,
                domain: domain,
                referrer: referrer,
                screenWidth: screen_width,
                sessionHash: session_hash,
                scrollDepth: scroll_depth,
                engagementTime: engagement_time,
                props: props,
                userId: user_id,
                ip: ip,
                userAgent: user_agent,
                interactive: interactive,
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
            )
        end

        # Read analytics metrics (visitors, sessions, pageviews, events, bounceRate,
        # …) for a property over a date range.
        #
        # **Three response shapes**, chosen by `dimensions[]` and `interval`:
        # - Neither: one row aggregating the whole window, with `value` and `date`
        # null. Only this shape carries `visits`, `bounceRate`, `visitDuration`,
        # `viewsPerVisit`, `scrollDepth` and `engagementTime`.
        # - `dimensions[]`: one row per dimension value, ranked by visitors, with
        # `value` set and `date` null.
        # - `interval`: one row per time bucket in chronological order, with `date`
        # set and `value` null.
        #
        # `pageviews` is carried by the flat aggregate and by `interval`, but not by
        # a breakdown.
        #
        # `userId` and `users` cover identified traffic only: events sent with an API
        # key&#039;s `userId`, or from a signed-in session on a property with
        # `identifyUsers` on. A `userId` breakdown leaves out anonymous events;
        # returned values are the project&#039;s user IDs.
        #
        # Custom event props: `dimensions[]=props` ranks the prop keys seen in the
        # window, and adding `propKey` ranks the values of that one key. `queries[]`
        # filters on a prop&#039;s value with the `props.&lt;key&gt;` attribute, e.g.
        # `equal(&quot;props.plan&quot;, [&quot;pro&quot;])`.
        #
        # Combining `dimensions[]` with `interval` is not supported yet. `queries[]`
        # filters the underlying events using standard Utopia query syntax.
        #
        # @param [String] property_id Analytics property unique ID.
        # @param [Array] queries Up to 10 filter queries in Utopia syntax. Allowed attributes: country, region, city, browser, browserVersion, operatingSystem, operatingSystemVersion, device, screenSize, referrerSource, channel, utmSource, utmMedium, utmCampaign, utmContent, utmTerm, page, hostname, trafficType, botName, botCategory, userId, eventName, and `props.&lt;key&gt;` for a custom prop. page, userId, eventName and `props.&lt;key&gt;` are only accepted alongside `interval`, or with a breakdown on a dimension other than entryPage, exitPage. Allowed methods: equal, notEqual, contains, startsWith, endsWith. Example: `queries[]=equal(&quot;country&quot;, [&quot;US&quot;])`.
        # @param [AnalyticsInterval] interval Time bucket size. Omit (null) for a flat aggregate over the whole window. Allowed: 1h, 1d, 1w, 1m.
        # @param [Array] dimensions Dimension to break the metrics down by. One at most for now; the parameter is a list so that cap can be raised without a breaking change. Allowed: country, region, city, browser, browserVersion, operatingSystem, operatingSystemVersion, device, screenSize, referrerSource, channel, utmSource, utmMedium, utmCampaign, utmContent, utmTerm, page, hostname, entryPage, exitPage, trafficType, botName, botCategory, userId, eventName, props.
        # @param [String] prop_key Custom prop key whose values to rank, with `dimensions[]=props`. Omit to rank the prop keys themselves.
        # @param [String] date_range Date range shorthand (e.g. 7d, 30d). Ignored for any bound you supply explicitly via startAt/endAt.
        # @param [String] start_at Explicit window start in ISO 8601. Defaults to endAt minus dateRange.
        # @param [String] end_at Explicit window end in ISO 8601. Defaults to the current time.
        # @param [Integer] limit Maximum number of ranked values to return.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [AnalyticsMetricList]
        def list_metrics(
            property_id:,
            queries: nil,
            interval: nil,
            dimensions: nil,
            prop_key: nil,
            date_range: nil,
            start_at: nil,
            end_at: nil,
            limit: nil,
            total: nil
        )
            if property_id.nil? || property_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "propertyId"')
            end

            api_path = '/analytics/properties/{propertyId}/metrics'
                .gsub('{propertyId}', @client.encode_path(property_id))

            api_params = {
                queries: queries,
                interval: interval,
                dimensions: dimensions,
                propKey: prop_key,
                dateRange: date_range,
                startAt: start_at,
                endAt: end_at,
                limit: limit,
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
                response_type: Models::AnalyticsMetricList
            )
        end
    end
end
