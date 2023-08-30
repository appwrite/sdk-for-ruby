#frozen_string_literal: true

module Appwrite
    class Graphql < Service

        def initialize(client)
            @client = client
        end

        # Execute a GraphQL mutation.
        #
        # @param [Hash] query The query or queries to execute.
        #
        # @return [Any]
        def query(query:)
            api_path = '/graphql'

            if query.nil?
              raise Appwrite::Exception.new('Missing required parameter: "query"')
            end

            params = {
                query: query,
            }
            
            headers = {
                "x-sdk-graphql": 'true',
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: headers,
                params: params,
            )
        end

        
        # Execute a GraphQL mutation.
        #
        # @param [Hash] query The query or queries to execute.
        #
        # @return [Any]
        def mutation(query:)
            api_path = '/graphql/mutation'

            if query.nil?
              raise Appwrite::Exception.new('Missing required parameter: "query"')
            end

            params = {
                query: query,
            }
            
            headers = {
                "x-sdk-graphql": 'true',
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: headers,
                params: params,
            )
        end

        
    end 
end