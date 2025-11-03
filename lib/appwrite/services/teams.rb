#frozen_string_literal: true

module Appwrite
    class Teams < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all the teams in which the current user is a member. You can
        # use the parameters to filter your results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, total, billingPlan
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [TeamList]
        def list(queries: nil, search: nil, total: nil)
            api_path = '/teams'

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
                response_type: Models::TeamList
            )
        end

        # Create a new team. The user who creates the team will automatically be
        # assigned as the owner of the team. Only the users with the owner role can
        # invite new members, add new owners and delete or update the team.
        #
        # @param [String] team_id Team ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Team name. Max length: 128 chars.
        # @param [Array] roles Array of strings. Use this param to set the roles in the team for the user who created it. The default role is **owner**. A role can be any string. Learn more about [roles and permissions](https://appwrite.io/docs/permissions). Maximum of 100 roles are allowed, each 32 characters long.
        #
        # @return [Team]
        def create(team_id:, name:, roles: nil)
            api_path = '/teams'

            if team_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                teamId: team_id,
                name: name,
                roles: roles,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Team
            )
        end

        # Get a team by its ID. All team members have read access for this resource.
        #
        # @param [String] team_id Team ID.
        #
        # @return [Team]
        def get(team_id:)
            api_path = '/teams/{teamId}'
                .gsub('{teamId}', team_id)

            if team_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "teamId"')
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
                response_type: Models::Team
            )
        end

        # Update the team's name by its unique ID.
        #
        # @param [String] team_id Team ID.
        # @param [String] name New team name. Max length: 128 chars.
        #
        # @return [Team]
        def update_name(team_id:, name:)
            api_path = '/teams/{teamId}'
                .gsub('{teamId}', team_id)

            if team_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "teamId"')
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
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
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
            api_path = '/teams/{teamId}'
                .gsub('{teamId}', team_id)

            if team_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "teamId"')
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

        # Use this endpoint to list a team's members using the team's ID. All team
        # members have read access to this endpoint. Hide sensitive attributes from
        # the response by toggling membership privacy in the Console.
        #
        # @param [String] team_id Team ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, teamId, invited, joined, confirm, roles
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [MembershipList]
        def list_memberships(team_id:, queries: nil, search: nil, total: nil)
            api_path = '/teams/{teamId}/memberships'
                .gsub('{teamId}', team_id)

            if team_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

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
                response_type: Models::MembershipList
            )
        end

        # Invite a new member to join your team. Provide an ID for existing users, or
        # invite unregistered users using an email or phone number. If initiated from
        # a Client SDK, Appwrite will send an email or sms with a link to join the
        # team to the invited user, and an account will be created for them if one
        # doesn't exist. If initiated from a Server SDK, the new member will be added
        # automatically to the team.
        # 
        # You only need to provide one of a user ID, email, or phone number. Appwrite
        # will prioritize accepting the user ID > email > phone number if you provide
        # more than one of these parameters.
        # 
        # Use the `url` parameter to redirect the user from the invitation email to
        # your app. After the user is redirected, use the [Update Team Membership
        # Status](https://appwrite.io/docs/references/cloud/client-web/teams#updateMembershipStatus)
        # endpoint to allow the user to accept the invitation to the team. 
        # 
        # Please note that to avoid a [Redirect
        # Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
        # Appwrite will accept the only redirect URLs under the domains you have
        # added as a platform on the Appwrite Console.
        # 
        #
        # @param [String] team_id Team ID.
        # @param [Array] roles Array of strings. Use this param to set the user roles in the team. A role can be any string. Learn more about [roles and permissions](https://appwrite.io/docs/permissions). Maximum of 100 roles are allowed, each 32 characters long.
        # @param [String] email Email of the new team member.
        # @param [String] user_id ID of the user to be added to a team.
        # @param [String] phone Phone number. Format this number with a leading '+' and a country code, e.g., +16175551212.
        # @param [String] url URL to redirect the user back to your app from the invitation email. This parameter is not required when an API key is supplied. Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.
        # @param [String] name Name of the new team member. Max length: 128 chars.
        #
        # @return [Membership]
        def create_membership(team_id:, roles:, email: nil, user_id: nil, phone: nil, url: nil, name: nil)
            api_path = '/teams/{teamId}/memberships'
                .gsub('{teamId}', team_id)

            if team_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

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
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Membership
            )
        end

        # Get a team member by the membership unique id. All team members have read
        # access for this resource. Hide sensitive attributes from the response by
        # toggling membership privacy in the Console.
        #
        # @param [String] team_id Team ID.
        # @param [String] membership_id Membership ID.
        #
        # @return [Membership]
        def get_membership(team_id:, membership_id:)
            api_path = '/teams/{teamId}/memberships/{membershipId}'
                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

            if team_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if membership_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
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
                response_type: Models::Membership
            )
        end

        # Modify the roles of a team member. Only team members with the owner role
        # have access to this endpoint. Learn more about [roles and
        # permissions](https://appwrite.io/docs/permissions).
        # 
        #
        # @param [String] team_id Team ID.
        # @param [String] membership_id Membership ID.
        # @param [Array] roles An array of strings. Use this param to set the user's roles in the team. A role can be any string. Learn more about [roles and permissions](https://appwrite.io/docs/permissions). Maximum of 100 roles are allowed, each 32 characters long.
        #
        # @return [Membership]
        def update_membership(team_id:, membership_id:, roles:)
            api_path = '/teams/{teamId}/memberships/{membershipId}'
                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

            if team_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

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
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
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
            api_path = '/teams/{teamId}/memberships/{membershipId}'
                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

            if team_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if membership_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "membershipId"')
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
            api_path = '/teams/{teamId}/memberships/{membershipId}/status'
                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

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

            api_params = {
                userId: user_id,
                secret: secret,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Membership
            )
        end

        # Get the team's shared preferences by its unique ID. If a preference doesn't
        # need to be shared by all team members, prefer storing them in [user
        # preferences](https://appwrite.io/docs/references/cloud/client-web/account#getPrefs).
        #
        # @param [String] team_id Team ID.
        #
        # @return [Preferences]
        def get_prefs(team_id:)
            api_path = '/teams/{teamId}/prefs'
                .gsub('{teamId}', team_id)

            if team_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "teamId"')
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
                response_type: Models::Preferences
            )
        end

        # Update the team's preferences by its unique ID. The object you pass is
        # stored as is and replaces any previous value. The maximum allowed prefs
        # size is 64kB and throws an error if exceeded.
        #
        # @param [String] team_id Team ID.
        # @param [Hash] prefs Prefs key-value JSON object.
        #
        # @return [Preferences]
        def update_prefs(team_id:, prefs:)
            api_path = '/teams/{teamId}/prefs'
                .gsub('{teamId}', team_id)

            if team_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            if prefs.nil?
              raise Appwrite::Exception.new('Missing required parameter: "prefs"')
            end

            api_params = {
                prefs: prefs,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Preferences
            )
        end

    end 
end