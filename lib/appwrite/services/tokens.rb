#frozen_string_literal: true

module Appwrite
    class Tokens < Service

        def initialize(client)
            @client = client
        end

        # List all the tokens created for a specific file or bucket. You can use the
        # query params to filter your results.
        #
        # @param [String] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).
        # @param [String] file_id File unique ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: expire
        #
        # @return [ResourceTokenList]
        def list(bucket_id:, file_id:, queries: nil)
            api_path = '/tokens/buckets/{bucketId}/files/{fileId}'
                .gsub('{bucketId}', bucket_id)
                .gsub('{fileId}', file_id)

            if bucket_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

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
                response_type: Models::ResourceTokenList
            )
        end

        
        # Create a new token. A token is linked to a file. Token can be passed as a
        # request URL search parameter.
        #
        # @param [String] bucket_id Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).
        # @param [String] file_id File unique ID.
        # @param [String] expire Token expiry date
        #
        # @return [ResourceToken]
        def create_file_token(bucket_id:, file_id:, expire: nil)
            api_path = '/tokens/buckets/{bucketId}/files/{fileId}'
                .gsub('{bucketId}', bucket_id)
                .gsub('{fileId}', file_id)

            if bucket_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            api_params = {
                expire: expire,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::ResourceToken
            )
        end

        
        # Get a token by its unique ID.
        #
        # @param [String] token_id Token ID.
        #
        # @return [ResourceToken]
        def get(token_id:)
            api_path = '/tokens/{tokenId}'
                .gsub('{tokenId}', token_id)

            if token_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tokenId"')
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
                response_type: Models::ResourceToken
            )
        end

        
        # Update a token by its unique ID. Use this endpoint to update a token's
        # expiry date.
        #
        # @param [String] token_id Token unique ID.
        # @param [String] expire File token expiry date
        #
        # @return [ResourceToken]
        def update(token_id:, expire: nil)
            api_path = '/tokens/{tokenId}'
                .gsub('{tokenId}', token_id)

            if token_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tokenId"')
            end

            api_params = {
                expire: expire,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::ResourceToken
            )
        end

        
        # Delete a token by its unique ID.
        #
        # @param [String] token_id Token ID.
        #
        # @return []
        def delete(token_id:)
            api_path = '/tokens/{tokenId}'
                .gsub('{tokenId}', token_id)

            if token_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "tokenId"')
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