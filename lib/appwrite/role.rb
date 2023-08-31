module Appwrite

    # Helper class to generate role strings for `Permission`.
    class Role

        # Grants access to anyone.
        # 
        # This includes authenticated and unauthenticated users.
        #
        # @return [String]
        def self.any
            'any'
        end

        # Grants access to a specific user by user ID.
        # 
        # You can optionally pass verified or unverified for
        # `status` to target specific types of users.
        #
        # @param [String] id
        # @param [String] status
        # 
        # @return [String]
        def self.user(id, status = "")
            if(status.empty?)
                "user:#{id}"
            else
                "user:#{id}/#{status}"
            end
        end
        
        # Grants access to any authenticated or anonymous user.
        # 
        # You can optionally pass verified or unverified for
        # `status` to target specific types of users.
        #
        # @param [String] status
        #
        # @return [String]
        def self.users(status = "")
            if(status.empty?)
                'users'
            else
                "users/#{status}"
            end
        end
        
        # Grants access to any guest user without a session.
        #
        # Authenticated users don't have access to this role.
        #
        # @return [String]
        def self.guests
            'guests'
        end
        
        # Grants access to a team by team ID.
        #
        # You can optionally pass a role for `role` to target
        # team members with the specified role.
        #
        # @param [String] id
        # @param [String] role
        #
        # @return [String]
        def self.team(id, role = "")
            if(role.empty?)
                "team:#{id}"
            else
                "team:#{id}/#{role}"
            end
        end

        # Grants access to a specific member of a team.
        # 
        # When the member is removed from the team, they will
        # no longer have access.
        #
        # @param [String] id
        #
        # @return [String]
        def self.member(id)
            "member:#{id}"
        end

        # Grants access to a user with the specified label.
        #
        # @param [String] name
        #
        # @return [String]
        def self.label(name)
            "label:#{name}"
        end
    end
end