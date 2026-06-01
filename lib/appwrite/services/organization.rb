#frozen_string_literal: true

module Appwrite
    class Organization < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all API keys from the current organization.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: expire, accessedAt, name, scopes
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [KeyList]
        def list_keys(queries: nil, total: nil)
            api_path = '/organization/keys'

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
                response_type: Models::KeyList
            )

        end

        # Create a new organization API key.
        #
        # @param [String] key_id Key ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Key name. Max length: 128 chars.
        # @param [Array] scopes Key scopes list. Maximum of 100 scopes are allowed.
        # @param [String] expire Expiration time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. Use null for unlimited expiration.
        #
        # @return [Key]
        def create_key(key_id:, name:, scopes:, expire: nil)
            api_path = '/organization/keys'

            if key_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "keyId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if scopes.nil?
              raise Appwrite::Exception.new('Missing required parameter: "scopes"')
            end

            api_params = {
                keyId: key_id,
                name: name,
                scopes: scopes,
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
                response_type: Models::Key
            )

        end

        # Get a key by its unique ID. This endpoint returns details about a specific
        # API key in your organization including its scopes.
        #
        # @param [String] key_id Key unique ID.
        #
        # @return [Key]
        def get_key(key_id:)
            api_path = '/organization/keys/{keyId}'
                .gsub('{keyId}', key_id)

            if key_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "keyId"')
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
                response_type: Models::Key
            )

        end

        # Update a key by its unique ID. Use this endpoint to update the name,
        # scopes, or expiration time of an API key.
        #
        # @param [String] key_id Key unique ID.
        # @param [String] name Key name. Max length: 128 chars.
        # @param [Array] scopes Key scopes list. Maximum of 100 scopes are allowed.
        # @param [String] expire Expiration time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. Use null for unlimited expiration.
        #
        # @return [Key]
        def update_key(key_id:, name:, scopes:, expire: nil)
            api_path = '/organization/keys/{keyId}'
                .gsub('{keyId}', key_id)

            if key_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "keyId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if scopes.nil?
              raise Appwrite::Exception.new('Missing required parameter: "scopes"')
            end

            api_params = {
                name: name,
                scopes: scopes,
                expire: expire,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Key
            )

        end

        # Delete a key by its unique ID. Once deleted, the key can no longer be used
        # to authenticate API calls.
        #
        # @param [String] key_id Key unique ID.
        #
        # @return []
        def delete_key(key_id:)
            api_path = '/organization/keys/{keyId}'
                .gsub('{keyId}', key_id)

            if key_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "keyId"')
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

        # Get a list of all projects. You can use the query params to filter your
        # results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, teamId, labels, search
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [ProjectList]
        def list_projects(queries: nil, search: nil, total: nil)
            api_path = '/organization/projects'

            api_params = {
                queries: queries,
                search: search,
                total: total,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::ProjectList
            )

        end

        # Create a new project.
        #
        # @param [String] project_id Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, and hyphen. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Project name. Max length: 128 chars.
        # @param [Region] region Project Region.
        #
        # @return [Project]
        def create_project(project_id:, name:, region: nil)
            api_path = '/organization/projects'

            if project_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "projectId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                projectId: project_id,
                name: name,
                region: region,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Get a project.
        #
        # @param [String] project_id Project unique ID.
        #
        # @return [Project]
        def get_project(project_id:)
            api_path = '/organization/projects/{projectId}'
                .gsub('{projectId}', project_id)

            if project_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "projectId"')
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
                response_type: Models::Project
            )

        end

        # Update a project by its unique ID.
        #
        # @param [String] project_id Project unique ID.
        # @param [String] name Project name. Max length: 128 chars.
        #
        # @return [Project]
        def update_project(project_id:, name:)
            api_path = '/organization/projects/{projectId}'
                .gsub('{projectId}', project_id)

            if project_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "projectId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                name: name,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Delete a project by its unique ID.
        #
        # @param [String] project_id Project unique ID.
        #
        # @return []
        def delete_project(project_id:)
            api_path = '/organization/projects/{projectId}'
                .gsub('{projectId}', project_id)

            if project_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "projectId"')
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
