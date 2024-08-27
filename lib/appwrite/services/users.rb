#frozen_string_literal: true

module Appwrite
    class Users < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all the project's users. You can use the query params to
        # filter your results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, email, phone, status, passwordUpdate, registration, emailVerification, phoneVerification, labels
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [UserList]
        def list(queries: nil, search: nil)
            api_path = '/users'

            api_params = {
                queries: queries,
                search: search,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::UserList
            )
        end

        
        # Create a new user.
        #
        # @param [String] user_id User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] phone Phone number. Format this number with a leading '+' and a country code, e.g., +16175551212.
        # @param [String] password Plain text user password. Must be at least 8 chars.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create(user_id:, email: nil, phone: nil, password: nil, name: nil)
            api_path = '/users'

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            api_params = {
                userId: user_id,
                email: email,
                phone: phone,
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

        
        # Create a new user. Password provided must be hashed with the
        # [Argon2](https://en.wikipedia.org/wiki/Argon2) algorithm. Use the [POST
        # /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
        # create users with a plain text password.
        #
        # @param [String] user_id User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] password User password hashed using Argon2.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create_argon2_user(user_id:, email:, password:, name: nil)
            api_path = '/users/argon2'

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

        
        # Create a new user. Password provided must be hashed with the
        # [Bcrypt](https://en.wikipedia.org/wiki/Bcrypt) algorithm. Use the [POST
        # /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
        # create users with a plain text password.
        #
        # @param [String] user_id User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] password User password hashed using Bcrypt.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create_bcrypt_user(user_id:, email:, password:, name: nil)
            api_path = '/users/bcrypt'

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

        
        # Get identities for all users.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, provider, providerUid, providerEmail, providerAccessTokenExpiry
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [IdentityList]
        def list_identities(queries: nil, search: nil)
            api_path = '/users/identities'

            api_params = {
                queries: queries,
                search: search,
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
            api_path = '/users/identities/{identityId}'
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

        
        # Create a new user. Password provided must be hashed with the
        # [MD5](https://en.wikipedia.org/wiki/MD5) algorithm. Use the [POST
        # /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
        # create users with a plain text password.
        #
        # @param [String] user_id User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] password User password hashed using MD5.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create_md5_user(user_id:, email:, password:, name: nil)
            api_path = '/users/md5'

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

        
        # Create a new user. Password provided must be hashed with the
        # [PHPass](https://www.openwall.com/phpass/) algorithm. Use the [POST
        # /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
        # create users with a plain text password.
        #
        # @param [String] user_id User ID. Choose a custom ID or pass the string `ID.unique()`to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] password User password hashed using PHPass.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create_ph_pass_user(user_id:, email:, password:, name: nil)
            api_path = '/users/phpass'

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

        
        # Create a new user. Password provided must be hashed with the
        # [Scrypt](https://github.com/Tarsnap/scrypt) algorithm. Use the [POST
        # /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
        # create users with a plain text password.
        #
        # @param [String] user_id User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] password User password hashed using Scrypt.
        # @param [String] password_salt Optional salt used to hash password.
        # @param [Integer] password_cpu Optional CPU cost used to hash password.
        # @param [Integer] password_memory Optional memory cost used to hash password.
        # @param [Integer] password_parallel Optional parallelization cost used to hash password.
        # @param [Integer] password_length Optional hash length used to hash password.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create_scrypt_user(user_id:, email:, password:, password_salt:, password_cpu:, password_memory:, password_parallel:, password_length:, name: nil)
            api_path = '/users/scrypt'

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email.nil?
              raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if password.nil?
              raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            if password_salt.nil?
              raise Appwrite::Exception.new('Missing required parameter: "passwordSalt"')
            end

            if password_cpu.nil?
              raise Appwrite::Exception.new('Missing required parameter: "passwordCpu"')
            end

            if password_memory.nil?
              raise Appwrite::Exception.new('Missing required parameter: "passwordMemory"')
            end

            if password_parallel.nil?
              raise Appwrite::Exception.new('Missing required parameter: "passwordParallel"')
            end

            if password_length.nil?
              raise Appwrite::Exception.new('Missing required parameter: "passwordLength"')
            end

            api_params = {
                userId: user_id,
                email: email,
                password: password,
                passwordSalt: password_salt,
                passwordCpu: password_cpu,
                passwordMemory: password_memory,
                passwordParallel: password_parallel,
                passwordLength: password_length,
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

        
        # Create a new user. Password provided must be hashed with the [Scrypt
        # Modified](https://gist.github.com/Meldiron/eecf84a0225eccb5a378d45bb27462cc)
        # algorithm. Use the [POST
        # /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
        # create users with a plain text password.
        #
        # @param [String] user_id User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] password User password hashed using Scrypt Modified.
        # @param [String] password_salt Salt used to hash password.
        # @param [String] password_salt_separator Salt separator used to hash password.
        # @param [String] password_signer_key Signer key used to hash password.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create_scrypt_modified_user(user_id:, email:, password:, password_salt:, password_salt_separator:, password_signer_key:, name: nil)
            api_path = '/users/scrypt-modified'

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email.nil?
              raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if password.nil?
              raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            if password_salt.nil?
              raise Appwrite::Exception.new('Missing required parameter: "passwordSalt"')
            end

            if password_salt_separator.nil?
              raise Appwrite::Exception.new('Missing required parameter: "passwordSaltSeparator"')
            end

            if password_signer_key.nil?
              raise Appwrite::Exception.new('Missing required parameter: "passwordSignerKey"')
            end

            api_params = {
                userId: user_id,
                email: email,
                password: password,
                passwordSalt: password_salt,
                passwordSaltSeparator: password_salt_separator,
                passwordSignerKey: password_signer_key,
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

        
        # Create a new user. Password provided must be hashed with the
        # [SHA](https://en.wikipedia.org/wiki/Secure_Hash_Algorithm) algorithm. Use
        # the [POST /users](https://appwrite.io/docs/server/users#usersCreate)
        # endpoint to create users with a plain text password.
        #
        # @param [String] user_id User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] password User password hashed using SHA.
        # @param [PasswordHash] password_version Optional SHA version used to hash password. Allowed values are: 'sha1', 'sha224', 'sha256', 'sha384', 'sha512/224', 'sha512/256', 'sha512', 'sha3-224', 'sha3-256', 'sha3-384', 'sha3-512'
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create_sha_user(user_id:, email:, password:, password_version: nil, name: nil)
            api_path = '/users/sha'

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
                passwordVersion: password_version,
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

        
        # Get a user by its unique ID.
        #
        # @param [String] user_id User ID.
        #
        # @return [User]
        def get(user_id:)
            api_path = '/users/{userId}'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
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
                response_type: Models::User
            )
        end

        
        # Delete a user by its unique ID, thereby releasing it's ID. Since ID is
        # released and can be reused, all user-related resources like documents or
        # storage files should be deleted before user deletion. If you want to keep
        # ID reserved, use the
        # [updateStatus](https://appwrite.io/docs/server/users#usersUpdateStatus)
        # endpoint instead.
        #
        # @param [String] user_id User ID.
        #
        # @return []
        def delete(user_id:)
            api_path = '/users/{userId}'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
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

        
        # Update the user email by its unique ID.
        #
        # @param [String] user_id User ID.
        # @param [String] email User email.
        #
        # @return [User]
        def update_email(user_id:, email:)
            api_path = '/users/{userId}/email'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email.nil?
              raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            api_params = {
                email: email,
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

        
        # Use this endpoint to create a JSON Web Token for user by its unique ID. You
        # can use the resulting JWT to authenticate on behalf of the user. The JWT
        # secret will become invalid if the session it uses gets deleted.
        #
        # @param [String] user_id User ID.
        # @param [String] session_id Session ID. Use the string 'recent' to use the most recent session. Defaults to the most recent session.
        # @param [Integer] duration Time in seconds before JWT expires. Default duration is 900 seconds, and maximum is 3600 seconds.
        #
        # @return [Jwt]
        def create_jwt(user_id:, session_id: nil, duration: nil)
            api_path = '/users/{userId}/jwts'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            api_params = {
                sessionId: session_id,
                duration: duration,
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

        
        # Update the user labels by its unique ID. 
        # 
        # Labels can be used to grant access to resources. While teams are a way for
        # user's to share access to a resource, labels can be defined by the
        # developer to grant access without an invitation. See the [Permissions
        # docs](https://appwrite.io/docs/permissions) for more info.
        #
        # @param [String] user_id User ID.
        # @param [Array] labels Array of user labels. Replaces the previous labels. Maximum of 1000 labels are allowed, each up to 36 alphanumeric characters long.
        #
        # @return [User]
        def update_labels(user_id:, labels:)
            api_path = '/users/{userId}/labels'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if labels.nil?
              raise Appwrite::Exception.new('Missing required parameter: "labels"')
            end

            api_params = {
                labels: labels,
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

        
        # Get the user activity logs list by its unique ID.
        #
        # @param [String] user_id User ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset
        #
        # @return [LogList]
        def list_logs(user_id:, queries: nil)
            api_path = '/users/{userId}/logs'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

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

        
        # Get the user membership list by its unique ID.
        #
        # @param [String] user_id User ID.
        #
        # @return [MembershipList]
        def list_memberships(user_id:)
            api_path = '/users/{userId}/memberships'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
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
                response_type: Models::MembershipList
            )
        end

        
        # Enable or disable MFA on a user account.
        #
        # @param [String] user_id User ID.
        # @param [] mfa Enable or disable MFA.
        #
        # @return [User]
        def update_mfa(user_id:, mfa:)
            api_path = '/users/{userId}/mfa'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

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

        
        # Delete an authenticator app.
        #
        # @param [String] user_id User ID.
        # @param [AuthenticatorType] type Type of authenticator.
        #
        # @return [User]
        def delete_mfa_authenticator(user_id:, type:)
            api_path = '/users/{userId}/mfa/authenticators/{type}'
                .gsub('{userId}', user_id)
                .gsub('{type}', type)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

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
                response_type: Models::User
            )
        end

        
        # List the factors available on the account to be used as a MFA challange.
        #
        # @param [String] user_id User ID.
        #
        # @return [MfaFactors]
        def list_mfa_factors(user_id:)
            api_path = '/users/{userId}/mfa/factors'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
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
                response_type: Models::MfaFactors
            )
        end

        
        # Get recovery codes that can be used as backup for MFA flow by User ID.
        # Before getting codes, they must be generated using
        # [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes)
        # method.
        #
        # @param [String] user_id User ID.
        #
        # @return [MfaRecoveryCodes]
        def get_mfa_recovery_codes(user_id:)
            api_path = '/users/{userId}/mfa/recovery-codes'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
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
                response_type: Models::MfaRecoveryCodes
            )
        end

        
        # Regenerate recovery codes that can be used as backup for MFA flow by User
        # ID. Before regenerating codes, they must be first generated using
        # [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes)
        # method.
        #
        # @param [String] user_id User ID.
        #
        # @return [MfaRecoveryCodes]
        def update_mfa_recovery_codes(user_id:)
            api_path = '/users/{userId}/mfa/recovery-codes'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            api_params = {
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::MfaRecoveryCodes
            )
        end

        
        # Generate recovery codes used as backup for MFA flow for User ID. Recovery
        # codes can be used as a MFA verification type in
        # [createMfaChallenge](/docs/references/cloud/client-web/account#createMfaChallenge)
        # method by client SDK.
        #
        # @param [String] user_id User ID.
        #
        # @return [MfaRecoveryCodes]
        def create_mfa_recovery_codes(user_id:)
            api_path = '/users/{userId}/mfa/recovery-codes'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
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
                response_type: Models::MfaRecoveryCodes
            )
        end

        
        # Update the user name by its unique ID.
        #
        # @param [String] user_id User ID.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def update_name(user_id:, name:)
            api_path = '/users/{userId}/name'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

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

        
        # Update the user password by its unique ID.
        #
        # @param [String] user_id User ID.
        # @param [String] password New user password. Must be at least 8 chars.
        #
        # @return [User]
        def update_password(user_id:, password:)
            api_path = '/users/{userId}/password'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if password.nil?
              raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

            api_params = {
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

        
        # Update the user phone by its unique ID.
        #
        # @param [String] user_id User ID.
        # @param [String] number User phone number.
        #
        # @return [User]
        def update_phone(user_id:, number:)
            api_path = '/users/{userId}/phone'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if number.nil?
              raise Appwrite::Exception.new('Missing required parameter: "number"')
            end

            api_params = {
                number: number,
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

        
        # Get the user preferences by its unique ID.
        #
        # @param [String] user_id User ID.
        #
        # @return [Preferences]
        def get_prefs(user_id:)
            api_path = '/users/{userId}/prefs'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
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
                response_type: Models::Preferences
            )
        end

        
        # Update the user preferences by its unique ID. The object you pass is stored
        # as is, and replaces any previous value. The maximum allowed prefs size is
        # 64kB and throws error if exceeded.
        #
        # @param [String] user_id User ID.
        # @param [Hash] prefs Prefs key-value JSON object.
        #
        # @return [Preferences]
        def update_prefs(user_id:, prefs:)
            api_path = '/users/{userId}/prefs'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

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
                response_type: Models::Preferences
            )
        end

        
        # Get the user sessions list by its unique ID.
        #
        # @param [String] user_id User ID.
        #
        # @return [SessionList]
        def list_sessions(user_id:)
            api_path = '/users/{userId}/sessions'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
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
                response_type: Models::SessionList
            )
        end

        
        # Creates a session for a user. Returns an immediately usable session object.
        # 
        # If you want to generate a token for a custom authentication flow, use the
        # [POST
        # /users/{userId}/tokens](https://appwrite.io/docs/server/users#createToken)
        # endpoint.
        #
        # @param [String] user_id User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        #
        # @return [Session]
        def create_session(user_id:)
            api_path = '/users/{userId}/sessions'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
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
                response_type: Models::Session
            )
        end

        
        # Delete all user's sessions by using the user's unique ID.
        #
        # @param [String] user_id User ID.
        #
        # @return []
        def delete_sessions(user_id:)
            api_path = '/users/{userId}/sessions'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
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

        
        # Delete a user sessions by its unique ID.
        #
        # @param [String] user_id User ID.
        # @param [String] session_id Session ID.
        #
        # @return []
        def delete_session(user_id:, session_id:)
            api_path = '/users/{userId}/sessions/{sessionId}'
                .gsub('{userId}', user_id)
                .gsub('{sessionId}', session_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

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

        
        # Update the user status by its unique ID. Use this endpoint as an
        # alternative to deleting a user if you want to keep user's ID reserved.
        #
        # @param [String] user_id User ID.
        # @param [] status User Status. To activate the user pass `true` and to block the user pass `false`.
        #
        # @return [User]
        def update_status(user_id:, status:)
            api_path = '/users/{userId}/status'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if status.nil?
              raise Appwrite::Exception.new('Missing required parameter: "status"')
            end

            api_params = {
                status: status,
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

        
        # List the messaging targets that are associated with a user.
        #
        # @param [String] user_id User ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, email, phone, status, passwordUpdate, registration, emailVerification, phoneVerification, labels
        #
        # @return [TargetList]
        def list_targets(user_id:, queries: nil)
            api_path = '/users/{userId}/targets'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

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
                response_type: Models::TargetList
            )
        end

        
        # Create a messaging target.
        #
        # @param [String] user_id User ID.
        # @param [String] target_id Target ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [MessagingProviderType] provider_type The target provider type. Can be one of the following: `email`, `sms` or `push`.
        # @param [String] identifier The target identifier (token, email, phone etc.)
        # @param [String] provider_id Provider ID. Message will be sent to this target from the specified provider ID. If no provider ID is set the first setup provider will be used.
        # @param [String] name Target name. Max length: 128 chars. For example: My Awesome App Galaxy S23.
        #
        # @return [Target]
        def create_target(user_id:, target_id:, provider_type:, identifier:, provider_id: nil, name: nil)
            api_path = '/users/{userId}/targets'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if target_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "targetId"')
            end

            if provider_type.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerType"')
            end

            if identifier.nil?
              raise Appwrite::Exception.new('Missing required parameter: "identifier"')
            end

            api_params = {
                targetId: target_id,
                providerType: provider_type,
                identifier: identifier,
                providerId: provider_id,
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
                response_type: Models::Target
            )
        end

        
        # Get a user's push notification target by ID.
        #
        # @param [String] user_id User ID.
        # @param [String] target_id Target ID.
        #
        # @return [Target]
        def get_target(user_id:, target_id:)
            api_path = '/users/{userId}/targets/{targetId}'
                .gsub('{userId}', user_id)
                .gsub('{targetId}', target_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if target_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "targetId"')
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
                response_type: Models::Target
            )
        end

        
        # Update a messaging target.
        #
        # @param [String] user_id User ID.
        # @param [String] target_id Target ID.
        # @param [String] identifier The target identifier (token, email, phone etc.)
        # @param [String] provider_id Provider ID. Message will be sent to this target from the specified provider ID. If no provider ID is set the first setup provider will be used.
        # @param [String] name Target name. Max length: 128 chars. For example: My Awesome App Galaxy S23.
        #
        # @return [Target]
        def update_target(user_id:, target_id:, identifier: nil, provider_id: nil, name: nil)
            api_path = '/users/{userId}/targets/{targetId}'
                .gsub('{userId}', user_id)
                .gsub('{targetId}', target_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if target_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "targetId"')
            end

            api_params = {
                identifier: identifier,
                providerId: provider_id,
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
                response_type: Models::Target
            )
        end

        
        # Delete a messaging target.
        #
        # @param [String] user_id User ID.
        # @param [String] target_id Target ID.
        #
        # @return []
        def delete_target(user_id:, target_id:)
            api_path = '/users/{userId}/targets/{targetId}'
                .gsub('{userId}', user_id)
                .gsub('{targetId}', target_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if target_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "targetId"')
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

        
        # Returns a token with a secret key for creating a session. Use the user ID
        # and secret and submit a request to the [PUT
        # /account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession)
        # endpoint to complete the login process.
        # 
        #
        # @param [String] user_id User ID.
        # @param [Integer] length Token length in characters. The default length is 6 characters
        # @param [Integer] expire Token expiration period in seconds. The default expiration is 15 minutes.
        #
        # @return [Token]
        def create_token(user_id:, length: nil, expire: nil)
            api_path = '/users/{userId}/tokens'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            api_params = {
                length: length,
                expire: expire,
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

        
        # Update the user email verification status by its unique ID.
        #
        # @param [String] user_id User ID.
        # @param [] email_verification User email verification status.
        #
        # @return [User]
        def update_email_verification(user_id:, email_verification:)
            api_path = '/users/{userId}/verification'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email_verification.nil?
              raise Appwrite::Exception.new('Missing required parameter: "emailVerification"')
            end

            api_params = {
                emailVerification: email_verification,
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

        
        # Update the user phone verification status by its unique ID.
        #
        # @param [String] user_id User ID.
        # @param [] phone_verification User phone verification status.
        #
        # @return [User]
        def update_phone_verification(user_id:, phone_verification:)
            api_path = '/users/{userId}/verification/phone'
                .gsub('{userId}', user_id)

            if user_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if phone_verification.nil?
              raise Appwrite::Exception.new('Missing required parameter: "phoneVerification"')
            end

            api_params = {
                phoneVerification: phone_verification,
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

        
    end 
end