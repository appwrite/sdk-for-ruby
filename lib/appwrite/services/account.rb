#frozen_string_literal: true

module Appwrite
    class Account < Service

        def initialize(client)
            @client = client
        end

        # Get the currently logged in user.
        #
        #
        # @return [User]
        def get()
            api_path = '/account'

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::User
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
        # @return [User]
        def update_email(email:, password:)
            api_path = '/account/email'

            if email.nil?
              raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if password.nil?
              raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            api_params = {
                email: email,
                password: password,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::User
            )
        end

        
        # Get the list of identities for the currently logged in user.
        #
        # @param [String] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, provider, providerUid, providerEmail, providerAccessTokenExpiry
        #
        # @return [IdentityList]
        def list_identities(queries: nil)
            api_path = '/account/identities'

            api_params = {
                queries: queries,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::IdentityList
            )
        end

        
        # Delete an identity by its unique ID.
        #
        # @param [String] identity_id Identity ID.
        #
        # @return []
        def delete_identity(identity_id:)
            api_path = '/account/identities/{identityId}'
                .gsub('{identityId}', identity_id)

            if identity_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "identityId"')
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

        
        # Get the list of latest security activity logs for the currently logged in
        # user. Each log returns user IP address, location and date and time of log.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset
        #
        # @return [LogList]
        def list_logs(queries: nil)
            api_path = '/account/logs'

            api_params = {
                queries: queries,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::LogList
            )
        end

        
        # Update currently logged in user account name.
        #
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def update_name(name:)
            api_path = '/account/name'

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
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::User
            )
        end

        
        # Update currently logged in user password. For validation, user is required
        # to pass in the new password, and the old password. For users created with
        # OAuth, Team Invites and Magic URL, oldPassword is optional.
        #
        # @param [String] password New user password. Must be at least 8 chars.
        # @param [String] old_password Current user password. Must be at least 8 chars.
        #
        # @return [User]
        def update_password(password:, old_password: nil)
            api_path = '/account/password'

            if password.nil?
              raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            api_params = {
                password: password,
                oldPassword: old_password,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::User
            )
        end

        
        # Update the currently logged in user's phone number. After updating the
        # phone number, the phone verification status will be reset. A confirmation
        # SMS is not sent automatically, however you can use the [POST
        # /account/verification/phone](/docs/client/account#accountCreatePhoneVerification)
        # endpoint to send a confirmation SMS.
        #
        # @param [String] phone Phone number. Format this number with a leading '+' and a country code, e.g., +16175551212.
        # @param [String] password User password. Must be at least 8 chars.
        #
        # @return [User]
        def update_phone(phone:, password:)
            api_path = '/account/phone'

            if phone.nil?
              raise Appwrite::Exception.new('Missing required parameter: "phone"')
            end

            if password.nil?
              raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            api_params = {
                phone: phone,
                password: password,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::User
            )
        end

        
        # Get the preferences as a key-value object for the currently logged in user.
        #
        #
        # @return [Preferences]
        def get_prefs()
            api_path = '/account/prefs'

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Preferences
            )
        end

        
        # Update currently logged in user account preferences. The object you pass is
        # stored as is, and replaces any previous value. The maximum allowed prefs
        # size is 64kB and throws error if exceeded.
        #
        # @param [Hash] prefs Prefs key-value JSON object.
        #
        # @return [User]
        def update_prefs(prefs:)
            api_path = '/account/prefs'

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
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
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
        # @param [String] email User email.
        # @param [String] url URL to redirect the user back to your app from the recovery email. Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.
        #
        # @return [Token]
        def create_recovery(email:, url:)
            api_path = '/account/recovery'

            if email.nil?
              raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if url.nil?
              raise Appwrite::Exception.new('Missing required parameter: "url"')
            end

            api_params = {
                email: email,
                url: url,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
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
            api_path = '/account/recovery'

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

            api_params = {
                userId: user_id,
                secret: secret,
                password: password,
                passwordAgain: password_again,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Token
            )
        end

        
        # Get the list of active sessions across different devices for the currently
        # logged in user.
        #
        #
        # @return [SessionList]
        def list_sessions()
            api_path = '/account/sessions'

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::SessionList
            )
        end

        
        # Delete all sessions from the user account and remove any sessions cookies
        # from the end client.
        #
        #
        # @return []
        def delete_sessions()
            api_path = '/account/sessions'

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

        
        # Use this endpoint to get a logged in user's session using a Session ID.
        # Inputting 'current' will return the current session being used.
        #
        # @param [String] session_id Session ID. Use the string 'current' to get the current device session.
        #
        # @return [Session]
        def get_session(session_id:)
            api_path = '/account/sessions/{sessionId}'
                .gsub('{sessionId}', session_id)

            if session_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "sessionId"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Session
            )
        end

        
        # Access tokens have limited lifespan and expire to mitigate security risks.
        # If session was created using an OAuth provider, this route can be used to
        # "refresh" the access token.
        #
        # @param [String] session_id Session ID. Use the string 'current' to update the current device session.
        #
        # @return [Session]
        def update_session(session_id:)
            api_path = '/account/sessions/{sessionId}'
                .gsub('{sessionId}', session_id)

            if session_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "sessionId"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Session
            )
        end

        
        # Logout the user. Use 'current' as the session ID to logout on this device,
        # use a session ID to logout on another device. If you're looking to logout
        # the user on all devices, use [Delete
        # Sessions](/docs/client/account#accountDeleteSessions) instead.
        #
        # @param [String] session_id Session ID. Use the string 'current' to delete the current device session.
        #
        # @return []
        def delete_session(session_id:)
            api_path = '/account/sessions/{sessionId}'
                .gsub('{sessionId}', session_id)

            if session_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "sessionId"')
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

        
        # Block the currently logged in user account. Behind the scene, the user
        # record is not deleted but permanently blocked from any access. To
        # completely delete a user, use the Users API instead.
        #
        #
        # @return [User]
        def update_status()
            api_path = '/account/status'

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::User
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
            api_path = '/account/verification'

            if url.nil?
              raise Appwrite::Exception.new('Missing required parameter: "url"')
            end

            api_params = {
                url: url,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
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
            api_path = '/account/verification'

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
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
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
            api_path = '/account/verification/phone'

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
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
            api_path = '/account/verification/phone'

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
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Token
            )
        end

        
    end 
end