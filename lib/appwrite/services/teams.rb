module Appwrite
    class Teams < Service

        def list(search: '', limit: 25, offset: 0, order_type: 'ASC')
            path = '/teams'

            params = {
                'search': search, 
                'limit': limit, 
                'offset': offset, 
                'orderType': order_type
            }

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def create(name:, roles: ["owner"])
            path = '/teams'

            params = {
                'name': name, 
                'roles': roles
            }

            return @client.call('post', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def get(team_id:)
            path = '/teams/{teamId}'
                .gsub('{teamId}', team_id)

            params = {
            }

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def update(team_id:, name:)
            path = '/teams/{teamId}'
                .gsub('{teamId}', team_id)

            params = {
                'name': name
            }

            return @client.call('put', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def delete(team_id:)
            path = '/teams/{teamId}'
                .gsub('{teamId}', team_id)

            params = {
            }

            return @client.call('delete', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def get_memberships(team_id:, search: '', limit: 25, offset: 0, order_type: 'ASC')
            path = '/teams/{teamId}/memberships'
                .gsub('{teamId}', team_id)

            params = {
                'search': search, 
                'limit': limit, 
                'offset': offset, 
                'orderType': order_type
            }

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def create_membership(team_id:, email:, roles:, url:, name: '')
            path = '/teams/{teamId}/memberships'
                .gsub('{teamId}', team_id)

            params = {
                'email': email, 
                'name': name, 
                'roles': roles, 
                'url': url
            }

            return @client.call('post', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def update_membership_roles(team_id:, membership_id:, roles:)
            path = '/teams/{teamId}/memberships/{membershipId}'
                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

            params = {
                'roles': roles
            }

            return @client.call('patch', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def delete_membership(team_id:, membership_id:)
            path = '/teams/{teamId}/memberships/{membershipId}'
                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

            params = {
            }

            return @client.call('delete', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def update_membership_status(team_id:, membership_id:, user_id:, secret:)
            path = '/teams/{teamId}/memberships/{membershipId}/status'
                .gsub('{teamId}', team_id)
                .gsub('{membershipId}', membership_id)

            params = {
                'userId': user_id, 
                'secret': secret
            }

            return @client.call('patch', path, {
                'content-type' => 'application/json',
            }, params);
        end


        protected

        private
    end 
end