module Appwrite
    class Account < Service

        def get()
            path = '/account'

            params = {
            }

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def delete()
            path = '/account'

            params = {
            }

            return @client.call('delete', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def update_email(email:, password:)
            path = '/account/email'

            params = {
                'email': email, 
                'password': password
            }

            return @client.call('patch', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def get_logs()
            path = '/account/logs'

            params = {
            }

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def update_name(name:)
            path = '/account/name'

            params = {
                'name': name
            }

            return @client.call('patch', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def update_password(password:, old_password: '')
            path = '/account/password'

            params = {
                'password': password, 
                'oldPassword': old_password
            }

            return @client.call('patch', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def get_prefs()
            path = '/account/prefs'

            params = {
            }

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def update_prefs(prefs:)
            path = '/account/prefs'

            params = {
                'prefs': prefs
            }

            return @client.call('patch', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def create_recovery(email:, url:)
            path = '/account/recovery'

            params = {
                'email': email, 
                'url': url
            }

            return @client.call('post', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def update_recovery(user_id:, secret:, password:, password_again:)
            path = '/account/recovery'

            params = {
                'userId': user_id, 
                'secret': secret, 
                'password': password, 
                'passwordAgain': password_again
            }

            return @client.call('put', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def get_sessions()
            path = '/account/sessions'

            params = {
            }

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def delete_sessions()
            path = '/account/sessions'

            params = {
            }

            return @client.call('delete', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def delete_session(session_id:)
            path = '/account/sessions/{sessionId}'
                .gsub('{sessionId}', session_id)

            params = {
            }

            return @client.call('delete', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def create_verification(url:)
            path = '/account/verification'

            params = {
                'url': url
            }

            return @client.call('post', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def update_verification(user_id:, secret:)
            path = '/account/verification'

            params = {
                'userId': user_id, 
                'secret': secret
            }

            return @client.call('put', path, {
                'content-type' => 'application/json',
            }, params);
        end


        protected

        private
    end 
end