#frozen_string_literal: true

module Appwrite
    class Project < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all project environment variables.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: key, resourceType, resourceId, secret
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [VariableList]
        def list_variables(queries: nil, total: nil)
            api_path = '/project/variables'

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
                response_type: Models::VariableList
            )
        end

        # Create a new project environment variable. These variables can be accessed
        # by all functions and sites in the project.
        #
        # @param [String] variable_id Variable ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] key Variable key. Max length: 255 chars.
        # @param [String] value Variable value. Max length: 8192 chars.
        # @param [] secret Secret variables can be updated or deleted, but only projects can read them during build and runtime.
        #
        # @return [Variable]
        def create_variable(variable_id:, key:, value:, secret: nil)
            api_path = '/project/variables'

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
            end

            if key.nil?
              raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if value.nil?
              raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            api_params = {
                variableId: variable_id,
                key: key,
                value: value,
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
                response_type: Models::Variable
            )
        end

        # Get a variable by its unique ID. 
        #
        # @param [String] variable_id Variable ID.
        #
        # @return [Variable]
        def get_variable(variable_id:)
            api_path = '/project/variables/{variableId}'
                .gsub('{variableId}', variable_id)

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
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
                response_type: Models::Variable
            )
        end

        # Update variable by its unique ID.
        #
        # @param [String] variable_id Variable ID.
        # @param [String] key Variable key. Max length: 255 chars.
        # @param [String] value Variable value. Max length: 8192 chars.
        # @param [] secret Secret variables can be updated or deleted, but only projects can read them during build and runtime.
        #
        # @return [Variable]
        def update_variable(variable_id:, key: nil, value: nil, secret: nil)
            api_path = '/project/variables/{variableId}'
                .gsub('{variableId}', variable_id)

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
            end

            api_params = {
                key: key,
                value: value,
                secret: secret,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Variable
            )
        end

        # Delete a variable by its unique ID. 
        #
        # @param [String] variable_id Variable ID.
        #
        # @return []
        def delete_variable(variable_id:)
            api_path = '/project/variables/{variableId}'
                .gsub('{variableId}', variable_id)

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
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