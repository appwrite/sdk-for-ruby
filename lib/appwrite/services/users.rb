#frozen_string_literal: true

module Appwrite
    class Users < Service

        # Get a list of all the project's users. You can use the query params to
        # filter your results.
        #
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Maximum number of users to return in response. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this param to manage pagination. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor ID of the user used as the starting point for the query, excluding the user itself. Should be used for efficient pagination when working with large sets of data. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor_direction Direction of the cursor.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [UserList]
        def list(search: nil, limit: nil, offset: nil, cursor: nil, cursor_direction: nil, order_type: nil)
            path = '/users'

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
                response_type: Models::UserList
            )
        end

        # Create a new user.
        #
        # @param [string] user_id User ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [string] email User email.
        # @param [string] password User password. Must be at least 8 chars.
        # @param [string] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create(user_id:, email:, password:, name: nil)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email.nil?
                raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            path = '/users'

            params = {
                userId: user_id,
                email: email,
                password: password,
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
                response_type: Models::User
            )
        end

        # Get a user by its unique ID.
        #
        # @param [string] user_id User ID.
        #
        # @return [User]
        def get(user_id:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            path = '/users/{userId}'
                .gsub('{userId}', user_id)

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
                response_type: Models::User
            )
        end

        # Delete a user by its unique ID.
        #
        # @param [string] user_id User ID.
        #
        # @return []
        def delete(user_id:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            path = '/users/{userId}'
                .gsub('{userId}', user_id)

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

        # Update the user email by its unique ID.
        #
        # @param [string] user_id User ID.
        # @param [string] email User email.
        #
        # @return [User]
        def update_email(user_id:, email:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email.nil?
                raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            path = '/users/{userId}/email'
                .gsub('{userId}', user_id)

            params = {
                email: email,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::User
            )
        end

        # Get the user activity logs list by its unique ID.
        #
        # @param [string] user_id User ID.
        # @param [number] limit Maximum number of logs to return in response. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this value to manage pagination. [learn more about pagination](https://appwrite.io/docs/pagination)
        #
        # @return [LogList]
        def get_logs(user_id:, limit: nil, offset: nil)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            path = '/users/{userId}/logs'
                .gsub('{userId}', user_id)

            params = {
                limit: limit,
                offset: offset,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::LogList
            )
        end

        # Update the user name by its unique ID.
        #
        # @param [string] user_id User ID.
        # @param [string] name User name. Max length: 128 chars.
        #
        # @return [User]
        def update_name(user_id:, name:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            path = '/users/{userId}/name'
                .gsub('{userId}', user_id)

            params = {
                name: name,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::User
            )
        end

        # Update the user password by its unique ID.
        #
        # @param [string] user_id User ID.
        # @param [string] password New user password. Must be at least 8 chars.
        #
        # @return [User]
        def update_password(user_id:, password:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            path = '/users/{userId}/password'
                .gsub('{userId}', user_id)

            params = {
                password: password,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::User
            )
        end

        # Get the user preferences by its unique ID.
        #
        # @param [string] user_id User ID.
        #
        # @return [Preferences]
        def get_prefs(user_id:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            path = '/users/{userId}/prefs'
                .gsub('{userId}', user_id)

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
                response_type: Models::Preferences
            )
        end

        # Update the user preferences by its unique ID. The object you pass is stored
        # as is, and replaces any previous value. The maximum allowed prefs size is
        # 64kB and throws error if exceeded.
        #
        # @param [string] user_id User ID.
        # @param [object] prefs Prefs key-value JSON object.
        #
        # @return [Preferences]
        def update_prefs(user_id:, prefs:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if prefs.nil?
                raise Appwrite::Exception.new('Missing required parameter: "prefs"')
            end

            path = '/users/{userId}/prefs'
                .gsub('{userId}', user_id)

            params = {
                prefs: prefs,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Preferences
            )
        end

        # Get the user sessions list by its unique ID.
        #
        # @param [string] user_id User ID.
        #
        # @return [SessionList]
        def get_sessions(user_id:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            path = '/users/{userId}/sessions'
                .gsub('{userId}', user_id)

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
                response_type: Models::SessionList
            )
        end

        # Delete all user's sessions by using the user's unique ID.
        #
        # @param [string] user_id User ID.
        #
        # @return []
        def delete_sessions(user_id:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            path = '/users/{userId}/sessions'
                .gsub('{userId}', user_id)

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

        # Delete a user sessions by its unique ID.
        #
        # @param [string] user_id User ID.
        # @param [string] session_id Session ID.
        #
        # @return []
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

        # Update the user status by its unique ID.
        #
        # @param [string] user_id User ID.
        # @param [boolean] status User Status. To activate the user pass `true` and to block the user pass `false`.
        #
        # @return [User]
        def update_status(user_id:, status:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if status.nil?
                raise Appwrite::Exception.new('Missing required parameter: "status"')
            end

            path = '/users/{userId}/status'
                .gsub('{userId}', user_id)

            params = {
                status: status,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::User
            )
        end

        # Update the user email verification status by its unique ID.
        #
        # @param [string] user_id User ID.
        # @param [boolean] email_verification User email verification status.
        #
        # @return [User]
        def update_verification(user_id:, email_verification:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email_verification.nil?
                raise Appwrite::Exception.new('Missing required parameter: "emailVerification"')
            end

            path = '/users/{userId}/verification'
                .gsub('{userId}', user_id)

            params = {
                emailVerification: email_verification,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::User
            )
        end

    end 
end