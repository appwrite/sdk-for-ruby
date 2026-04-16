#frozen_string_literal: true

module Appwrite
    class Activities < Service

        def initialize(client)
            @client = client
        end

        # List all events for selected filters.
        #
        # @param [String] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on attributes such as userId, teamId, etc.
        #
        # @return [ActivityEventList]
        def list_events(queries: nil)
            api_path = '/activities/events'

            api_params = {
                queries: queries,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::ActivityEventList
            )

        end

        # Get event by ID.
        # 
        #
        # @param [String] event_id Event ID.
        #
        # @return [ActivityEvent]
        def get_event(event_id:)
            api_path = '/activities/events/{eventId}'
                .gsub('{eventId}', event_id)

            if event_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "eventId"')
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
                response_type: Models::ActivityEvent
            )

        end

    end 
end
