module Appwrite
    class Role
        def self.any
            'any'
        end

        def self.user(id)
            "user:#{id}"
        end
        
        def self.users
            'users'
        end
        
        def self.guests
            'guests'
        end
        
        def self.team(id, role = "")
            if(role.empty?)
                "team:#{id}"
            else
                "team:#{id}/#{role}"
            end
        end
        
        def self.status(status)
            "status:#{status}"
        end
    end
end