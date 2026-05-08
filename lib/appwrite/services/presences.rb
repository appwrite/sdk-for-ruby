#frozen_string_literal: true

module Appwrite
    class Presences < Service

        def initialize(client)
            @client = client
        end

        # List presence logs.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        # @param [Integer] ttl TTL (seconds) for caching list responses. Responses are stored in an in-memory key-value cache, keyed per project, collection, schema version (attributes and indexes), caller authorization roles, and the exact query — so users with different permissions never share cached entries. Schema changes invalidate cached entries automatically; document writes do not, so choose a TTL you are comfortable serving as stale data. Set to 0 to disable caching. Must be between 0 and 86400 (24 hours).
        #
        # @return [PresenceList]
        def list(queries: nil, total: nil, ttl: nil)
            api_path = '/presences'

            api_params = {
                queries: queries,
                total: total,
                ttl: ttl,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::PresenceList
            )

        end

        # Get a presence log by its unique ID.
        #
        # @param [String] presence_id Presence unique ID.
        #
        # @return [Presence]
        def get(presence_id:)
            api_path = '/presences/{presenceId}'
                .gsub('{presenceId}', presence_id)

            if presence_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "presenceId"')
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
                response_type: Models::Presence
            )

        end

        # Create or update a presence log by its unique ID.
        #
        # @param [String] presence_id Presence unique ID.
        # @param [String] user_id User ID.
        # @param [String] status Presence status.
        # @param [Array] permissions An array of permissions strings. By default, only the current user is granted all permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [String] expires_at Presence expiry datetime.
        # @param [Hash] metadata Presence metadata object.
        #
        # @return [Presence]
        def upsert(presence_id:, user_id:, status:, permissions: nil, expires_at: nil, metadata: nil)
            api_path = '/presences/{presenceId}'
                .gsub('{presenceId}', presence_id)

            if presence_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "presenceId"')
            end

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if status.nil?
              raise Appwrite::Exception.new('Missing required parameter: "status"')
            end

            api_params = {
                userId: user_id,
                status: status,
                permissions: permissions,
                expiresAt: expires_at,
                metadata: metadata,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Presence
            )

        end

        # Update a presence log by its unique ID.
        #
        # @param [String] presence_id Presence unique ID.
        # @param [String] user_id User ID.
        # @param [String] status Presence status.
        # @param [String] expires_at Presence expiry datetime.
        # @param [Hash] metadata Presence metadata object.
        # @param [Array] permissions An array of permissions strings. By default, only the current user is granted all permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
        # @param [] purge When true, purge cached responses used by list presences endpoint.
        #
        # @return [Presence]
        def update_presence(presence_id:, user_id:, status: nil, expires_at: nil, metadata: nil, permissions: nil, purge: nil)
            api_path = '/presences/{presenceId}'
                .gsub('{presenceId}', presence_id)

            if presence_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "presenceId"')
            end

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            api_params = {
                userId: user_id,
                status: status,
                expiresAt: expires_at,
                metadata: metadata,
                permissions: permissions,
                purge: purge,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Presence
            )

        end

        # Delete a presence log by its unique ID.
        #
        # @param [String] presence_id Presence unique ID.
        #
        # @return []
        def delete(presence_id:)
            api_path = '/presences/{presenceId}'
                .gsub('{presenceId}', presence_id)

            if presence_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "presenceId"')
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

    end 
end
