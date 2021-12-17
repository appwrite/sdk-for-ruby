#frozen_string_literal: true

module Appwrite
    class Teams < Service

        include Models
        # Get a list of all the current user teams. You can use the query params to
        # filter your results. On admin mode, this endpoint will return a list of all
        # of the project's teams. [Learn more about different API
        # modes](/docs/admin).
        #
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Results limit value. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Results offset. The default value is 0. Use this param to manage pagination.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [TeamList]
        def list(search: nil, limit: nil, offset: nil, order_type: nil)
            path = '/teams'

            params = {
                search: search,
                limit: limit,
                offset: offset,
                orderType: order_type,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                params: params,
                headers: headers,
                response_type: TeamList
            )
        end

        # Create a new team. The user who creates the team will automatically be
        # assigned as the owner of the team. The team owner can invite new members,
        # who will be able add new owners and update or delete the team from your
        # project.
        #
        # @param [string] name Team name. Max length: 128 chars.
        # @param [array] roles Array of strings. Use this param to set the roles in the team for the user who created it. The default role is **owner**. A role can be any string. Learn more about [roles and permissions](/docs/permissions). Max length for each role is 32 chars.
        #
        # @return [Team]
        def create(name:, roles: nil)
            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            path = '/teams'

            params = {
                name: name,
                roles: roles,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                params: params,
                headers: headers,
                response_type: Team
            )
        end

        # Get a team by its unique ID. All team members have read access for this
        # resource.
        #
        # @param [string] team_id Team unique ID.
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
                params: params,
                headers: headers,
                response_type: Team
            )
        end

        # Update a team by its unique ID. Only team owners have write access for this
        # resource.
        #
        # @param [string] team_id Team unique ID.
        # @param [string] name Team name. Max length: 128 chars.
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
                params: params,
                headers: headers,
                response_type: Team
            )
        end

        # Delete a team by its unique ID. Only team owners have write access for this
        # resource.
        #
        # @param [string] team_id Team unique ID.
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
                params: params,
                headers: headers,
            )
        end

        # Get a team members by the team unique ID. All team members have read access
        # for this list of resources.
        #
        # @param [string] team_id Team unique ID.
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Results limit value. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Results offset. The default value is 0. Use this param to manage pagination.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [MembershipList]
        def get_memberships(team_id:, search: nil, limit: nil, offset: nil, order_type: nil)
            if team_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            path = '/teams/{teamId}/memberships'
                .gsub('{teamId}', team_id)

            params = {
                search: search,
                limit: limit,
                offset: offset,
                orderType: order_type,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                params: params,
                headers: headers,
                response_type: MembershipList
            )
        end

        # Use this endpoint to invite a new member to join your team. If initiated
        # from Client SDK, an email with a link to join the team will be sent to the
        # new member's email address if the member doesn't exist in the project it
        # will be created automatically. If initiated from server side SDKs, new
        # member will automatically be added to the team.
        # 
        # Use the 'URL' parameter to redirect the user from the invitation email back
        # to your app. When the user is redirected, use the [Update Team Membership
        # Status](/docs/client/teams#teamsUpdateMembershipStatus) endpoint to allow
        # the user to accept the invitation to the team.  While calling from side
        # SDKs the redirect url can be empty string.
        # 
        # Please note that in order to avoid a [Redirect
        # Attacks](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
        # the only valid redirect URL's are the once from domains you have set when
        # added your platforms in the console interface.
        #
        # @param [string] team_id Team unique ID.
        # @param [string] email New team member email.
        # @param [array] roles Array of strings. Use this param to set the user roles in the team. A role can be any string. Learn more about [roles and permissions](/docs/permissions). Max length for each role is 32 chars.
        # @param [string] url URL to redirect the user back to your app from the invitation email.  Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.
        # @param [string] name New team member name. Max length: 128 chars.
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
                params: params,
                headers: headers,
                response_type: Membership
            )
        end

        # 
        #
        # @param [string] team_id Team unique ID.
        # @param [string] membership_id Membership ID.
        # @param [array] roles Array of strings. Use this param to set the user roles in the team. A role can be any string. Learn more about [roles and permissions](/docs/permissions). Max length for each role is 32 chars.
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
                params: params,
                headers: headers,
                response_type: Membership
            )
        end

        # This endpoint allows a user to leave a team or for a team owner to delete
        # the membership of any other team member. You can also use this endpoint to
        # delete a user membership even if it is not accepted.
        #
        # @param [string] team_id Team unique ID.
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
                params: params,
                headers: headers,
            )
        end

        # Use this endpoint to allow a user to accept an invitation to join a team
        # after being redirected back to your app from the invitation email recieved
        # by the user.
        #
        # @param [string] team_id Team unique ID.
        # @param [string] membership_id Membership ID.
        # @param [string] user_id User unique ID.
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
                params: params,
                headers: headers,
                response_type: Membership
            )
        end

    end 
end