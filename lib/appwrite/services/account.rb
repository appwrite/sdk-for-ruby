#frozen_string_literal: true

module Appwrite
    class Account < Service

        # Get currently logged in user data as JSON object.
        #
        #
        # @return [User]
        def get()
            path = '/account'

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

        # Delete a currently logged in user account. Behind the scene, the user
        # record is not deleted but permanently blocked from any access. This is done
        # to avoid deleted accounts being overtaken by new users with the same email
        # address. Any user-related resources like documents or storage files should
        # be deleted separately.
        #
        #
        # @return []
        def delete()
            path = '/account'

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

        # Update currently logged in user account email address. After changing user
        # address, the user confirmation status will get reset. A new confirmation
        # email is not sent automatically however you can use the send confirmation
        # email endpoint again to send the confirmation email. For security measures,
        # user password is required to complete this request.
        # This endpoint can also be used to convert an anonymous account to a normal
        # one, by passing an email address and a new password.
        # 
        #
        # @param [string] email User email.
        # @param [string] password User password. Must be at least 8 chars.
        #
        # @return [User]
        def update_email(email:, password:)
            if email.nil?
                raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            path = '/account/email'

            params = {
                email: email,
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

        # Get currently logged in user list of latest security activity logs. Each
        # log returns user IP address, location and date and time of log.
        #
        # @param [number] limit Maximum number of logs to return in response. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this value to manage pagination. [learn more about pagination](https://appwrite.io/docs/pagination)
        #
        # @return [LogList]
        def get_logs(limit: nil, offset: nil)
            path = '/account/logs'

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

        # Update currently logged in user account name.
        #
        # @param [string] name User name. Max length: 128 chars.
        #
        # @return [User]
        def update_name(name:)
            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            path = '/account/name'

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

        # Update currently logged in user password. For validation, user is required
        # to pass in the new password, and the old password. For users created with
        # OAuth and Team Invites, oldPassword is optional.
        #
        # @param [string] password New user password. Must be at least 8 chars.
        # @param [string] old_password Current user password. Must be at least 8 chars.
        #
        # @return [User]
        def update_password(password:, old_password: nil)
            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            path = '/account/password'

            params = {
                password: password,
                oldPassword: old_password,
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

        # Get currently logged in user preferences as a key-value object.
        #
        #
        # @return [Preferences]
        def get_prefs()
            path = '/account/prefs'

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

        # Update currently logged in user account preferences. The object you pass is
        # stored as is, and replaces any previous value. The maximum allowed prefs
        # size is 64kB and throws error if exceeded.
        #
        # @param [object] prefs Prefs key-value JSON object.
        #
        # @return [User]
        def update_prefs(prefs:)
            if prefs.nil?
                raise Appwrite::Exception.new('Missing required parameter: "prefs"')
            end

            path = '/account/prefs'

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
                response_type: Models::User
            )
        end

        # Sends the user an email with a temporary secret key for password reset.
        # When the user clicks the confirmation link he is redirected back to your
        # app password reset URL with the secret key and email address values
        # attached to the URL query string. Use the query string params to submit a
        # request to the [PUT
        # /account/recovery](/docs/client/account#accountUpdateRecovery) endpoint to
        # complete the process. The verification link sent to the user's email
        # address is valid for 1 hour.
        #
        # @param [string] email User email.
        # @param [string] url URL to redirect the user back to your app from the recovery email. Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.
        #
        # @return [Token]
        def create_recovery(email:, url:)
            if email.nil?
                raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if url.nil?
                raise Appwrite::Exception.new('Missing required parameter: "url"')
            end

            path = '/account/recovery'

            params = {
                email: email,
                url: url,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Token
            )
        end

        # Use this endpoint to complete the user account password reset. Both the
        # **userId** and **secret** arguments will be passed as query parameters to
        # the redirect URL you have provided when sending your request to the [POST
        # /account/recovery](/docs/client/account#accountCreateRecovery) endpoint.
        # 
        # Please note that in order to avoid a [Redirect
        # Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
        # the only valid redirect URLs are the ones from domains you have set when
        # adding your platforms in the console interface.
        #
        # @param [string] user_id User ID.
        # @param [string] secret Valid reset token.
        # @param [string] password New user password. Must be at least 8 chars.
        # @param [string] password_again Repeat new user password. Must be at least 8 chars.
        #
        # @return [Token]
        def update_recovery(user_id:, secret:, password:, password_again:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if secret.nil?
                raise Appwrite::Exception.new('Missing required parameter: "secret"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            if password_again.nil?
                raise Appwrite::Exception.new('Missing required parameter: "passwordAgain"')
            end

            path = '/account/recovery'

            params = {
                userId: user_id,
                secret: secret,
                password: password,
                passwordAgain: password_again,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Token
            )
        end

        # Get currently logged in user list of active sessions across different
        # devices.
        #
        #
        # @return [SessionList]
        def get_sessions()
            path = '/account/sessions'

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

        # Delete all sessions from the user account and remove any sessions cookies
        # from the end client.
        #
        #
        # @return []
        def delete_sessions()
            path = '/account/sessions'

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

        # Use this endpoint to get a logged in user's session using a Session ID.
        # Inputting 'current' will return the current session being used.
        #
        # @param [string] session_id Session ID. Use the string &#039;current&#039; to get the current device session.
        #
        # @return [Session]
        def get_session(session_id:)
            if session_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "sessionId"')
            end

            path = '/account/sessions/{sessionId}'
                .gsub('{sessionId}', session_id)

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
                response_type: Models::Session
            )
        end

        # 
        #
        # @param [string] session_id Session ID. Use the string &#039;current&#039; to update the current device session.
        #
        # @return [Session]
        def update_session(session_id:)
            if session_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "sessionId"')
            end

            path = '/account/sessions/{sessionId}'
                .gsub('{sessionId}', session_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Session
            )
        end

        # Use this endpoint to log out the currently logged in user from all their
        # account sessions across all of their different devices. When using the
        # Session ID argument, only the unique session ID provided is deleted.
        # 
        #
        # @param [string] session_id Session ID. Use the string &#039;current&#039; to delete the current device session.
        #
        # @return []
        def delete_session(session_id:)
            if session_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "sessionId"')
            end

            path = '/account/sessions/{sessionId}'
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

        # Use this endpoint to send a verification message to your user email address
        # to confirm they are the valid owners of that address. Both the **userId**
        # and **secret** arguments will be passed as query parameters to the URL you
        # have provided to be attached to the verification email. The provided URL
        # should redirect the user back to your app and allow you to complete the
        # verification process by verifying both the **userId** and **secret**
        # parameters. Learn more about how to [complete the verification
        # process](/docs/client/account#accountUpdateVerification). The verification
        # link sent to the user's email address is valid for 7 days.
        # 
        # Please note that in order to avoid a [Redirect
        # Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md),
        # the only valid redirect URLs are the ones from domains you have set when
        # adding your platforms in the console interface.
        # 
        #
        # @param [string] url URL to redirect the user back to your app from the verification email. Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.
        #
        # @return [Token]
        def create_verification(url:)
            if url.nil?
                raise Appwrite::Exception.new('Missing required parameter: "url"')
            end

            path = '/account/verification'

            params = {
                url: url,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Token
            )
        end

        # Use this endpoint to complete the user email verification process. Use both
        # the **userId** and **secret** parameters that were attached to your app URL
        # to verify the user email ownership. If confirmed this route will return a
        # 200 status code.
        #
        # @param [string] user_id User ID.
        # @param [string] secret Valid verification token.
        #
        # @return [Token]
        def update_verification(user_id:, secret:)
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if secret.nil?
                raise Appwrite::Exception.new('Missing required parameter: "secret"')
            end

            path = '/account/verification'

            params = {
                userId: user_id,
                secret: secret,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Token
            )
        end

    end 
end