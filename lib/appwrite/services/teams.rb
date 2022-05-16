#frozen_string_literal: true

module Appwrite
    class Teams < Service

        # Get a list of all the teams in which the current user is a member. You can
        # use the parameters to filter your results.
        # 
        # In admin mode, this endpoint returns a list of all the teams in the current
        # project. [Learn more about different API modes](/docs/admin).
        #
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Maximum number of teams to return in response. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this param to manage pagination. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor ID of the team used as the starting point for the query, excluding the team itself. Should be used for efficient pagination when working with large sets of data. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor_direction Direction of the cursor.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [TeamList]
        def list(search: nil, limit: nil, offset: nil, cursor: nil, cursor_direction: nil, order_type: nil)
            path = '/teams'

            params = {
                search: search,
                limit: limit,
                offset: offset,
                cursor: cursor,
                cursorDirection: cursor_direction,
                orderType: order_type,
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
        # @param [string] team_id Team ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [string] name Team name. Max length: 128 chars.
        # @param [array] roles Array of strings. Use this param to set the roles in the team for the user who created it. The default role is **owner**. A role can be any string. Learn more about [roles and permissions](/docs/permissions). Maximum of 100 roles are allowed, each 32 characters long.
        #
        # @return [Team]
        def create(team_id:, name:, roles: nil)
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            path = '/teams'

            params = {
                teamId: team_id,
                name: name,
                roles: roles,
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] team_id Team ID.
        #
        # @return [Team]
        def get(team_id:)
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            path = '/teams/{teamId}'
                .gsub('{teamId}', team_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] team_id Team ID.
        # @param [string] name New team name. Max length: 128 chars.
        #
        # @return [Team]
        def update(team_id:, name:)
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            path = '/teams/{teamId}'
                .gsub('{teamId}', team_id)

            params = {
                name: name,
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] team_id Team ID.
        #
        # @return []
        def delete(team_id:)
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            path = '/teams/{teamId}'
                .gsub('{teamId}', team_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] team_id Team ID.
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Maximum number of memberships to return in response. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this value to manage pagination. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor ID of the membership used as the starting point for the query, excluding the membership itself. Should be used for efficient pagination when working with large sets of data. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor_direction Direction of the cursor.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [MembershipList]
        def get_memberships(team_id:, search: nil, limit: nil, offset: nil, cursor: nil, cursor_direction: nil, order_type: nil)
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            path = '/teams/{teamId}/memberships'
                .gsub('{teamId}', team_id)

            params = {
                search: search,
                limit: limit,
                offset: offset,
                cursor: cursor,
                cursorDirection: cursor_direction,
                orderType: order_type,
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] team_id Team ID.
        # @param [string] email Email of the new team member.
        # @param [array] roles Array of strings. Use this param to set the user roles in the team. A role can be any string. Learn more about [roles and permissions](/docs/permissions). Maximum of 100 roles are allowed, each 32 characters long.
        # @param [string] url URL to redirect the user back to your app from the invitation email.  Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.
        # @param [string] name Name of the new team member. Max length: 128 chars.
        #
        # @return [Membership]
        def create_membership(team_id:, email:, roles:, url:, name: nil)
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

            path = '/teams/{teamId}/memberships'
                .gsub('{teamId}', team_id)

            params = {
                email: email,
                roles: roles,
                url: url,
                name: name,
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] team_id Team ID.
        # @param [string] membership_id Membership ID.
        #
        # @return [MembershipList]
        def get_membership(team_id:, membership_id:)
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if membership_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
            end

            path = '/teams/{teamId}/memberships/{membershipId}'
                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] team_id Team ID.
        # @param [string] membership_id Membership ID.
        # @param [array] roles An array of strings. Use this param to set the user&#039;s roles in the team. A role can be any string. Learn more about [roles and permissions](https://appwrite.io/docs/permissions). Maximum of 100 roles are allowed, each 32 characters long.
        #
        # @return [Membership]
        def update_membership_roles(team_id:, membership_id:, roles:)
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if membership_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
            end

            if roles.nil?
                raise Appwrite::Exception.new('Missing required parameter: "roles"')
            end

            path = '/teams/{teamId}/memberships/{membershipId}'
                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

            params = {
                roles: roles,
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] team_id Team ID.
        # @param [string] membership_id Membership ID.
        #
        # @return []
        def delete_membership(team_id:, membership_id:)
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if membership_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
            end

            path = '/teams/{teamId}/memberships/{membershipId}'
                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

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
        # @param [string] team_id Team ID.
        # @param [string] membership_id Membership ID.
        # @param [string] user_id User ID.
        # @param [string] secret Secret key.
        #
        # @return [Membership]
        def update_membership_status(team_id:, membership_id:, user_id:, secret:)
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

            path = '/teams/{teamId}/memberships/{membershipId}/status'
                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

            params = {
                userId: user_id,
                secret: secret,
            }

            headers = {
                "content-type": 'application/json',
            }

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