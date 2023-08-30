#frozen_string_literal: true

module Appwrite
    class Project < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all project variables. These variables will be accessible in
        # all Appwrite Functions at runtime.
        #
        #
        # @return [VariableList]
        def list_variables()
            api_path = '/project/variables'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: headers,
                params: params,
                response_type: Models::VariableList
            )
        end

        
        # Create a new project variable. This variable will be accessible in all
        # Appwrite Functions at runtime.
        #
        # @param [String] key Variable key. Max length: 255 chars.
        # @param [String] value Variable value. Max length: 8192 chars.
        #
        # @return [Variable]
        def create_variable(key:, value:)
            api_path = '/project/variables'

            if key.nil?
              raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if value.nil?
              raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            params = {
                key: key,
                value: value,
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: headers,
                params: params,
                response_type: Models::Variable
            )
        end

        
        # Get a project variable by its unique ID.
        #
        # @param [String] variable_id Variable unique ID.
        #
        # @return [Variable]
        def get_variable(variable_id:)
            api_path = '/project/variables/{variableId}'
                .gsub('{variableId}', variable_id)

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
            end

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: headers,
                params: params,
                response_type: Models::Variable
            )
        end

        
        # Update project variable by its unique ID. This variable will be accessible
        # in all Appwrite Functions at runtime.
        #
        # @param [String] variable_id Variable unique ID.
        # @param [String] key Variable key. Max length: 255 chars.
        # @param [String] value Variable value. Max length: 8192 chars.
        #
        # @return [Variable]
        def update_variable(variable_id:, key:, value: nil)
            api_path = '/project/variables/{variableId}'
                .gsub('{variableId}', variable_id)

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
            end

            if key.nil?
              raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            params = {
                key: key,
                value: value,
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: headers,
                params: params,
                response_type: Models::Variable
            )
        end

        
        # Delete a project variable by its unique ID. 
        #
        # @param [String] variable_id Variable unique ID.
        #
        # @return []
        def delete_variable(variable_id:)
            api_path = '/project/variables/{variableId}'
                .gsub('{variableId}', variable_id)

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
            end

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: headers,
                params: params,
            )
        end

        
    end 
end