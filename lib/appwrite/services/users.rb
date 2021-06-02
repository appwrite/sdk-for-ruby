module Appwrite
    class Users < Service

        def list(search: nil, limit: nil, offset: nil, order_type: nil)
            path = '/users'

            params = {}

            if !search.nil?
                params[:search] = search
            end

            if !limit.nil?
                params[:limit] = limit
            end

            if !offset.nil?
                params[:offset] = offset
            end

            if !order_type.nil?
                params[:orderType] = order_type
            end

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def create(email:, password:, name: nil)
            if email.nil?
                raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            path = '/users'

            params = {}

            if !email.nil?
                params[:email] = email
            end

            if !password.nil?
                params[:password] = password
            end

            if !name.nil?
                params[:name] = name
            end

            return @client.call('post', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def get(user_id:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            path = '/users/{userId}'
                .gsub('{userId}', user_id)

            params = {}

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def delete(user_id:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            path = '/users/{userId}'
                .gsub('{userId}', user_id)

            params = {}

            return @client.call('delete', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def get_logs(user_id:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            path = '/users/{userId}/logs'
                .gsub('{userId}', user_id)

            params = {}

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def get_prefs(user_id:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            path = '/users/{userId}/prefs'
                .gsub('{userId}', user_id)

            params = {}

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def update_prefs(user_id:, prefs:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if prefs.nil?
                raise Appwrite::Exception.new('Missing required parameter: "prefs"')
            end

            path = '/users/{userId}/prefs'
                .gsub('{userId}', user_id)

            params = {}

            if !prefs.nil?
                params[:prefs] = prefs
            end

            return @client.call('patch', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def get_sessions(user_id:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            path = '/users/{userId}/sessions'
                .gsub('{userId}', user_id)

            params = {}

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def delete_sessions(user_id:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            path = '/users/{userId}/sessions'
                .gsub('{userId}', user_id)

            params = {}

            return @client.call('delete', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def delete_session(user_id:, session_id:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if session_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "sessionId"')
            end

            path = '/users/{userId}/sessions/{sessionId}'
                .gsub('{userId}', user_id)
                .gsub('{sessionId}', session_id)

            params = {}

            return @client.call('delete', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def update_status(user_id:, status:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if status.nil?
                raise Appwrite::Exception.new('Missing required parameter: "status"')
            end

            path = '/users/{userId}/status'
                .gsub('{userId}', user_id)

            params = {}

            if !status.nil?
                params[:status] = status
            end

            return @client.call('patch', path, {
                'content-type' => 'application/json',
            }, params);
        end


        protected

        private
    end 
end