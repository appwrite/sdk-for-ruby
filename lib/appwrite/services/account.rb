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

        
        # Use this endpoint to allow a new user to register a new account in your
        # project. After the user registration completes successfully, you can use
        # the
        # [/account/verfication](https://appwrite.io/docs/references/cloud/client-web/account#createVerification)
        # route to start verifying the user email address. To allow the new user to
        # login to their new account, you need to create a new [account
        # session](https://appwrite.io/docs/references/cloud/client-web/account#createEmailSession).
        #
        # @param [String] user_id User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] password New user password. Must be between 8 and 256 chars.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create(user_id:, email:, password:, name: nil)
            api_path = '/account'

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email.nil?
              raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if password.nil?
              raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            api_params = {
                userId: user_id,
                email: email,
                password: password,
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
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, provider, providerUid, providerEmail, providerAccessTokenExpiry
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

        
        # Use this endpoint to create a JSON Web Token. You can use the resulting JWT
        # to authenticate on behalf of the current user when working with the
        # Appwrite server-side API and SDKs. The JWT secret is valid for 15 minutes
        # from its creation and will be invalid if the user will logout in that time
        # frame.
        #
        #
        # @return [Jwt]
        def create_jwt()
            api_path = '/account/jwts'

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
                response_type: Models::Jwt
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

        
        # Enable or disable MFA on an account.
        #
        # @param [] mfa Enable or disable MFA.
        #
        # @return [User]
        def update_mfa(mfa:)
            api_path = '/account/mfa'

            if mfa.nil?
              raise Appwrite::Exception.new('Missing required parameter: "mfa"')
            end

            api_params = {
                mfa: mfa,
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

        
        # Add an authenticator app to be used as an MFA factor. Verify the
        # authenticator using the [verify
        # authenticator](/docs/references/cloud/client-web/account#updateMfaAuthenticator)
        # method.
        #
        # @param [AuthenticatorType] type Type of authenticator. Must be `totp`
        #
        # @return [MfaType]
        def create_mfa_authenticator(type:)
            api_path = '/account/mfa/authenticators/{type}'
                .gsub('{type}', type)

            if type.nil?
              raise Appwrite::Exception.new('Missing required parameter: "type"')
            end

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
                response_type: Models::MfaType
            )
        end

        
        # Verify an authenticator app after adding it using the [add
        # authenticator](/docs/references/cloud/client-web/account#createMfaAuthenticator)
        # method.
        #
        # @param [AuthenticatorType] type Type of authenticator.
        # @param [String] otp Valid verification token.
        #
        # @return [User]
        def update_mfa_authenticator(type:, otp:)
            api_path = '/account/mfa/authenticators/{type}'
                .gsub('{type}', type)

            if type.nil?
              raise Appwrite::Exception.new('Missing required parameter: "type"')
            end

            if otp.nil?
              raise Appwrite::Exception.new('Missing required parameter: "otp"')
            end

            api_params = {
                otp: otp,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::User
            )
        end

        
        # Delete an authenticator for a user by ID.
        #
        # @param [AuthenticatorType] type Type of authenticator.
        #
        # @return []
        def delete_mfa_authenticator(type:)
            api_path = '/account/mfa/authenticators/{type}'
                .gsub('{type}', type)

            if type.nil?
              raise Appwrite::Exception.new('Missing required parameter: "type"')
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

        
        # Begin the process of MFA verification after sign-in. Finish the flow with
        # [updateMfaChallenge](/docs/references/cloud/client-web/account#updateMfaChallenge)
        # method.
        #
        # @param [AuthenticationFactor] factor Factor used for verification. Must be one of following: `email`, `phone`, `totp`, `recoveryCode`.
        #
        # @return [MfaChallenge]
        def create_mfa_challenge(factor:)
            api_path = '/account/mfa/challenge'

            if factor.nil?
              raise Appwrite::Exception.new('Missing required parameter: "factor"')
            end

            api_params = {
                factor: factor,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::MfaChallenge
            )
        end

        
        # Complete the MFA challenge by providing the one-time password. Finish the
        # process of MFA verification by providing the one-time password. To begin
        # the flow, use
        # [createMfaChallenge](/docs/references/cloud/client-web/account#createMfaChallenge)
        # method.
        #
        # @param [String] challenge_id ID of the challenge.
        # @param [String] otp Valid verification token.
        #
        # @return []
        def update_mfa_challenge(challenge_id:, otp:)
            api_path = '/account/mfa/challenge'

            if challenge_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "challengeId"')
            end

            if otp.nil?
              raise Appwrite::Exception.new('Missing required parameter: "otp"')
            end

            api_params = {
                challengeId: challenge_id,
                otp: otp,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        
        # List the factors available on the account to be used as a MFA challange.
        #
        #
        # @return [MfaFactors]
        def list_mfa_factors()
            api_path = '/account/mfa/factors'

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
                response_type: Models::MfaFactors
            )
        end

        
        # Get recovery codes that can be used as backup for MFA flow. Before getting
        # codes, they must be generated using
        # [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes)
        # method. An OTP challenge is required to read recovery codes.
        #
        #
        # @return [MfaRecoveryCodes]
        def get_mfa_recovery_codes()
            api_path = '/account/mfa/recovery-codes'

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
                response_type: Models::MfaRecoveryCodes
            )
        end

        
        # Generate recovery codes as backup for MFA flow. It's recommended to
        # generate and show then immediately after user successfully adds their
        # authehticator. Recovery codes can be used as a MFA verification type in
        # [createMfaChallenge](/docs/references/cloud/client-web/account#createMfaChallenge)
        # method.
        #
        #
        # @return [MfaRecoveryCodes]
        def create_mfa_recovery_codes()
            api_path = '/account/mfa/recovery-codes'

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
                response_type: Models::MfaRecoveryCodes
            )
        end

        
        # Regenerate recovery codes that can be used as backup for MFA flow. Before
        # regenerating codes, they must be first generated using
        # [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes)
        # method. An OTP challenge is required to regenreate recovery codes.
        #
        #
        # @return [MfaRecoveryCodes]
        def update_mfa_recovery_codes()
            api_path = '/account/mfa/recovery-codes'

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
                response_type: Models::MfaRecoveryCodes
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
        # /account/verification/phone](https://appwrite.io/docs/references/cloud/client-web/account#createPhoneVerification)
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
        # /account/recovery](https://appwrite.io/docs/references/cloud/client-web/account#updateRecovery)
        # endpoint to complete the process. The verification link sent to the user's
        # email address is valid for 1 hour.
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
        # /account/recovery](https://appwrite.io/docs/references/cloud/client-web/account#createRecovery)
        # endpoint.
        # 
        # Please note that in order to avoid a [Redirect
        # Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
        # the only valid redirect URLs are the ones from domains you have set when
        # adding your platforms in the console interface.
        #
        # @param [String] user_id User ID.
        # @param [String] secret Valid reset token.
        # @param [String] password New user password. Must be between 8 and 256 chars.
        #
        # @return [Token]
        def update_recovery(user_id:, secret:, password:)
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

            api_params = {
                userId: user_id,
                secret: secret,
                password: password,
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

        
        # Use this endpoint to allow a new user to register an anonymous account in
        # your project. This route will also create a new session for the user. To
        # allow the new user to convert an anonymous account to a normal account, you
        # need to update its [email and
        # password](https://appwrite.io/docs/references/cloud/client-web/account#updateEmail)
        # or create an [OAuth2
        # session](https://appwrite.io/docs/references/cloud/client-web/account#CreateOAuth2Session).
        #
        #
        # @return [Session]
        def create_anonymous_session()
            api_path = '/account/sessions/anonymous'

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
                response_type: Models::Session
            )
        end

        
        # Allow the user to login into their account by providing a valid email and
        # password combination. This route will create a new session for the user.
        # 
        # A user is limited to 10 active sessions at a time by default. [Learn more
        # about session
        # limits](https://appwrite.io/docs/authentication-security#limits).
        #
        # @param [String] email User email.
        # @param [String] password User password. Must be at least 8 chars.
        #
        # @return [Session]
        def create_email_password_session(email:, password:)
            api_path = '/account/sessions/email'

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
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Session
            )
        end

        
        # Use this endpoint to create a session from token. Provide the **userId**
        # and **secret** parameters from the successful response of authentication
        # flows initiated by token creation. For example, magic URL and phone login.
        #
        # @param [String] user_id User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] secret Valid verification token.
        #
        # @return [Session]
        def update_magic_url_session(user_id:, secret:)
            api_path = '/account/sessions/magic-url'

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
                response_type: Models::Session
            )
        end

        
        # Use this endpoint to create a session from token. Provide the **userId**
        # and **secret** parameters from the successful response of authentication
        # flows initiated by token creation. For example, magic URL and phone login.
        #
        # @param [String] user_id User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] secret Valid verification token.
        #
        # @return [Session]
        def update_phone_session(user_id:, secret:)
            api_path = '/account/sessions/phone'

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
                response_type: Models::Session
            )
        end

        
        # Use this endpoint to create a session from token. Provide the **userId**
        # and **secret** parameters from the successful response of authentication
        # flows initiated by token creation. For example, magic URL and phone login.
        #
        # @param [String] user_id User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] secret Secret of a token generated by login methods. For example, the `createMagicURLToken` or `createPhoneToken` methods.
        #
        # @return [Session]
        def create_session(user_id:, secret:)
            api_path = '/account/sessions/token'

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
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Session
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

        
        # Use this endpoint to extend a session's length. Extending a session is
        # useful when session expiry is short. If the session was created using an
        # OAuth provider, this endpoint refreshes the access token from the provider.
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
        # Sessions](https://appwrite.io/docs/references/cloud/client-web/account#deleteSessions)
        # instead.
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

        
        # Sends the user an email with a secret key for creating a session. If the
        # provided user ID has not be registered, a new user will be created. Use the
        # returned user ID and secret and submit a request to the [POST
        # /v1/account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession)
        # endpoint to complete the login process. The secret sent to the user's email
        # is valid for 15 minutes.
        # 
        # A user is limited to 10 active sessions at a time by default. [Learn more
        # about session
        # limits](https://appwrite.io/docs/authentication-security#limits).
        #
        # @param [String] user_id User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [] phrase Toggle for security phrase. If enabled, email will be send with a randomly generated phrase and the phrase will also be included in the response. Confirming phrases match increases the security of your authentication flow.
        #
        # @return [Token]
        def create_email_token(user_id:, email:, phrase: nil)
            api_path = '/account/tokens/email'

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email.nil?
              raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            api_params = {
                userId: user_id,
                email: email,
                phrase: phrase,
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

        
        # Sends the user an email with a secret key for creating a session. If the
        # provided user ID has not been registered, a new user will be created. When
        # the user clicks the link in the email, the user is redirected back to the
        # URL you provided with the secret key and userId values attached to the URL
        # query string. Use the query string parameters to submit a request to the
        # [POST
        # /v1/account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession)
        # endpoint to complete the login process. The link sent to the user's email
        # address is valid for 1 hour.
        # 
        # A user is limited to 10 active sessions at a time by default. [Learn more
        # about session
        # limits](https://appwrite.io/docs/authentication-security#limits).
        # 
        #
        # @param [String] user_id Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] url URL to redirect the user back to your app from the magic URL login. Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.
        # @param [] phrase Toggle for security phrase. If enabled, email will be send with a randomly generated phrase and the phrase will also be included in the response. Confirming phrases match increases the security of your authentication flow.
        #
        # @return [Token]
        def create_magic_url_token(user_id:, email:, url: nil, phrase: nil)
            api_path = '/account/tokens/magic-url'

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email.nil?
              raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            api_params = {
                userId: user_id,
                email: email,
                url: url,
                phrase: phrase,
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

        
        # Allow the user to login to their account using the OAuth2 provider of their
        # choice. Each OAuth2 provider should be enabled from the Appwrite console
        # first. Use the success and failure arguments to provide a redirect URL's
        # back to your app when login is completed. 
        # 
        # If authentication succeeds, `userId` and `secret` of a token will be
        # appended to the success URL as query parameters. These can be used to
        # create a new session using the [Create
        # session](https://appwrite.io/docs/references/cloud/client-web/account#createSession)
        # endpoint.
        # 
        # A user is limited to 10 active sessions at a time by default. [Learn more
        # about session
        # limits](https://appwrite.io/docs/authentication-security#limits).
        #
        # @param [OAuthProvider] provider OAuth2 Provider. Currently, supported providers are: amazon, apple, auth0, authentik, autodesk, bitbucket, bitly, box, dailymotion, discord, disqus, dropbox, etsy, facebook, github, gitlab, google, linkedin, microsoft, notion, oidc, okta, paypal, paypalSandbox, podio, salesforce, slack, spotify, stripe, tradeshift, tradeshiftBox, twitch, wordpress, yahoo, yammer, yandex, zoho, zoom.
        # @param [String] success URL to redirect back to your app after a successful login attempt.  Only URLs from hostnames in your project's platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.
        # @param [String] failure URL to redirect back to your app after a failed login attempt.  Only URLs from hostnames in your project's platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.
        # @param [Array] scopes A list of custom OAuth2 scopes. Check each provider internal docs for a list of supported scopes. Maximum of 100 scopes are allowed, each 4096 characters long.
        #
        # @return []
        def create_o_auth2_token(provider:, success: nil, failure: nil, scopes: nil)
            api_path = '/account/tokens/oauth2/{provider}'
                .gsub('{provider}', provider)

            if provider.nil?
              raise Appwrite::Exception.new('Missing required parameter: "provider"')
            end

            api_params = {
                success: success,
                failure: failure,
                scopes: scopes,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: "location"
            )
        end

        
        # Sends the user an SMS with a secret key for creating a session. If the
        # provided user ID has not be registered, a new user will be created. Use the
        # returned user ID and secret and submit a request to the [POST
        # /v1/account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession)
        # endpoint to complete the login process. The secret sent to the user's phone
        # is valid for 15 minutes.
        # 
        # A user is limited to 10 active sessions at a time by default. [Learn more
        # about session
        # limits](https://appwrite.io/docs/authentication-security#limits).
        #
        # @param [String] user_id Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] phone Phone number. Format this number with a leading '+' and a country code, e.g., +16175551212.
        #
        # @return [Token]
        def create_phone_token(user_id:, phone:)
            api_path = '/account/tokens/phone'

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if phone.nil?
              raise Appwrite::Exception.new('Missing required parameter: "phone"')
            end

            api_params = {
                userId: user_id,
                phone: phone,
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

        
        # Use this endpoint to send a verification message to your user email address
        # to confirm they are the valid owners of that address. Both the **userId**
        # and **secret** arguments will be passed as query parameters to the URL you
        # have provided to be attached to the verification email. The provided URL
        # should redirect the user back to your app and allow you to complete the
        # verification process by verifying both the **userId** and **secret**
        # parameters. Learn more about how to [complete the verification
        # process](https://appwrite.io/docs/references/cloud/client-web/account#updateVerification).
        # The verification link sent to the user's email address is valid for 7 days.
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
        # using the
        # [accountUpdatePhone](https://appwrite.io/docs/references/cloud/client-web/account#updatePhone)
        # endpoint. Learn more about how to [complete the verification
        # process](https://appwrite.io/docs/references/cloud/client-web/account#updatePhoneVerification).
        # The verification code sent to the user's phone number is valid for 15
        # minutes.
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