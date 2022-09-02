#frozen_string_literal: true

module Appwrite
    class Account < Service

        def initialize(client)
            @client = client
        end

        # Get currently logged in user data as JSON object.
        #
        #
        # @return [Account]
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
                response_type: Models::Account
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
        # @param [String] email User email.
        # @param [String] password User password. Must be at least 8 chars.
        #
        # @return [Account]
        def update_email(email:, password:)

            path = '/account/email'

            params = {
                email: email,
                password: password,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if email.nil?
                raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end


            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Account
            )
        end

        
        # Get currently logged in user list of latest security activity logs. Each
        # log returns user IP address, location and date and time of log.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Only supported methods are limit and offset
        #
        # @return [LogList]
        def get_logs(queries: nil)

            path = '/account/logs'

            params = {
                queries: queries,
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
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [Account]
        def update_name(name:)

            path = '/account/name'

            params = {
                name: name,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end


            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Account
            )
        end

        
        # Update currently logged in user password. For validation, user is required
        # to pass in the new password, and the old password. For users created with
        # OAuth, Team Invites and Magic URL, oldPassword is optional.
        #
        # @param [String] password New user password. Must be at least 8 chars.
        # @param [String] old_password Current user password. Must be at least 8 chars.
        #
        # @return [Account]
        def update_password(password:, old_password: nil)

            path = '/account/password'

            params = {
                password: password,
                oldPassword: old_password,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end


            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Account
            )
        end

        
        # Update the currently logged in user's phone number. After updating the
        # phone number, the phone verification status will be reset. A confirmation
        # SMS is not sent automatically, however you can use the [POST
        # /account/verification/phone](/docs/client/account#accountCreatePhoneVerification)
        # endpoint to send a confirmation SMS.
        #
        # @param [String] phone Phone number. Format this number with a leading &#039;+&#039; and a country code, e.g., +16175551212.
        # @param [String] password User password. Must be at least 8 chars.
        #
        # @return [Account]
        def update_phone(phone:, password:)

            path = '/account/phone'

            params = {
                phone: phone,
                password: password,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if phone.nil?
                raise Appwrite::Exception.new('Missing required parameter: "phone"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end


            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Account
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
        # @param [Hash] prefs Prefs key-value JSON object.
        #
        # @return [Account]
        def update_prefs(prefs:)

            path = '/account/prefs'

            params = {
                prefs: prefs,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if prefs.nil?
                raise Appwrite::Exception.new('Missing required parameter: "prefs"')
            end


            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Account
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
        # @param [String] email User email.
        # @param [String] url URL to redirect the user back to your app from the recovery email. Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.
        #
        # @return [Token]
        def create_recovery(email:, url:)

            path = '/account/recovery'

            params = {
                email: email,
                url: url,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if email.nil?
                raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if url.nil?
                raise Appwrite::Exception.new('Missing required parameter: "url"')
            end


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
        # @param [String] user_id User ID.
        # @param [String] secret Valid reset token.
        # @param [String] password New user password. Must be at least 8 chars.
        # @param [String] password_again Repeat new user password. Must be at least 8 chars.
        #
        # @return [Token]
        def update_recovery(user_id:, secret:, password:, password_again:)

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
        # @param [String] session_id Session ID. Use the string &#039;current&#039; to get the current device session.
        #
        # @return [Session]
        def get_session(session_id:)

            path = '/account/sessions/{sessionId}'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if session_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "sessionId"')
            end

                .gsub('{sessionId}', session_id)

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Session
            )
        end

        
        # Access tokens have limited lifespan and expire to mitigate security risks.
        # If session was created using an OAuth provider, this route can be used to
        # "refresh" the access token.
        #
        # @param [String] session_id Session ID. Use the string &#039;current&#039; to update the current device session.
        #
        # @return [Session]
        def update_session(session_id:)

            path = '/account/sessions/{sessionId}'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if session_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "sessionId"')
            end

                .gsub('{sessionId}', session_id)

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
        # @param [String] session_id Session ID. Use the string &#039;current&#039; to delete the current device session.
        #
        # @return []
        def delete_session(session_id:)

            path = '/account/sessions/{sessionId}'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if session_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "sessionId"')
            end

                .gsub('{sessionId}', session_id)

            @client.call(
                method: 'DELETE',
                path: path,
                headers: headers,
                params: params,
            )
        end

        
        # Block the currently logged in user account. Behind the scene, the user
        # record is not deleted but permanently blocked from any access. To
        # completely delete a user, use the Users API instead.
        #
        #
        # @return [Account]
        def update_status()

            path = '/account/status'

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
                response_type: Models::Account
            )
        end

        
        # Use this endpoint to send a verification message to your user email address
        # to confirm they are the valid owners of that address. Both the **userId**
        # and **secret** arguments will be passed as query parameters to the URL you
        # have provided to be attached to the verification email. The provided URL
        # should redirect the user back to your app and allow you to complete the
        # verification process by verifying both the **userId** and **secret**
        # parameters. Learn more about how to [complete the verification
        # process](/docs/client/account#accountUpdateEmailVerification). The
        # verification link sent to the user's email address is valid for 7 days.
        # 
        # Please note that in order to avoid a [Redirect
        # Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md),
        # the only valid redirect URLs are the ones from domains you have set when
        # adding your platforms in the console interface.
        # 
        #
        # @param [String] url URL to redirect the user back to your app from the verification email. Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.
        #
        # @return [Token]
        def create_verification(url:)

            path = '/account/verification'

            params = {
                url: url,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if url.nil?
                raise Appwrite::Exception.new('Missing required parameter: "url"')
            end


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
        # @param [String] user_id User ID.
        # @param [String] secret Valid verification token.
        #
        # @return [Token]
        def update_verification(user_id:, secret:)

            path = '/account/verification'

            params = {
                userId: user_id,
                secret: secret,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if secret.nil?
                raise Appwrite::Exception.new('Missing required parameter: "secret"')
            end


            @client.call(
                method: 'PUT',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Token
            )
        end

        
        # Use this endpoint to send a verification SMS to the currently logged in
        # user. This endpoint is meant for use after updating a user's phone number
        # using the [accountUpdatePhone](/docs/client/account#accountUpdatePhone)
        # endpoint. Learn more about how to [complete the verification
        # process](/docs/client/account#accountUpdatePhoneVerification). The
        # verification code sent to the user's phone number is valid for 15 minutes.
        #
        #
        # @return [Token]
        def create_phone_verification()

            path = '/account/verification/phone'

            params = {
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

        
        # Use this endpoint to complete the user phone verification process. Use the
        # **userId** and **secret** that were sent to your user's phone number to
        # verify the user email ownership. If confirmed this route will return a 200
        # status code.
        #
        # @param [String] user_id User ID.
        # @param [String] secret Valid verification token.
        #
        # @return [Token]
        def update_phone_verification(user_id:, secret:)

            path = '/account/verification/phone'

            params = {
                userId: user_id,
                secret: secret,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if secret.nil?
                raise Appwrite::Exception.new('Missing required parameter: "secret"')
            end


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