#frozen_string_literal: true

module Appwrite
    class Teams < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all the teams in which the current user is a member. You can
        # use the parameters to filter your results.
        # 
        # In admin mode, this endpoint returns a list of all the teams in the current
        # project. [Learn more about different API modes](/docs/admin).
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, total
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [TeamList]
        def list(queries: nil, search: nil)

            path = '/teams'

            params = {
                queries: queries,
                search: search,
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::TeamList
            )
        end

        
        # Create a new team. The user who creates the team will automatically be
        # assigned as the owner of the team. Only the users with the owner role can
        # invite new members, add new owners and delete or update the team.
        #
        # @param [String] team_id Team ID. Choose your own unique ID or pass the string "unique()" to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Team name. Max length: 128 chars.
        # @param [Array] roles Array of strings. Use this param to set the roles in the team for the user who created it. The default role is **owner**. A role can be any string. Learn more about [roles and permissions](/docs/permissions). Maximum of 100 roles are allowed, each 32 characters long.
        #
        # @return [Team]
        def create(team_id:, name:, roles: nil)

            path = '/teams'

            params = {
                teamId: team_id,
                name: name,
                roles: roles,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end


            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Team
            )
        end

        
        # Get a team by its ID. All team members have read access for this resource.
        #
        # @param [String] team_id Team ID.
        #
        # @return [Team]
        def get(team_id:)

            path = '/teams/{teamId}'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

                .gsub('{teamId}', team_id)

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Team
            )
        end

        
        # Update a team using its ID. Only members with the owner role can update the
        # team.
        #
        # @param [String] team_id Team ID.
        # @param [String] name New team name. Max length: 128 chars.
        #
        # @return [Team]
        def update(team_id:, name:)

            path = '/teams/{teamId}'

            params = {
                name: name,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

                .gsub('{teamId}', team_id)

            @client.call(
                method: 'PUT',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Team
            )
        end

        
        # Delete a team using its ID. Only team members with the owner role can
        # delete the team.
        #
        # @param [String] team_id Team ID.
        #
        # @return []
        def delete(team_id:)

            path = '/teams/{teamId}'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

                .gsub('{teamId}', team_id)

            @client.call(
                method: 'DELETE',
                path: path,
                headers: headers,
                params: params,
            )
        end

        
        # Use this endpoint to list a team's members using the team's ID. All team
        # members have read access to this endpoint.
        #
        # @param [String] team_id Team ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, teamId, invited, joined, confirm
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [MembershipList]
        def get_memberships(team_id:, queries: nil, search: nil)

            path = '/teams/{teamId}/memberships'

            params = {
                queries: queries,
                search: search,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

                .gsub('{teamId}', team_id)

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::MembershipList
            )
        end

        
        # Invite a new member to join your team. If initiated from the client SDK, an
        # email with a link to join the team will be sent to the member's email
        # address and an account will be created for them should they not be signed
        # up already. If initiated from server-side SDKs, the new member will
        # automatically be added to the team.
        # 
        # Use the 'url' parameter to redirect the user from the invitation email back
        # to your app. When the user is redirected, use the [Update Team Membership
        # Status](/docs/client/teams#teamsUpdateMembershipStatus) endpoint to allow
        # the user to accept the invitation to the team. 
        # 
        # Please note that to avoid a [Redirect
        # Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
        # the only valid redirect URL's are the once from domains you have set when
        # adding your platforms in the console interface.
        #
        # @param [String] team_id Team ID.
        # @param [String] email Email of the new team member.
        # @param [Array] roles Array of strings. Use this param to set the user roles in the team. A role can be any string. Learn more about [roles and permissions](/docs/permissions). Maximum of 100 roles are allowed, each 32 characters long.
        # @param [String] url URL to redirect the user back to your app from the invitation email.  Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.
        # @param [String] name Name of the new team member. Max length: 128 chars.
        #
        # @return [Membership]
        def create_membership(team_id:, email:, roles:, url:, name: nil)

            path = '/teams/{teamId}/memberships'

            params = {
                email: email,
                roles: roles,
                url: url,
                name: name,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if email.nil?
                raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if roles.nil?
                raise Appwrite::Exception.new('Missing required parameter: "roles"')
            end

            if url.nil?
                raise Appwrite::Exception.new('Missing required parameter: "url"')
            end

                .gsub('{teamId}', team_id)

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Membership
            )
        end

        
        # Get a team member by the membership unique id. All team members have read
        # access for this resource.
        #
        # @param [String] team_id Team ID.
        # @param [String] membership_id Membership ID.
        #
        # @return [MembershipList]
        def get_membership(team_id:, membership_id:)

            path = '/teams/{teamId}/memberships/{membershipId}'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if membership_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
            end

                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::MembershipList
            )
        end

        
        # Modify the roles of a team member. Only team members with the owner role
        # have access to this endpoint. Learn more about [roles and
        # permissions](/docs/permissions).
        #
        # @param [String] team_id Team ID.
        # @param [String] membership_id Membership ID.
        # @param [Array] roles An array of strings. Use this param to set the user's roles in the team. A role can be any string. Learn more about [roles and permissions](https://appwrite.io/docs/permissions). Maximum of 100 roles are allowed, each 32 characters long.
        #
        # @return [Membership]
        def update_membership_roles(team_id:, membership_id:, roles:)

            path = '/teams/{teamId}/memberships/{membershipId}'

            params = {
                roles: roles,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if membership_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
            end

            if roles.nil?
                raise Appwrite::Exception.new('Missing required parameter: "roles"')
            end

                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Membership
            )
        end

        
        # This endpoint allows a user to leave a team or for a team owner to delete
        # the membership of any other team member. You can also use this endpoint to
        # delete a user membership even if it is not accepted.
        #
        # @param [String] team_id Team ID.
        # @param [String] membership_id Membership ID.
        #
        # @return []
        def delete_membership(team_id:, membership_id:)

            path = '/teams/{teamId}/memberships/{membershipId}'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if membership_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
            end

                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

            @client.call(
                method: 'DELETE',
                path: path,
                headers: headers,
                params: params,
            )
        end

        
        # Use this endpoint to allow a user to accept an invitation to join a team
        # after being redirected back to your app from the invitation email received
        # by the user.
        # 
        # If the request is successful, a session for the user is automatically
        # created.
        # 
        #
        # @param [String] team_id Team ID.
        # @param [String] membership_id Membership ID.
        # @param [String] user_id User ID.
        # @param [String] secret Secret key.
        #
        # @return [Membership]
        def update_membership_status(team_id:, membership_id:, user_id:, secret:)

            path = '/teams/{teamId}/memberships/{membershipId}/status'

            params = {
                userId: user_id,
                secret: secret,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if membership_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
            end

            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if secret.nil?
                raise Appwrite::Exception.new('Missing required parameter: "secret"')
            end

                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Membership
            )
        end

        
    end 
end