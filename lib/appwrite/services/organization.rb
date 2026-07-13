#frozen_string_literal: true

module Appwrite
    class Organization < Service

        def initialize(client)
            @client = client
        end

        # Get the current organization.
        #
        #
        # @return [Organization]
        def get()
            api_path = '/organization'

            api_params = {
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
                response_type: Models::Organization
            )

        end

        # Update the current organization's name.
        #
        # @param [String] name New organization name. Max length: 128 chars.
        #
        # @return [Organization]
        def update(name:)
            api_path = '/organization'

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                name: name,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Organization
            )

        end

        # Delete the current organization. All projects that belong to the
        # organization are deleted as well.
        #
        #
        # @return []
        def delete()
            api_path = '/organization'

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

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
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
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
        # @param [Array] scopes Key scopes list. Maximum of 200 scopes are allowed.
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
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
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
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
        # @param [Array] scopes Key scopes list. Maximum of 200 scopes are allowed.
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

        end

        # Get a list of all memberships from the current organization.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, teamId, invited, joined, confirm, roles
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [MembershipList]
        def list_memberships(queries: nil, search: nil, total: nil)
            api_path = '/organization/memberships'

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
                response_type: Models::MembershipList
            )

        end

        # Invite a new member to join the current organization. An email with a link
        # to join the organization will be sent to the new member's email address. If
        # member doesn't exist in the project it will be automatically created.
        #
        # @param [Array] roles Array of strings. Use this param to set the user roles in the organization. A role can be any string. Learn more about [roles and permissions](https://appwrite.io/docs/permissions). Maximum of 100 roles are allowed, each 81 characters long.
        # @param [String] email Email of the new organization member.
        # @param [String] user_id ID of the user to be added to the organization.
        # @param [String] phone Phone number. Format this number with a leading '+' and a country code, e.g., +16175551212.
        # @param [String] url URL to redirect the user back to your app from the invitation email. This parameter is not required when an API key is supplied.
        # @param [String] name Name of the new organization member. Max length: 128 chars.
        #
        # @return [Membership]
        def create_membership(roles:, email: nil, user_id: nil, phone: nil, url: nil, name: nil)
            api_path = '/organization/memberships'

            if roles.nil?
              raise Appwrite::Exception.new('Missing required parameter: "roles"')
            end

            api_params = {
                email: email,
                userId: user_id,
                phone: phone,
                roles: roles,
                url: url,
                name: name,
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
                response_type: Models::Membership
            )

        end

        # Get a membership from the current organization by its unique ID.
        #
        # @param [String] membership_id Membership ID.
        #
        # @return [Membership]
        def get_membership(membership_id:)
            api_path = '/organization/memberships/{membershipId}'
                .gsub('{membershipId}', membership_id)

            if membership_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
            end

            api_params = {
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
                response_type: Models::Membership
            )

        end

        # Modify the roles of a member in the current organization.
        #
        # @param [String] membership_id Membership ID.
        # @param [Array] roles An array of strings. Use this param to set the user's roles in the organization. A role can be any string. Learn more about [roles and permissions](https://appwrite.io/docs/permissions). Maximum of 100 roles are allowed, each 81 characters long.
        #
        # @return [Membership]
        def update_membership(membership_id:, roles:)
            api_path = '/organization/memberships/{membershipId}'
                .gsub('{membershipId}', membership_id)

            if membership_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
            end

            if roles.nil?
              raise Appwrite::Exception.new('Missing required parameter: "roles"')
            end

            api_params = {
                roles: roles,
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
                response_type: Models::Membership
            )

        end

        # Remove a member from the current organization. The member is removed
        # whether they accepted the invitation or not; a pending invitation is
        # revoked.
        #
        # @param [String] membership_id Membership ID.
        #
        # @return []
        def delete_membership(membership_id:)
            api_path = '/organization/memberships/{membershipId}'
                .gsub('{membershipId}', membership_id)

            if membership_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
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
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, teamId, labels, search, accessedAt
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
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
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
                "X-Appwrite-Project": @client.get_config('project'),
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
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
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
                "X-Appwrite-Project": @client.get_config('project'),
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
