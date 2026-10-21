# frozen_string_literal: true

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
                response_type: Models::Organization
            )
        end

        # Update the current organization&#039;s name.
        #
        # @param [String] name New organization name. Max length: 128 chars.
        #
        # @return [Organization]
        def update(
            name:
        )
            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_path = '/organization'

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

        # List app installations on the organization. Any organization member can
        # read installations.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [AppInstallationList]
        def list_installations(
            queries: nil,
            total: nil
        )
            api_path = '/organization/installations'

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
                response_type: Models::AppInstallationList
            )
        end

        # Install an app on the organization. Only organization members with the
        # owner role can install apps. The installation is granted the scopes the app
        # currently requests.
        #
        # @param [String] app_id Application unique ID.
        # @param [String] authorization_details Authorization details granted to the installation as a JSON array of objects, each with a `type` and app-defined fields. The Appwrite Console stores authorized project IDs here.
        #
        # @return [AppInstallation]
        def create_installation(
            app_id:,
            authorization_details: nil
        )
            if app_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            api_path = '/organization/installations'

            api_params = {
                appId: app_id,
                authorizationDetails: authorization_details,
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
                response_type: Models::AppInstallation
            )
        end

        # Get an app installation on the organization by its unique ID. Any
        # organization member can read installations.
        #
        # @param [String] installation_id Installation unique ID.
        #
        # @return [AppInstallation]
        def get_installation(
            installation_id:
        )
            if installation_id.nil? || installation_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "installationId"')
            end

            api_path = '/organization/installations/{installationId}'
                .gsub('{installationId}', installation_id)

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
                response_type: Models::AppInstallation
            )
        end

        # Update an app installation on the organization. Only organization members
        # with the owner role can update installations. The installation&#039;s granted
        # scopes are refreshed to the scopes the app currently requests; previously
        # issued installation access tokens are revoked.
        #
        # @param [String] installation_id Installation unique ID.
        # @param [String] authorization_details Authorization details granted to the installation as a JSON array of objects, each with a `type` and app-defined fields. Omit to keep the current value.
        #
        # @return [AppInstallation]
        def update_installation(
            installation_id:,
            authorization_details: nil
        )
            if installation_id.nil? || installation_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "installationId"')
            end

            api_path = '/organization/installations/{installationId}'
                .gsub('{installationId}', installation_id)

            api_params = {
                authorizationDetails: authorization_details,
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
                response_type: Models::AppInstallation
            )
        end

        # Uninstall an app from the organization by its installation ID. Only
        # organization members with the owner role can remove installations.
        # Previously issued installation access tokens are revoked.
        #
        # @param [String] installation_id Installation unique ID.
        #
        # @return []
        def delete_installation(
            installation_id:
        )
            if installation_id.nil? || installation_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "installationId"')
            end

            api_path = '/organization/installations/{installationId}'
                .gsub('{installationId}', installation_id)

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

        # Get a list of all memberships from the current organization.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, teamId, invited, joined, confirm, roles
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [MembershipList]
        def list_memberships(
            queries: nil,
            search: nil,
            total: nil
        )
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
        # to join the organization will be sent to the new member&#039;s email address. If
        # member doesn&#039;t exist in the project it will be automatically created.
        #
        # @param [Array] roles Array of strings. Use this param to set the user roles in the organization. A role can be any string. Learn more about [roles and permissions](https://appwrite.io/docs/permissions). Maximum of 100 roles are allowed, each 81 characters long.
        # @param [String] email Email of the new organization member.
        # @param [String] user_id ID of the user to be added to the organization.
        # @param [String] phone Phone number. Format this number with a leading &#039;+&#039; and a country code, e.g., +16175551212.
        # @param [String] url URL to redirect the user back to your app from the invitation email. This parameter is not required when an API key is supplied.
        # @param [String] name Name of the new organization member. Max length: 128 chars.
        #
        # @return [Membership]
        def create_membership(
            roles:,
            email: nil,
            user_id: nil,
            phone: nil,
            url: nil,
            name: nil
        )
            if roles.nil?
                raise Appwrite::Exception.new('Missing required parameter: "roles"')
            end

            api_path = '/organization/memberships'

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
        def get_membership(
            membership_id:
        )
            if membership_id.nil? || membership_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
            end

            api_path = '/organization/memberships/{membershipId}'
                .gsub('{membershipId}', membership_id)

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
                response_type: Models::Membership
            )
        end

        # Modify the roles of a member in the current organization.
        #
        # @param [String] membership_id Membership ID.
        # @param [Array] roles An array of strings. Use this param to set the user&#039;s roles in the organization. A role can be any string. Learn more about [roles and permissions](https://appwrite.io/docs/permissions). Maximum of 100 roles are allowed, each 81 characters long.
        #
        # @return [Membership]
        def update_membership(
            membership_id:,
            roles:
        )
            if membership_id.nil? || membership_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
            end

            if roles.nil?
                raise Appwrite::Exception.new('Missing required parameter: "roles"')
            end

            api_path = '/organization/memberships/{membershipId}'
                .gsub('{membershipId}', membership_id)

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
        def delete_membership(
            membership_id:
        )
            if membership_id.nil? || membership_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
            end

            api_path = '/organization/memberships/{membershipId}'
                .gsub('{membershipId}', membership_id)

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

        # Get a list of all projects. You can use the query params to filter your
        # results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, teamId, labels, search, accessedAt
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [ProjectList]
        def list_projects(
            queries: nil,
            search: nil,
            total: nil
        )
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
        # @param [String] project_id Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, and hyphen. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] name Project name. Max length: 128 chars.
        # @param [Region] region Project Region.
        #
        # @return [Project]
        def create_project(
            project_id:,
            name:,
            region: nil
        )
            if project_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "projectId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_path = '/organization/projects'

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
        def get_project(
            project_id:
        )
            if project_id.nil? || project_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "projectId"')
            end

            api_path = '/organization/projects/{projectId}'
                .gsub('{projectId}', project_id)

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
                response_type: Models::Project
            )
        end

        # Update a project by its unique ID.
        #
        # @param [String] project_id Project unique ID.
        # @param [String] name Project name. Max length: 128 chars.
        #
        # @return [Project]
        def update_project(
            project_id:,
            name:
        )
            if project_id.nil? || project_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "projectId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_path = '/organization/projects/{projectId}'
                .gsub('{projectId}', project_id)

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
        def delete_project(
            project_id:
        )
            if project_id.nil? || project_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "projectId"')
            end

            api_path = '/organization/projects/{projectId}'
                .gsub('{projectId}', project_id)

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

        # Get a list of all API keys of a project in your organization.
        #
        # @param [String] project_id Project unique ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: expire, accessedAt, name, scopes
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [KeyList]
        def list_project_keys(
            project_id:,
            queries: nil,
            total: nil
        )
            if project_id.nil? || project_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "projectId"')
            end

            api_path = '/organization/projects/{projectId}/keys'
                .gsub('{projectId}', project_id)

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

        # Create a new ephemeral API key for a project in your organization. It&#039;s
        # recommended to have multiple API keys with strict scopes for separate
        # functions within your project.
        #
        # You can also create a standard API key if you need a longer-lived key
        # instead.
        #
        # @param [String] project_id Project unique ID.
        # @param [Array] scopes Key scopes list. Maximum of 200 scopes are allowed.
        # @param [Integer] duration Time in seconds before ephemeral key expires. Maximum duration is 3600 seconds.
        #
        # @return [EphemeralKey]
        def create_ephemeral_project_key(
            project_id:,
            scopes:,
            duration:
        )
            if project_id.nil? || project_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "projectId"')
            end

            if scopes.nil?
                raise Appwrite::Exception.new('Missing required parameter: "scopes"')
            end

            if duration.nil?
                raise Appwrite::Exception.new('Missing required parameter: "duration"')
            end

            api_path = '/organization/projects/{projectId}/keys/ephemeral'
                .gsub('{projectId}', project_id)

            api_params = {
                scopes: scopes,
                duration: duration,
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
                response_type: Models::EphemeralKey
            )
        end

        # Get a project key by its unique ID.
        #
        # @param [String] project_id Project unique ID.
        # @param [String] key_id Key ID.
        #
        # @return [Key]
        def get_project_key(
            project_id:,
            key_id:
        )
            if project_id.nil? || project_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "projectId"')
            end

            if key_id.nil? || key_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "keyId"')
            end

            api_path = '/organization/projects/{projectId}/keys/{keyId}'
                .gsub('{projectId}', project_id)
                .gsub('{keyId}', key_id)

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
                response_type: Models::Key
            )
        end

        # Update a project key by its unique ID. Use this endpoint to update the
        # name, scopes, or expiration time of an API key.
        #
        # @param [String] project_id Project unique ID.
        # @param [String] key_id Key ID.
        # @param [String] name Key name. Max length: 128 chars.
        # @param [Array] scopes Key scopes list. Maximum of 200 scopes are allowed.
        # @param [String] expire Expiration time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. Use null for unlimited expiration.
        # @param [String] description Optional description for the key.
        #
        # @return [Key]
        def update_project_key(
            project_id:,
            key_id:,
            name:,
            scopes:,
            expire: nil,
            description: nil
        )
            if project_id.nil? || project_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "projectId"')
            end

            if key_id.nil? || key_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "keyId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if scopes.nil?
                raise Appwrite::Exception.new('Missing required parameter: "scopes"')
            end

            api_path = '/organization/projects/{projectId}/keys/{keyId}'
                .gsub('{projectId}', project_id)
                .gsub('{keyId}', key_id)

            api_params = {
                name: name,
                scopes: scopes,
                expire: expire,
                description: description,
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

        # Delete a project key by its unique ID. Once deleted, the key can no longer
        # be used to authenticate API calls.
        #
        # @param [String] project_id Project unique ID.
        # @param [String] key_id Key ID.
        #
        # @return []
        def delete_project_key(
            project_id:,
            key_id:
        )
            if project_id.nil? || project_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "projectId"')
            end

            if key_id.nil? || key_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "keyId"')
            end

            api_path = '/organization/projects/{projectId}/keys/{keyId}'
                .gsub('{projectId}', project_id)
                .gsub('{keyId}', key_id)

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
