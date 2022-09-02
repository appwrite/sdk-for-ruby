#frozen_string_literal: true

module Appwrite
    class Users < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all the project's users. You can use the query params to
        # filter your results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, email, phone, status, passwordUpdate, registration, emailVerification, phoneVerification
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [UserList]
        def list(queries: nil, search: nil)

            path = '/users'

            params = {
                queries: queries,
                search: search,
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
        # @param [String] user_id User ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] phone Phone number. Format this number with a leading &#039;+&#039; and a country code, e.g., +16175551212.
        # @param [String] password Plain text user password. Must be at least 8 chars.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create(user_id:, email: nil, phone: nil, password: nil, name: nil)

            path = '/users'

            params = {
                userId: user_id,
                email: email,
                phone: phone,
                password: password,
                name: name,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end


            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::User
            )
        end

        
        # Create a new user. Password provided must be hashed with the
        # [Argon2](https://en.wikipedia.org/wiki/Argon2) algorithm. Use the [POST
        # /users](/docs/server/users#usersCreate) endpoint to create users with a
        # plain text password.
        #
        # @param [String] user_id User ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] password User password hashed using Argon2.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create_argon2_user(user_id:, email:, password:, name: nil)

            path = '/users/argon2'

            params = {
                userId: user_id,
                email: email,
                password: password,
                name: name,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email.nil?
                raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end


            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::User
            )
        end

        
        # Create a new user. Password provided must be hashed with the
        # [Bcrypt](https://en.wikipedia.org/wiki/Bcrypt) algorithm. Use the [POST
        # /users](/docs/server/users#usersCreate) endpoint to create users with a
        # plain text password.
        #
        # @param [String] user_id User ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] password User password hashed using Bcrypt.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create_bcrypt_user(user_id:, email:, password:, name: nil)

            path = '/users/bcrypt'

            params = {
                userId: user_id,
                email: email,
                password: password,
                name: name,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email.nil?
                raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end


            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::User
            )
        end

        
        # Create a new user. Password provided must be hashed with the
        # [MD5](https://en.wikipedia.org/wiki/MD5) algorithm. Use the [POST
        # /users](/docs/server/users#usersCreate) endpoint to create users with a
        # plain text password.
        #
        # @param [String] user_id User ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] password User password hashed using MD5.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create_md5_user(user_id:, email:, password:, name: nil)

            path = '/users/md5'

            params = {
                userId: user_id,
                email: email,
                password: password,
                name: name,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email.nil?
                raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end


            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::User
            )
        end

        
        # Create a new user. Password provided must be hashed with the
        # [PHPass](https://www.openwall.com/phpass/) algorithm. Use the [POST
        # /users](/docs/server/users#usersCreate) endpoint to create users with a
        # plain text password.
        #
        # @param [String] user_id User ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] password User password hashed using PHPass.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create_ph_pass_user(user_id:, email:, password:, name: nil)

            path = '/users/phpass'

            params = {
                userId: user_id,
                email: email,
                password: password,
                name: name,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email.nil?
                raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end


            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::User
            )
        end

        
        # Create a new user. Password provided must be hashed with the
        # [Scrypt](https://github.com/Tarsnap/scrypt) algorithm. Use the [POST
        # /users](/docs/server/users#usersCreate) endpoint to create users with a
        # plain text password.
        #
        # @param [String] user_id User ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
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

            path = '/users/scrypt'

            params = {
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
            
            headers = {
                "content-type": 'application/json',
            }
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


            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::User
            )
        end

        
        # Create a new user. Password provided must be hashed with the [Scrypt
        # Modified](https://gist.github.com/Meldiron/eecf84a0225eccb5a378d45bb27462cc)
        # algorithm. Use the [POST /users](/docs/server/users#usersCreate) endpoint
        # to create users with a plain text password.
        #
        # @param [String] user_id User ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] password User password hashed using Scrypt Modified.
        # @param [String] password_salt Salt used to hash password.
        # @param [String] password_salt_separator Salt separator used to hash password.
        # @param [String] password_signer_key Signer key used to hash password.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create_scrypt_modified_user(user_id:, email:, password:, password_salt:, password_salt_separator:, password_signer_key:, name: nil)

            path = '/users/scrypt-modified'

            params = {
                userId: user_id,
                email: email,
                password: password,
                passwordSalt: password_salt,
                passwordSaltSeparator: password_salt_separator,
                passwordSignerKey: password_signer_key,
                name: name,
            }
            
            headers = {
                "content-type": 'application/json',
            }
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


            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::User
            )
        end

        
        # Create a new user. Password provided must be hashed with the
        # [SHA](https://en.wikipedia.org/wiki/Secure_Hash_Algorithm) algorithm. Use
        # the [POST /users](/docs/server/users#usersCreate) endpoint to create users
        # with a plain text password.
        #
        # @param [String] user_id User ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] email User email.
        # @param [String] password User password hashed using SHA.
        # @param [String] password_version Optional SHA version used to hash password. Allowed values are: &#039;sha1&#039;, &#039;sha224&#039;, &#039;sha256&#039;, &#039;sha384&#039;, &#039;sha512/224&#039;, &#039;sha512/256&#039;, &#039;sha512&#039;, &#039;sha3-224&#039;, &#039;sha3-256&#039;, &#039;sha3-384&#039;, &#039;sha3-512&#039;
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def create_sha_user(user_id:, email:, password:, password_version: nil, name: nil)

            path = '/users/sha'

            params = {
                userId: user_id,
                email: email,
                password: password,
                passwordVersion: password_version,
                name: name,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email.nil?
                raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end


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
        # @param [String] user_id User ID.
        #
        # @return [User]
        def get(user_id:)

            path = '/users/{userId}'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

                .gsub('{userId}', user_id)

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::User
            )
        end

        
        # Delete a user by its unique ID, thereby releasing it's ID. Since ID is
        # released and can be reused, all user-related resources like documents or
        # storage files should be deleted before user deletion. If you want to keep
        # ID reserved, use the [updateStatus](/docs/server/users#usersUpdateStatus)
        # endpoint instead.
        #
        # @param [String] user_id User ID.
        #
        # @return []
        def delete(user_id:)

            path = '/users/{userId}'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

                .gsub('{userId}', user_id)

            @client.call(
                method: 'DELETE',
                path: path,
                headers: headers,
                params: params,
            )
        end

        
        # Update the user email by its unique ID.
        #
        # @param [String] user_id User ID.
        # @param [String] email User email.
        #
        # @return [User]
        def update_email(user_id:, email:)

            path = '/users/{userId}/email'

            params = {
                email: email,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email.nil?
                raise Appwrite::Exception.new('Missing required parameter: "email"')
            end

                .gsub('{userId}', user_id)

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
        # @param [String] user_id User ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Only supported methods are limit and offset
        #
        # @return [LogList]
        def get_logs(user_id:, queries: nil)

            path = '/users/{userId}/logs'

            params = {
                queries: queries,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

                .gsub('{userId}', user_id)

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::LogList
            )
        end

        
        # Get the user membership list by its unique ID.
        #
        # @param [String] user_id User ID.
        #
        # @return [MembershipList]
        def get_memberships(user_id:)

            path = '/users/{userId}/memberships'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

                .gsub('{userId}', user_id)

            @client.call(
                method: 'GET',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::MembershipList
            )
        end

        
        # Update the user name by its unique ID.
        #
        # @param [String] user_id User ID.
        # @param [String] name User name. Max length: 128 chars.
        #
        # @return [User]
        def update_name(user_id:, name:)

            path = '/users/{userId}/name'

            params = {
                name: name,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

                .gsub('{userId}', user_id)

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
        # @param [String] user_id User ID.
        # @param [String] password New user password. Must be at least 8 chars.
        #
        # @return [User]
        def update_password(user_id:, password:)

            path = '/users/{userId}/password'

            params = {
                password: password,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if password.nil?
                raise Appwrite::Exception.new('Missing required parameter: "password"')
            end

                .gsub('{userId}', user_id)

            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
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

            path = '/users/{userId}/phone'

            params = {
                number: number,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if number.nil?
                raise Appwrite::Exception.new('Missing required parameter: "number"')
            end

                .gsub('{userId}', user_id)

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
        # @param [String] user_id User ID.
        #
        # @return [Preferences]
        def get_prefs(user_id:)

            path = '/users/{userId}/prefs'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

                .gsub('{userId}', user_id)

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
        # @param [String] user_id User ID.
        # @param [Hash] prefs Prefs key-value JSON object.
        #
        # @return [Preferences]
        def update_prefs(user_id:, prefs:)

            path = '/users/{userId}/prefs'

            params = {
                prefs: prefs,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if prefs.nil?
                raise Appwrite::Exception.new('Missing required parameter: "prefs"')
            end

                .gsub('{userId}', user_id)

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
        # @param [String] user_id User ID.
        #
        # @return [SessionList]
        def get_sessions(user_id:)

            path = '/users/{userId}/sessions'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

                .gsub('{userId}', user_id)

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
        # @param [String] user_id User ID.
        #
        # @return []
        def delete_sessions(user_id:)

            path = '/users/{userId}/sessions'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

                .gsub('{userId}', user_id)

            @client.call(
                method: 'DELETE',
                path: path,
                headers: headers,
                params: params,
            )
        end

        
        # Delete a user sessions by its unique ID.
        #
        # @param [String] user_id User ID.
        # @param [String] session_id Session ID.
        #
        # @return []
        def delete_session(user_id:, session_id:)

            path = '/users/{userId}/sessions/{sessionId}'

            params = {
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if session_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "sessionId"')
            end

                .gsub('{userId}', user_id)
                .gsub('{sessionId}', session_id)

            @client.call(
                method: 'DELETE',
                path: path,
                headers: headers,
                params: params,
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

            path = '/users/{userId}/status'

            params = {
                status: status,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if status.nil?
                raise Appwrite::Exception.new('Missing required parameter: "status"')
            end

                .gsub('{userId}', user_id)

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
        # @param [String] user_id User ID.
        # @param [] email_verification User email verification status.
        #
        # @return [User]
        def update_email_verification(user_id:, email_verification:)

            path = '/users/{userId}/verification'

            params = {
                emailVerification: email_verification,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if email_verification.nil?
                raise Appwrite::Exception.new('Missing required parameter: "emailVerification"')
            end

                .gsub('{userId}', user_id)

            @client.call(
                method: 'PATCH',
                path: path,
                headers: headers,
                params: params,
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

            path = '/users/{userId}/verification/phone'

            params = {
                phoneVerification: phone_verification,
            }
            
            headers = {
                "content-type": 'application/json',
            }
            if user_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userId"')
            end

            if phone_verification.nil?
                raise Appwrite::Exception.new('Missing required parameter: "phoneVerification"')
            end

                .gsub('{userId}', user_id)

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