#frozen_string_literal: true

module Appwrite
    class Project < Service

        def initialize(client)
            @client = client
        end

        # Get a project.
        #
        #
        # @return [Project]
        def get()
            api_path = '/project'

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Delete a project.
        #
        #
        # @return []
        def delete()
            api_path = '/project'

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

        end

        # Update properties of a specific auth method. Use this endpoint to enable or
        # disable a method in your project. 
        #
        # @param [ProjectAuthMethodId] method_id Auth Method ID. Possible values: email-password,magic-url,email-otp,anonymous,invites,jwt,phone
        # @param [] enabled Auth method status.
        #
        # @return [Project]
        def update_auth_method(method_id:, enabled:)
            api_path = '/project/auth-methods/{methodId}'
                .gsub('{methodId}', method_id)

            if method_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "methodId"')
            end

            if enabled.nil?
              raise Appwrite::Exception.new('Missing required parameter: "enabled"')
            end

            api_params = {
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Get a list of all API keys from the current project.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: expire, accessedAt, name, scopes
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [KeyList]
        def list_keys(queries: nil, total: nil)
            api_path = '/project/keys'

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::KeyList
            )

        end

        # Create a new API key. It's recommended to have multiple API keys with
        # strict scopes for separate functions within your project.
        # 
        # You can also create an ephemeral API key if you need a short-lived key
        # instead.
        #
        # @param [String] key_id Key ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Key name. Max length: 128 chars.
        # @param [Array] scopes Key scopes list. Maximum of 100 scopes are allowed.
        # @param [String] expire Expiration time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. Use null for unlimited expiration.
        #
        # @return [Key]
        def create_key(key_id:, name:, scopes:, expire: nil)
            api_path = '/project/keys'

            if key_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "keyId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if scopes.nil?
              raise Appwrite::Exception.new('Missing required parameter: "scopes"')
            end

            api_params = {
                keyId: key_id,
                name: name,
                scopes: scopes,
                expire: expire,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Key
            )

        end

        # Create a new ephemeral API key. It's recommended to have multiple API keys
        # with strict scopes for separate functions within your project.
        # 
        # You can also create a standard API key if you need a longer-lived key
        # instead.
        #
        # @param [Array] scopes Key scopes list. Maximum of 100 scopes are allowed.
        # @param [Integer] duration Time in seconds before ephemeral key expires. Maximum duration is 3600 seconds.
        #
        # @return [EphemeralKey]
        def create_ephemeral_key(scopes:, duration:)
            api_path = '/project/keys/ephemeral'

            if scopes.nil?
              raise Appwrite::Exception.new('Missing required parameter: "scopes"')
            end

            if duration.nil?
              raise Appwrite::Exception.new('Missing required parameter: "duration"')
            end

            api_params = {
                scopes: scopes,
                duration: duration,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::EphemeralKey
            )

        end

        # Get a key by its unique ID. 
        #
        # @param [String] key_id Key ID.
        #
        # @return [Key]
        def get_key(key_id:)
            api_path = '/project/keys/{keyId}'
                .gsub('{keyId}', key_id)

            if key_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "keyId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Key
            )

        end

        # Update a key by its unique ID. Use this endpoint to update the name,
        # scopes, or expiration time of an API key.
        #
        # @param [String] key_id Key ID.
        # @param [String] name Key name. Max length: 128 chars.
        # @param [Array] scopes Key scopes list. Maximum of 100 scopes are allowed.
        # @param [String] expire Expiration time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. Use null for unlimited expiration.
        #
        # @return [Key]
        def update_key(key_id:, name:, scopes:, expire: nil)
            api_path = '/project/keys/{keyId}'
                .gsub('{keyId}', key_id)

            if key_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "keyId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if scopes.nil?
              raise Appwrite::Exception.new('Missing required parameter: "scopes"')
            end

            api_params = {
                name: name,
                scopes: scopes,
                expire: expire,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Key
            )

        end

        # Delete a key by its unique ID. Once deleted, the key can no longer be used
        # to authenticate API calls.
        #
        # @param [String] key_id Key ID.
        #
        # @return []
        def delete_key(key_id:)
            api_path = '/project/keys/{keyId}'
                .gsub('{keyId}', key_id)

            if key_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "keyId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

        end

        # Update the project labels. Labels can be used to easily filter projects in
        # an organization.
        #
        # @param [Array] labels Array of project labels. Replaces the previous labels. Maximum of 1000 labels are allowed, each up to 36 alphanumeric characters long.
        #
        # @return [Project]
        def update_labels(labels:)
            api_path = '/project/labels'

            if labels.nil?
              raise Appwrite::Exception.new('Missing required parameter: "labels"')
            end

            api_params = {
                labels: labels,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Get a list of all mock phones in the project. This endpoint returns an
        # array of all mock phones and their OTPs.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [MockNumberList]
        def list_mock_phones(queries: nil, total: nil)
            api_path = '/project/mock-phones'

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::MockNumberList
            )

        end

        # Create a new mock phone for your project. Use this endpoint to register a
        # mock phone number and its sign-in OTP for your testers.
        #
        # @param [String] number Phone number to associate with the mock phone. Must be a valid E.164 formatted phone number.
        # @param [String] otp One-time password (OTP) to associate with the mock phone. Must be a 6-digit numeric code.
        #
        # @return [MockNumber]
        def create_mock_phone(number:, otp:)
            api_path = '/project/mock-phones'

            if number.nil?
              raise Appwrite::Exception.new('Missing required parameter: "number"')
            end

            if otp.nil?
              raise Appwrite::Exception.new('Missing required parameter: "otp"')
            end

            api_params = {
                number: number,
                otp: otp,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::MockNumber
            )

        end

        # Get a mock phone by its unique number. This endpoint returns the mock
        # phone's OTP.
        #
        # @param [String] number Phone number associated with the mock phone. Must be a valid E.164 formatted phone number.
        #
        # @return [MockNumber]
        def get_mock_phone(number:)
            api_path = '/project/mock-phones/{number}'
                .gsub('{number}', number)

            if number.nil?
              raise Appwrite::Exception.new('Missing required parameter: "number"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::MockNumber
            )

        end

        # Update a mock phone by its unique number. Use this endpoint to update the
        # mock phone's OTP.
        #
        # @param [String] number Phone number associated with the mock phone. Must be a valid E.164 formatted phone number.
        # @param [String] otp One-time password (OTP) to associate with the mock phone. Must be a 6-digit numeric code.
        #
        # @return [MockNumber]
        def update_mock_phone(number:, otp:)
            api_path = '/project/mock-phones/{number}'
                .gsub('{number}', number)

            if number.nil?
              raise Appwrite::Exception.new('Missing required parameter: "number"')
            end

            if otp.nil?
              raise Appwrite::Exception.new('Missing required parameter: "otp"')
            end

            api_params = {
                otp: otp,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::MockNumber
            )

        end

        # Delete a mock phone by its unique number. This endpoint removes the mock
        # phone and its OTP configuration from the project.
        #
        # @param [String] number Phone number associated with the mock phone. Must be a valid E.164 formatted phone number.
        #
        # @return []
        def delete_mock_phone(number:)
            api_path = '/project/mock-phones/{number}'
                .gsub('{number}', number)

            if number.nil?
              raise Appwrite::Exception.new('Missing required parameter: "number"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

        end

        # Get a list of all OAuth2 providers supported by the server, along with the
        # project's configuration for each. Credential fields are write-only and
        # always returned empty.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [OAuth2ProviderList]
        def list_o_auth2_providers(queries: nil, total: nil)
            api_path = '/project/oauth2'

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2ProviderList
            )

        end

        # Update the OAuth2 server (OIDC provider) configuration.
        #
        # @param [] enabled Enable or disable the OAuth2 server.
        # @param [String] authorization_url URL to your application with consent screen.
        # @param [Array] scopes List of allowed OAuth2 scopes. Maximum of 100 scopes are allowed, each up to 128 characters long.
        # @param [Integer] access_token_duration Access token duration in seconds for confidential clients (server-side apps that authenticate with a client secret). Leave empty to use default 8 hours.
        # @param [Integer] refresh_token_duration Refresh token duration in seconds for confidential clients (server-side apps that authenticate with a client secret). Leave empty to use default 1 year.
        # @param [Integer] public_access_token_duration Access token duration in seconds for public clients (SPAs, mobile, and native apps that cannot keep a client secret). Leave empty to use default 1 hour.
        # @param [Integer] public_refresh_token_duration Refresh token duration in seconds for public clients (SPAs, mobile, and native apps that cannot keep a client secret). Leave empty to use default 30 days.
        # @param [] confidential_pkce When enabled, PKCE is required for confidential clients (server-side flows using client_secret). PKCE is always required for public clients regardless of this setting.
        #
        # @return [Project]
        def update_o_auth2_server(enabled:, authorization_url:, scopes: nil, access_token_duration: nil, refresh_token_duration: nil, public_access_token_duration: nil, public_refresh_token_duration: nil, confidential_pkce: nil)
            api_path = '/project/oauth2-server'

            if enabled.nil?
              raise Appwrite::Exception.new('Missing required parameter: "enabled"')
            end

            if authorization_url.nil?
              raise Appwrite::Exception.new('Missing required parameter: "authorizationUrl"')
            end

            api_params = {
                enabled: enabled,
                authorizationUrl: authorization_url,
                scopes: scopes,
                accessTokenDuration: access_token_duration,
                refreshTokenDuration: refresh_token_duration,
                publicAccessTokenDuration: public_access_token_duration,
                publicRefreshTokenDuration: public_refresh_token_duration,
                confidentialPkce: confidential_pkce,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Update the project OAuth2 Amazon configuration.
        #
        # @param [String] client_id 'Client ID' of Amazon OAuth2 app. For example: amzn1.application-oa2-client.87400c00000000000000000000063d5b2
        # @param [String] client_secret 'Client Secret' of Amazon OAuth2 app. For example: 79ffe4000000000000000000000000000000000000000000000000000002de55
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Amazon]
        def update_o_auth2_amazon(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/amazon'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Amazon
            )

        end

        # Update the project OAuth2 Apple configuration.
        #
        # @param [String] service_id 'Service ID' of Apple OAuth2 app. For example: ip.appwrite.app.web
        # @param [String] key_id 'Key ID' of Apple OAuth2 app. For example: P4000000N8
        # @param [String] team_id 'Team ID' of Apple OAuth2 app. For example: D4000000R6
        # @param [String] p8_file Contents of the Apple OAuth2 app .p8 private key file. The secret key wrapped by the PEM markers is 200 characters long. For example: -----BEGIN PRIVATE KEY-----MIGTAg...jy2Xbna-----END PRIVATE KEY-----
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Apple]
        def update_o_auth2_apple(service_id: nil, key_id: nil, team_id: nil, p8_file: nil, enabled: nil)
            api_path = '/project/oauth2/apple'

            api_params = {
                serviceId: service_id,
                keyId: key_id,
                teamId: team_id,
                p8File: p8_file,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Apple
            )

        end

        # Update the project OAuth2 Auth0 configuration.
        #
        # @param [String] client_id 'Client ID' of Auth0 OAuth2 app. For example: OaOkIA000000000000000000005KLSYq
        # @param [String] client_secret 'Client Secret' of Auth0 OAuth2 app. For example: zXz0000-00000000000000000000000000000-00000000000000000000PJafnF
        # @param [String] endpoint Domain of Auth0 instance. For example: example.us.auth0.com
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Auth0]
        def update_o_auth2_auth0(client_id: nil, client_secret: nil, endpoint: nil, enabled: nil)
            api_path = '/project/oauth2/auth0'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                endpoint: endpoint,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Auth0
            )

        end

        # Update the project OAuth2 Authentik configuration.
        #
        # @param [String] client_id 'Client ID' of Authentik OAuth2 app. For example: dTKOPa0000000000000000000000000000e7G8hv
        # @param [String] client_secret 'Client Secret' of Authentik OAuth2 app. For example: ntQadq000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000Hp5WK
        # @param [String] endpoint Domain of Authentik instance. For example: example.authentik.com
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Authentik]
        def update_o_auth2_authentik(client_id: nil, client_secret: nil, endpoint: nil, enabled: nil)
            api_path = '/project/oauth2/authentik'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                endpoint: endpoint,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Authentik
            )

        end

        # Update the project OAuth2 Autodesk configuration.
        #
        # @param [String] client_id 'Client ID' of Autodesk OAuth2 app. For example: 5zw90v00000000000000000000kVYXN7
        # @param [String] client_secret 'Client Secret' of Autodesk OAuth2 app. For example: 7I000000000000MW
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Autodesk]
        def update_o_auth2_autodesk(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/autodesk'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Autodesk
            )

        end

        # Update the project OAuth2 Bitbucket configuration.
        #
        # @param [String] key 'Key' of Bitbucket OAuth2 app. For example: Knt70000000000ByRc
        # @param [String] secret 'Secret' of Bitbucket OAuth2 app. For example: NMfLZJ00000000000000000000TLQdDx
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Bitbucket]
        def update_o_auth2_bitbucket(key: nil, secret: nil, enabled: nil)
            api_path = '/project/oauth2/bitbucket'

            api_params = {
                key: key,
                secret: secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Bitbucket
            )

        end

        # Update the project OAuth2 Bitly configuration.
        #
        # @param [String] client_id 'Client ID' of Bitly OAuth2 app. For example: d95151000000000000000000000000000067af9b
        # @param [String] client_secret 'Client Secret' of Bitly OAuth2 app. For example: a13e250000000000000000000000000000d73095
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Bitly]
        def update_o_auth2_bitly(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/bitly'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Bitly
            )

        end

        # Update the project OAuth2 Box configuration.
        #
        # @param [String] client_id 'Client ID' of Box OAuth2 app. For example: deglcs00000000000000000000x2og6y
        # @param [String] client_secret 'Client Secret' of Box OAuth2 app. For example: OKM1f100000000000000000000eshEif
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Box]
        def update_o_auth2_box(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/box'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Box
            )

        end

        # Update the project OAuth2 Dailymotion configuration.
        #
        # @param [String] api_key 'API Key' of Dailymotion OAuth2 app. For example: 07a9000000000000067f
        # @param [String] api_secret 'API Secret' of Dailymotion OAuth2 app. For example: a399a90000000000000000000000000000d90639
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Dailymotion]
        def update_o_auth2_dailymotion(api_key: nil, api_secret: nil, enabled: nil)
            api_path = '/project/oauth2/dailymotion'

            api_params = {
                apiKey: api_key,
                apiSecret: api_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Dailymotion
            )

        end

        # Update the project OAuth2 Discord configuration.
        #
        # @param [String] client_id 'Client ID' of Discord OAuth2 app. For example: 950722000000343754
        # @param [String] client_secret 'Client Secret' of Discord OAuth2 app. For example: YmPXnM000000000000000000002zFg5D
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Discord]
        def update_o_auth2_discord(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/discord'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Discord
            )

        end

        # Update the project OAuth2 Disqus configuration.
        #
        # @param [String] public_key 'Public Key, also known as API Key' of Disqus OAuth2 app. For example: cgegH70000000000000000000000000000000000000000000000000000Hr1nYX
        # @param [String] secret_key 'Secret Key, also known as API Secret' of Disqus OAuth2 app. For example: W7Bykj00000000000000000000000000000000000000000000000000003o43w9
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Disqus]
        def update_o_auth2_disqus(public_key: nil, secret_key: nil, enabled: nil)
            api_path = '/project/oauth2/disqus'

            api_params = {
                publicKey: public_key,
                secretKey: secret_key,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Disqus
            )

        end

        # Update the project OAuth2 Dropbox configuration.
        #
        # @param [String] app_key 'App Key' of Dropbox OAuth2 app. For example: jl000000000009t
        # @param [String] app_secret 'App Secret' of Dropbox OAuth2 app. For example: g200000000000vw
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Dropbox]
        def update_o_auth2_dropbox(app_key: nil, app_secret: nil, enabled: nil)
            api_path = '/project/oauth2/dropbox'

            api_params = {
                appKey: app_key,
                appSecret: app_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Dropbox
            )

        end

        # Update the project OAuth2 Etsy configuration.
        #
        # @param [String] key_string 'Keystring' of Etsy OAuth2 app. For example: nsgzxh0000000000008j85a2
        # @param [String] shared_secret 'Shared Secret' of Etsy OAuth2 app. For example: tp000000ru
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Etsy]
        def update_o_auth2_etsy(key_string: nil, shared_secret: nil, enabled: nil)
            api_path = '/project/oauth2/etsy'

            api_params = {
                keyString: key_string,
                sharedSecret: shared_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Etsy
            )

        end

        # Update the project OAuth2 Facebook configuration.
        #
        # @param [String] app_id 'App ID' of Facebook OAuth2 app. For example: 260600000007694
        # @param [String] app_secret 'App Secret' of Facebook OAuth2 app. For example: 2d0b2800000000000000000000d38af4
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Facebook]
        def update_o_auth2_facebook(app_id: nil, app_secret: nil, enabled: nil)
            api_path = '/project/oauth2/facebook'

            api_params = {
                appId: app_id,
                appSecret: app_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Facebook
            )

        end

        # Update the project OAuth2 Figma configuration.
        #
        # @param [String] client_id 'Client ID' of Figma OAuth2 app. For example: byay5H0000000000VtiI40
        # @param [String] client_secret 'Client Secret' of Figma OAuth2 app. For example: yEpOYn0000000000000000004iIsU5
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Figma]
        def update_o_auth2_figma(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/figma'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Figma
            )

        end

        # Update the project OAuth2 FusionAuth configuration.
        #
        # @param [String] client_id 'Client ID' of FusionAuth OAuth2 app. For example: b2222c00-0000-0000-0000-000000862097
        # @param [String] client_secret 'Client Secret' of FusionAuth OAuth2 app. For example: Jx4s0C0000000000000000000000000000000wGqLsc
        # @param [String] endpoint Domain of FusionAuth instance. For example: example.fusionauth.io
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2FusionAuth]
        def update_o_auth2_fusion_auth(client_id: nil, client_secret: nil, endpoint: nil, enabled: nil)
            api_path = '/project/oauth2/fusionauth'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                endpoint: endpoint,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2FusionAuth
            )

        end

        # Update the project OAuth2 GitHub configuration.
        #
        # @param [String] client_id 'OAuth2 app Client ID, or App ID' of GitHub OAuth2 app. For example: e4d87900000000540733. Example of wrong value: 370006
        # @param [String] client_secret 'Client Secret' of GitHub OAuth2 app. For example: 5e07c00000000000000000000000000000198bcc
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Github]
        def update_o_auth2_git_hub(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/github'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Github
            )

        end

        # Update the project OAuth2 Gitlab configuration.
        #
        # @param [String] application_id 'Application ID' of Gitlab OAuth2 app. For example: d41ffe0000000000000000000000000000000000000000000000000000d5e252
        # @param [String] secret 'Secret' of Gitlab OAuth2 app. For example: gloas-838cfa0000000000000000000000000000000000000000000000000000ecbb38
        # @param [String] endpoint Endpoint URL of self-hosted GitLab instance. For example: https://gitlab.com
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Gitlab]
        def update_o_auth2_gitlab(application_id: nil, secret: nil, endpoint: nil, enabled: nil)
            api_path = '/project/oauth2/gitlab'

            api_params = {
                applicationId: application_id,
                secret: secret,
                endpoint: endpoint,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Gitlab
            )

        end

        # Update the project OAuth2 Google configuration.
        #
        # @param [String] client_id 'Client ID' of Google OAuth2 app. For example: 120000000095-92ifjb00000000000000000000g7ijfb.apps.googleusercontent.com
        # @param [String] client_secret 'Client Secret' of Google OAuth2 app. For example: GOCSPX-2k8gsR0000000000000000VNahJj
        # @param [Array] prompt Array of Google OAuth2 prompt values. If "none" is included, it must be the only element. "none" means: don't display any authentication or consent screens. Must not be specified with other values. "consent" means: prompt the user for consent. "select_account" means: prompt the user to select an account.
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Google]
        def update_o_auth2_google(client_id: nil, client_secret: nil, prompt: nil, enabled: nil)
            api_path = '/project/oauth2/google'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                prompt: prompt,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Google
            )

        end

        # Update the project OAuth2 Keycloak configuration.
        #
        # @param [String] client_id 'Client ID' of Keycloak OAuth2 app. For example: appwrite-o0000000st-app
        # @param [String] client_secret 'Client Secret' of Keycloak OAuth2 app. For example: jdjrJd00000000000000000000HUsaZO
        # @param [String] endpoint Domain of Keycloak instance. For example: keycloak.example.com
        # @param [String] realm_name Keycloak realm name. For example: appwrite-realm
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Keycloak]
        def update_o_auth2_keycloak(client_id: nil, client_secret: nil, endpoint: nil, realm_name: nil, enabled: nil)
            api_path = '/project/oauth2/keycloak'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                endpoint: endpoint,
                realmName: realm_name,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Keycloak
            )

        end

        # Update the project OAuth2 Kick configuration.
        #
        # @param [String] client_id 'Client ID' of Kick OAuth2 app. For example: 01KQ7C00000000000001MFHS32
        # @param [String] client_secret 'Client Secret' of Kick OAuth2 app. For example: 34ac5600000000000000000000000000000000000000000000000000e830c8b
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Kick]
        def update_o_auth2_kick(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/kick'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Kick
            )

        end

        # Update the project OAuth2 Linkedin configuration.
        #
        # @param [String] client_id 'Client ID' of Linkedin OAuth2 app. For example: 770000000000dv
        # @param [String] primary_client_secret 'Primary Client Secret or Secondary Client Secret' of Linkedin OAuth2 app. For example: WPL_AP1.2Bf0000000000000./HtlYw==
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Linkedin]
        def update_o_auth2_linkedin(client_id: nil, primary_client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/linkedin'

            api_params = {
                clientId: client_id,
                primaryClientSecret: primary_client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Linkedin
            )

        end

        # Update the project OAuth2 Microsoft configuration.
        #
        # @param [String] application_id 'Entra ID Application ID, also known as Client ID' of Microsoft OAuth2 app. For example: 00001111-aaaa-2222-bbbb-3333cccc4444
        # @param [String] application_secret 'Entra ID Application Secret, also known as Client Secret' of Microsoft OAuth2 app. For example: A1bC2dE3fH4iJ5kL6mN7oP8qR9sT0u
        # @param [String] tenant Microsoft Entra ID tenant identifier. Use 'common', 'organizations', 'consumers' or a specific tenant ID. For example: common
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Microsoft]
        def update_o_auth2_microsoft(application_id: nil, application_secret: nil, tenant: nil, enabled: nil)
            api_path = '/project/oauth2/microsoft'

            api_params = {
                applicationId: application_id,
                applicationSecret: application_secret,
                tenant: tenant,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Microsoft
            )

        end

        # Update the project OAuth2 Notion configuration.
        #
        # @param [String] oauth_client_id 'OAuth Client ID' of Notion OAuth2 app. For example: 341d8700-0000-0000-0000-000000446ee3
        # @param [String] oauth_client_secret 'OAuth Client Secret' of Notion OAuth2 app. For example: secret_dLUr4b000000000000000000000000000000lFHAa9
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Notion]
        def update_o_auth2_notion(oauth_client_id: nil, oauth_client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/notion'

            api_params = {
                oauthClientId: oauth_client_id,
                oauthClientSecret: oauth_client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Notion
            )

        end

        # Update the project OAuth2 Oidc configuration.
        #
        # @param [String] client_id 'Client ID' of Oidc OAuth2 app. For example: qibI2x0000000000000000000000000006L2YFoG
        # @param [String] client_secret 'Client Secret' of Oidc OAuth2 app. For example: Ah68ed000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003qpcHV
        # @param [String] well_known_url OpenID Connect well-known configuration URL. When provided, authorization, token, and user info endpoints can be discovered automatically. For example: https://myoauth.com/.well-known/openid-configuration
        # @param [String] authorization_url OpenID Connect authorization endpoint URL. Required when wellKnownURL is not provided. For example: https://myoauth.com/oauth2/authorize
        # @param [String] token_url OpenID Connect token endpoint URL. Required when wellKnownURL is not provided. For example: https://myoauth.com/oauth2/token
        # @param [String] user_info_url OpenID Connect user info endpoint URL. Required when wellKnownURL is not provided. For example: https://myoauth.com/oauth2/userinfo
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Oidc]
        def update_o_auth2_oidc(client_id: nil, client_secret: nil, well_known_url: nil, authorization_url: nil, token_url: nil, user_info_url: nil, enabled: nil)
            api_path = '/project/oauth2/oidc'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                wellKnownURL: well_known_url,
                authorizationURL: authorization_url,
                tokenURL: token_url,
                userInfoURL: user_info_url,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Oidc
            )

        end

        # Update the project OAuth2 Okta configuration.
        #
        # @param [String] client_id 'Client ID' of Okta OAuth2 app. For example: 0oa00000000000000698
        # @param [String] client_secret 'Client Secret' of Okta OAuth2 app. For example: Kiq0000000000000000000000000000000000000-00000000000H2L5-3SJ-vRV
        # @param [String] domain Okta company domain. Required when enabling the provider. For example: trial-6400025.okta.com. Example of wrong value: trial-6400025-admin.okta.com, or https://trial-6400025.okta.com/
        # @param [String] authorization_server_id Custom Authorization Servers. Optional, can be left empty or unconfigured. For example: aus000000000000000h7z
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Okta]
        def update_o_auth2_okta(client_id: nil, client_secret: nil, domain: nil, authorization_server_id: nil, enabled: nil)
            api_path = '/project/oauth2/okta'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                domain: domain,
                authorizationServerId: authorization_server_id,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Okta
            )

        end

        # Update the project OAuth2 Paypal configuration.
        #
        # @param [String] client_id 'Client ID' of Paypal OAuth2 app. For example: AdhIEG7-000000000000-0000000000000000000000000000000-0000000000000000000000-2pyB
        # @param [String] secret_key 'Secret Key 1 or Secret Key 2' of Paypal OAuth2 app. For example: EH8KCXtew--000000000000000000000000000000000000000_C-1_5UP_000000000000000CB7KDp
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Paypal]
        def update_o_auth2_paypal(client_id: nil, secret_key: nil, enabled: nil)
            api_path = '/project/oauth2/paypal'

            api_params = {
                clientId: client_id,
                secretKey: secret_key,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Paypal
            )

        end

        # Update the project OAuth2 PaypalSandbox configuration.
        #
        # @param [String] client_id 'Client ID' of PaypalSandbox OAuth2 app. For example: AdhIEG7-000000000000-0000000000000000000000000000000-0000000000000000000000-2pyB
        # @param [String] secret_key 'Secret Key 1 or Secret Key 2' of PaypalSandbox OAuth2 app. For example: EH8KCXtew--000000000000000000000000000000000000000_C-1_5UP_000000000000000CB7KDp
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Paypal]
        def update_o_auth2_paypal_sandbox(client_id: nil, secret_key: nil, enabled: nil)
            api_path = '/project/oauth2/paypalSandbox'

            api_params = {
                clientId: client_id,
                secretKey: secret_key,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Paypal
            )

        end

        # Update the project OAuth2 Podio configuration.
        #
        # @param [String] client_id 'Client ID' of Podio OAuth2 app. For example: appwrite-o0000000st-app
        # @param [String] client_secret 'Client Secret' of Podio OAuth2 app. For example: Rn247T0000000000000000000000000000000000000000000000000000W2zWTN
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Podio]
        def update_o_auth2_podio(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/podio'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Podio
            )

        end

        # Update the project OAuth2 Salesforce configuration.
        #
        # @param [String] customer_key 'Consumer Key' of Salesforce OAuth2 app. For example: 3MVG9I0000000000000000000000000000000000000000000000000000000000000000000000000C5Aejq
        # @param [String] customer_secret 'Consumer Secret' of Salesforce OAuth2 app. For example: 3w000000000000e2
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Salesforce]
        def update_o_auth2_salesforce(customer_key: nil, customer_secret: nil, enabled: nil)
            api_path = '/project/oauth2/salesforce'

            api_params = {
                customerKey: customer_key,
                customerSecret: customer_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Salesforce
            )

        end

        # Update the project OAuth2 Slack configuration.
        #
        # @param [String] client_id 'Client ID' of Slack OAuth2 app. For example: 23000000089.15000000000023
        # @param [String] client_secret 'Client Secret' of Slack OAuth2 app. For example: 81656000000000000000000000f3d2fd
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Slack]
        def update_o_auth2_slack(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/slack'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Slack
            )

        end

        # Update the project OAuth2 Spotify configuration.
        #
        # @param [String] client_id 'Client ID' of Spotify OAuth2 app. For example: 6ec271000000000000000000009beace
        # @param [String] client_secret 'Client Secret' of Spotify OAuth2 app. For example: db068a000000000000000000008b5b9f
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Spotify]
        def update_o_auth2_spotify(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/spotify'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Spotify
            )

        end

        # Update the project OAuth2 Stripe configuration.
        #
        # @param [String] client_id 'Client ID' of Stripe OAuth2 app. For example: ca_UKibXX0000000000000000000006byvR
        # @param [String] api_secret_key 'API Secret Key' of Stripe OAuth2 app. For example: sk_51SfOd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000QGWYfp
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Stripe]
        def update_o_auth2_stripe(client_id: nil, api_secret_key: nil, enabled: nil)
            api_path = '/project/oauth2/stripe'

            api_params = {
                clientId: client_id,
                apiSecretKey: api_secret_key,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Stripe
            )

        end

        # Update the project OAuth2 Tradeshift configuration.
        #
        # @param [String] oauth2_client_id 'OAuth2 Client ID' of Tradeshift OAuth2 app. For example: appwrite-tes00000.0000000000est-app
        # @param [String] oauth2_client_secret 'OAuth2 Client Secret' of Tradeshift OAuth2 app. For example: 7cb52700-0000-0000-0000-000000ca5b83
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Tradeshift]
        def update_o_auth2_tradeshift(oauth2_client_id: nil, oauth2_client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/tradeshift'

            api_params = {
                oauth2ClientId: oauth2_client_id,
                oauth2ClientSecret: oauth2_client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Tradeshift
            )

        end

        # Update the project OAuth2 Tradeshift Sandbox configuration.
        #
        # @param [String] oauth2_client_id 'OAuth2 Client ID' of Tradeshift Sandbox OAuth2 app. For example: appwrite-tes00000.0000000000est-app
        # @param [String] oauth2_client_secret 'OAuth2 Client Secret' of Tradeshift Sandbox OAuth2 app. For example: 7cb52700-0000-0000-0000-000000ca5b83
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Tradeshift]
        def update_o_auth2_tradeshift_sandbox(oauth2_client_id: nil, oauth2_client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/tradeshiftBox'

            api_params = {
                oauth2ClientId: oauth2_client_id,
                oauth2ClientSecret: oauth2_client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Tradeshift
            )

        end

        # Update the project OAuth2 Twitch configuration.
        #
        # @param [String] client_id 'Client ID' of Twitch OAuth2 app. For example: vvi0in000000000000000000ikmt9p
        # @param [String] client_secret 'Client Secret' of Twitch OAuth2 app. For example: pmapue000000000000000000zylw3v
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Twitch]
        def update_o_auth2_twitch(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/twitch'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Twitch
            )

        end

        # Update the project OAuth2 WordPress configuration.
        #
        # @param [String] client_id 'Client ID' of WordPress OAuth2 app. For example: 130005
        # @param [String] client_secret 'Client Secret' of WordPress OAuth2 app. For example: PlBfJS0000000000000000000000000000000000000000000000000000EdUZJk
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2WordPress]
        def update_o_auth2_word_press(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/wordpress'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2WordPress
            )

        end

        # Update the project OAuth2 X configuration.
        #
        # @param [String] customer_key 'Customer Key' of X OAuth2 app. For example: slzZV0000000000000NFLaWT
        # @param [String] secret_key 'Secret Key' of X OAuth2 app. For example: tkEPkp00000000000000000000000000000000000000FTxbI9
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2X]
        def update_o_auth2_x(customer_key: nil, secret_key: nil, enabled: nil)
            api_path = '/project/oauth2/x'

            api_params = {
                customerKey: customer_key,
                secretKey: secret_key,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2X
            )

        end

        # Update the project OAuth2 Yahoo configuration.
        #
        # @param [String] client_id 'Client ID, also known as Customer Key' of Yahoo OAuth2 app. For example: dj0yJm000000000000000000000000000000000000000000000000000000000000000000000000000000000000Z4PWRm
        # @param [String] client_secret 'Client Secret, also known as Customer Secret' of Yahoo OAuth2 app. For example: cf978f0000000000000000000000000000c5e2e9
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Yahoo]
        def update_o_auth2_yahoo(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/yahoo'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Yahoo
            )

        end

        # Update the project OAuth2 Yandex configuration.
        #
        # @param [String] client_id 'Client ID' of Yandex OAuth2 app. For example: 6a8a6a0000000000000000000091483c
        # @param [String] client_secret 'Client Secret' of Yandex OAuth2 app. For example: bbf98500000000000000000000c75a63
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Yandex]
        def update_o_auth2_yandex(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/yandex'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Yandex
            )

        end

        # Update the project OAuth2 Zoho configuration.
        #
        # @param [String] client_id 'Client ID' of Zoho OAuth2 app. For example: 1000.83C178000000000000000000RPNX0B
        # @param [String] client_secret 'Client Secret' of Zoho OAuth2 app. For example: fb5cac000000000000000000000000000000a68f6e
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Zoho]
        def update_o_auth2_zoho(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/zoho'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Zoho
            )

        end

        # Update the project OAuth2 Zoom configuration.
        #
        # @param [String] client_id 'Client ID' of Zoom OAuth2 app. For example: QMAC00000000000000w0AQ
        # @param [String] client_secret 'Client Secret' of Zoom OAuth2 app. For example: GAWsG4000000000000000000007U01ON
        # @param [] enabled OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.
        #
        # @return [OAuth2Zoom]
        def update_o_auth2_zoom(client_id: nil, client_secret: nil, enabled: nil)
            api_path = '/project/oauth2/zoom'

            api_params = {
                clientId: client_id,
                clientSecret: client_secret,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::OAuth2Zoom
            )

        end

        # Get a single OAuth2 provider configuration. Credential fields (client
        # secret, p8 file, key/team IDs) are write-only and always returned empty.
        #
        # @param [ProjectOAuthProviderId] provider_id OAuth2 provider key. For example: github, google, apple.
        #
        # @return [OAuth2Github, OAuth2Discord, OAuth2Figma, OAuth2Dropbox, OAuth2Dailymotion, OAuth2Bitbucket, OAuth2Bitly, OAuth2Box, OAuth2Autodesk, OAuth2Google, OAuth2Zoom, OAuth2Zoho, OAuth2Yandex, OAuth2X, OAuth2WordPress, OAuth2Twitch, OAuth2Stripe, OAuth2Spotify, OAuth2Slack, OAuth2Podio, OAuth2Notion, OAuth2Salesforce, OAuth2Yahoo, OAuth2Linkedin, OAuth2Disqus, OAuth2Amazon, OAuth2Etsy, OAuth2Facebook, OAuth2Tradeshift, OAuth2Paypal, OAuth2Gitlab, OAuth2Authentik, OAuth2Auth0, OAuth2FusionAuth, OAuth2Keycloak, OAuth2Oidc, OAuth2Apple, OAuth2Okta, OAuth2Kick, OAuth2Microsoft]
        def get_o_auth2_provider(provider_id:)
            api_path = '/project/oauth2/{providerId}'
                .gsub('{providerId}', provider_id)

            if provider_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "providerId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            response = @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

            unless response.is_a?(Hash)
                raise Exception, "Expected object response when hydrating a response model"
            end

            if response['$id'] == 'github'

                return Models::OAuth2Github.from(map: response)
            end

            if response['$id'] == 'discord'

                return Models::OAuth2Discord.from(map: response)
            end

            if response['$id'] == 'figma'

                return Models::OAuth2Figma.from(map: response)
            end

            if response['$id'] == 'dropbox'

                return Models::OAuth2Dropbox.from(map: response)
            end

            if response['$id'] == 'dailymotion'

                return Models::OAuth2Dailymotion.from(map: response)
            end

            if response['$id'] == 'bitbucket'

                return Models::OAuth2Bitbucket.from(map: response)
            end

            if response['$id'] == 'bitly'

                return Models::OAuth2Bitly.from(map: response)
            end

            if response['$id'] == 'box'

                return Models::OAuth2Box.from(map: response)
            end

            if response['$id'] == 'autodesk'

                return Models::OAuth2Autodesk.from(map: response)
            end

            if response['$id'] == 'google'

                return Models::OAuth2Google.from(map: response)
            end

            if response['$id'] == 'zoom'

                return Models::OAuth2Zoom.from(map: response)
            end

            if response['$id'] == 'zoho'

                return Models::OAuth2Zoho.from(map: response)
            end

            if response['$id'] == 'yandex'

                return Models::OAuth2Yandex.from(map: response)
            end

            if response['$id'] == 'x'

                return Models::OAuth2X.from(map: response)
            end

            if response['$id'] == 'wordpress'

                return Models::OAuth2WordPress.from(map: response)
            end

            if response['$id'] == 'twitch'

                return Models::OAuth2Twitch.from(map: response)
            end

            if response['$id'] == 'stripe'

                return Models::OAuth2Stripe.from(map: response)
            end

            if response['$id'] == 'spotify'

                return Models::OAuth2Spotify.from(map: response)
            end

            if response['$id'] == 'slack'

                return Models::OAuth2Slack.from(map: response)
            end

            if response['$id'] == 'podio'

                return Models::OAuth2Podio.from(map: response)
            end

            if response['$id'] == 'notion'

                return Models::OAuth2Notion.from(map: response)
            end

            if response['$id'] == 'salesforce'

                return Models::OAuth2Salesforce.from(map: response)
            end

            if response['$id'] == 'yahoo'

                return Models::OAuth2Yahoo.from(map: response)
            end

            if response['$id'] == 'linkedin'

                return Models::OAuth2Linkedin.from(map: response)
            end

            if response['$id'] == 'disqus'

                return Models::OAuth2Disqus.from(map: response)
            end

            if response['$id'] == 'amazon'

                return Models::OAuth2Amazon.from(map: response)
            end

            if response['$id'] == 'etsy'

                return Models::OAuth2Etsy.from(map: response)
            end

            if response['$id'] == 'facebook'

                return Models::OAuth2Facebook.from(map: response)
            end

            if response['$id'] == 'tradeshiftBox'

                return Models::OAuth2Tradeshift.from(map: response)
            end

            if response['$id'] == 'paypalSandbox'

                return Models::OAuth2Paypal.from(map: response)
            end

            if response['$id'] == 'gitlab'

                return Models::OAuth2Gitlab.from(map: response)
            end

            if response['$id'] == 'authentik'

                return Models::OAuth2Authentik.from(map: response)
            end

            if response['$id'] == 'auth0'

                return Models::OAuth2Auth0.from(map: response)
            end

            if response['$id'] == 'fusionauth'

                return Models::OAuth2FusionAuth.from(map: response)
            end

            if response['$id'] == 'keycloak'

                return Models::OAuth2Keycloak.from(map: response)
            end

            if response['$id'] == 'oidc'

                return Models::OAuth2Oidc.from(map: response)
            end

            if response['$id'] == 'apple'

                return Models::OAuth2Apple.from(map: response)
            end

            if response['$id'] == 'okta'

                return Models::OAuth2Okta.from(map: response)
            end

            if response['$id'] == 'kick'

                return Models::OAuth2Kick.from(map: response)
            end

            if response['$id'] == 'microsoft'

                return Models::OAuth2Microsoft.from(map: response)
            end

            raise Exception, "Unable to match response to any expected response model"

        end

        # Get a list of all platforms in the project. This endpoint returns an array
        # of all platforms and their configurations.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: type, name, hostname, bundleIdentifier, applicationId, packageIdentifierName, packageName
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [PlatformList]
        def list_platforms(queries: nil, total: nil)
            api_path = '/project/platforms'

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::PlatformList
            )

        end

        # Create a new Android platform for your project. Use this endpoint to
        # register a new Android platform where your users will run your application
        # which will interact with the Appwrite API.
        #
        # @param [String] platform_id Platform ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Platform name. Max length: 128 chars.
        # @param [String] application_id Android application ID. Max length: 256 chars.
        #
        # @return [PlatformAndroid]
        def create_android_platform(platform_id:, name:, application_id:)
            api_path = '/project/platforms/android'

            if platform_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "platformId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if application_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "applicationId"')
            end

            api_params = {
                platformId: platform_id,
                name: name,
                applicationId: application_id,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::PlatformAndroid
            )

        end

        # Update an Android platform by its unique ID. Use this endpoint to update
        # the platform's name or application ID.
        #
        # @param [String] platform_id Platform ID.
        # @param [String] name Platform name. Max length: 128 chars.
        # @param [String] application_id Android application ID. Max length: 256 chars.
        #
        # @return [PlatformAndroid]
        def update_android_platform(platform_id:, name:, application_id:)
            api_path = '/project/platforms/android/{platformId}'
                .gsub('{platformId}', platform_id)

            if platform_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "platformId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if application_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "applicationId"')
            end

            api_params = {
                name: name,
                applicationId: application_id,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::PlatformAndroid
            )

        end

        # Create a new Apple platform for your project. Use this endpoint to register
        # a new Apple platform where your users will run your application which will
        # interact with the Appwrite API.
        #
        # @param [String] platform_id Platform ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Platform name. Max length: 128 chars.
        # @param [String] bundle_identifier Apple bundle identifier. Max length: 256 chars.
        #
        # @return [PlatformApple]
        def create_apple_platform(platform_id:, name:, bundle_identifier:)
            api_path = '/project/platforms/apple'

            if platform_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "platformId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if bundle_identifier.nil?
              raise Appwrite::Exception.new('Missing required parameter: "bundleIdentifier"')
            end

            api_params = {
                platformId: platform_id,
                name: name,
                bundleIdentifier: bundle_identifier,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::PlatformApple
            )

        end

        # Update an Apple platform by its unique ID. Use this endpoint to update the
        # platform's name or bundle identifier.
        #
        # @param [String] platform_id Platform ID.
        # @param [String] name Platform name. Max length: 128 chars.
        # @param [String] bundle_identifier Apple bundle identifier. Max length: 256 chars.
        #
        # @return [PlatformApple]
        def update_apple_platform(platform_id:, name:, bundle_identifier:)
            api_path = '/project/platforms/apple/{platformId}'
                .gsub('{platformId}', platform_id)

            if platform_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "platformId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if bundle_identifier.nil?
              raise Appwrite::Exception.new('Missing required parameter: "bundleIdentifier"')
            end

            api_params = {
                name: name,
                bundleIdentifier: bundle_identifier,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::PlatformApple
            )

        end

        # Create a new Linux platform for your project. Use this endpoint to register
        # a new Linux platform where your users will run your application which will
        # interact with the Appwrite API.
        #
        # @param [String] platform_id Platform ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Platform name. Max length: 128 chars.
        # @param [String] package_name Linux package name. Max length: 256 chars.
        #
        # @return [PlatformLinux]
        def create_linux_platform(platform_id:, name:, package_name:)
            api_path = '/project/platforms/linux'

            if platform_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "platformId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if package_name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "packageName"')
            end

            api_params = {
                platformId: platform_id,
                name: name,
                packageName: package_name,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::PlatformLinux
            )

        end

        # Update a Linux platform by its unique ID. Use this endpoint to update the
        # platform's name or package name.
        #
        # @param [String] platform_id Platform ID.
        # @param [String] name Platform name. Max length: 128 chars.
        # @param [String] package_name Linux package name. Max length: 256 chars.
        #
        # @return [PlatformLinux]
        def update_linux_platform(platform_id:, name:, package_name:)
            api_path = '/project/platforms/linux/{platformId}'
                .gsub('{platformId}', platform_id)

            if platform_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "platformId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if package_name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "packageName"')
            end

            api_params = {
                name: name,
                packageName: package_name,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::PlatformLinux
            )

        end

        # Create a new web platform for your project. Use this endpoint to register a
        # new platform where your users will run your application which will interact
        # with the Appwrite API.
        #
        # @param [String] platform_id Platform ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Platform name. Max length: 128 chars.
        # @param [String] hostname Platform web hostname. Max length: 256 chars.
        #
        # @return [PlatformWeb]
        def create_web_platform(platform_id:, name:, hostname:)
            api_path = '/project/platforms/web'

            if platform_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "platformId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if hostname.nil?
              raise Appwrite::Exception.new('Missing required parameter: "hostname"')
            end

            api_params = {
                platformId: platform_id,
                name: name,
                hostname: hostname,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::PlatformWeb
            )

        end

        # Update a web platform by its unique ID. Use this endpoint to update the
        # platform's name or hostname.
        #
        # @param [String] platform_id Platform ID.
        # @param [String] name Platform name. Max length: 128 chars.
        # @param [String] hostname Platform web hostname. Max length: 256 chars.
        #
        # @return [PlatformWeb]
        def update_web_platform(platform_id:, name:, hostname:)
            api_path = '/project/platforms/web/{platformId}'
                .gsub('{platformId}', platform_id)

            if platform_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "platformId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if hostname.nil?
              raise Appwrite::Exception.new('Missing required parameter: "hostname"')
            end

            api_params = {
                name: name,
                hostname: hostname,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::PlatformWeb
            )

        end

        # Create a new Windows platform for your project. Use this endpoint to
        # register a new Windows platform where your users will run your application
        # which will interact with the Appwrite API.
        #
        # @param [String] platform_id Platform ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Platform name. Max length: 128 chars.
        # @param [String] package_identifier_name Windows package identifier name. Max length: 256 chars.
        #
        # @return [PlatformWindows]
        def create_windows_platform(platform_id:, name:, package_identifier_name:)
            api_path = '/project/platforms/windows'

            if platform_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "platformId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if package_identifier_name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "packageIdentifierName"')
            end

            api_params = {
                platformId: platform_id,
                name: name,
                packageIdentifierName: package_identifier_name,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::PlatformWindows
            )

        end

        # Update a Windows platform by its unique ID. Use this endpoint to update the
        # platform's name or package identifier name.
        #
        # @param [String] platform_id Platform ID.
        # @param [String] name Platform name. Max length: 128 chars.
        # @param [String] package_identifier_name Windows package identifier name. Max length: 256 chars.
        #
        # @return [PlatformWindows]
        def update_windows_platform(platform_id:, name:, package_identifier_name:)
            api_path = '/project/platforms/windows/{platformId}'
                .gsub('{platformId}', platform_id)

            if platform_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "platformId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if package_identifier_name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "packageIdentifierName"')
            end

            api_params = {
                name: name,
                packageIdentifierName: package_identifier_name,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::PlatformWindows
            )

        end

        # Get a platform by its unique ID. This endpoint returns the platform's
        # details, including its name, type, and key configurations.
        #
        # @param [String] platform_id Platform ID.
        #
        # @return [PlatformWeb, PlatformApple, PlatformAndroid, PlatformWindows, PlatformLinux]
        def get_platform(platform_id:)
            api_path = '/project/platforms/{platformId}'
                .gsub('{platformId}', platform_id)

            if platform_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "platformId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            response = @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

            unless response.is_a?(Hash)
                raise Exception, "Expected object response when hydrating a response model"
            end

            if response['type'] == 'web'

                return Models::PlatformWeb.from(map: response)
            end

            if response['type'] == 'apple'

                return Models::PlatformApple.from(map: response)
            end

            if response['type'] == 'android'

                return Models::PlatformAndroid.from(map: response)
            end

            if response['type'] == 'windows'

                return Models::PlatformWindows.from(map: response)
            end

            if response['type'] == 'linux'

                return Models::PlatformLinux.from(map: response)
            end

            raise Exception, "Unable to match response to any expected response model"

        end

        # Delete a platform by its unique ID. This endpoint removes the platform and
        # all its configurations from the project.
        #
        # @param [String] platform_id Platform ID.
        #
        # @return []
        def delete_platform(platform_id:)
            api_path = '/project/platforms/{platformId}'
                .gsub('{platformId}', platform_id)

            if platform_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "platformId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

        end

        # Get a list of all project policies and their current configuration.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [PolicyList]
        def list_policies(queries: nil, total: nil)
            api_path = '/project/policies'

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::PolicyList
            )

        end

        # Configures if aliased emails such as subaddresses and emails with suffixes
        # are denied during new users sign-ups and email updates.
        #
        # @param [] enabled Set whether or not to block aliased emails during signup and email updates.
        #
        # @return [Project]
        def update_deny_aliased_email_policy(enabled:)
            api_path = '/project/policies/deny-aliased-email'

            if enabled.nil?
              raise Appwrite::Exception.new('Missing required parameter: "enabled"')
            end

            api_params = {
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Configures if disposable emails from known temporary domains are denied
        # during new users sign-ups and email updates.
        #
        # @param [] enabled Set whether or not to block disposable email addresses during signup and email updates.
        #
        # @return [Project]
        def update_deny_disposable_email_policy(enabled:)
            api_path = '/project/policies/deny-disposable-email'

            if enabled.nil?
              raise Appwrite::Exception.new('Missing required parameter: "enabled"')
            end

            api_params = {
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Configures if emails from free providers such as Gmail or Yahoo are denied
        # during new users sign-ups and email updates.
        #
        # @param [] enabled Set whether or not to block free email addresses during signup and email updates.
        #
        # @return [Project]
        def update_deny_free_email_policy(enabled:)
            api_path = '/project/policies/deny-free-email'

            if enabled.nil?
              raise Appwrite::Exception.new('Missing required parameter: "enabled"')
            end

            api_params = {
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Updating this policy allows you to control if team members can see other
        # members information. When enabled, all team members can see ID, name,
        # email, phone number, and MFA status of other members..
        #
        # @param [] user_id Set to true if you want make user ID visible to all team members, or false to hide it.
        # @param [] user_email Set to true if you want make user email visible to all team members, or false to hide it.
        # @param [] user_phone Set to true if you want make user phone number visible to all team members, or false to hide it.
        # @param [] user_name Set to true if you want make user name visible to all team members, or false to hide it.
        # @param [] user_mfa Set to true if you want make user MFA status visible to all team members, or false to hide it.
        #
        # @return [Project]
        def update_membership_privacy_policy(user_id: nil, user_email: nil, user_phone: nil, user_name: nil, user_mfa: nil)
            api_path = '/project/policies/membership-privacy'

            api_params = {
                userId: user_id,
                userEmail: user_email,
                userPhone: user_phone,
                userName: user_name,
                userMFA: user_mfa,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Updating this policy allows you to control if new passwords are checked
        # against most common passwords dictionary. When enabled, and user changes
        # their password, password must not be contained in the dictionary.
        #
        # @param [] enabled Toggle password dictionary policy. Set to true if you want password change to block passwords in the dictionary, or false to allow them. When changing this policy, existing passwords remain valid.
        #
        # @return [Project]
        def update_password_dictionary_policy(enabled:)
            api_path = '/project/policies/password-dictionary'

            if enabled.nil?
              raise Appwrite::Exception.new('Missing required parameter: "enabled"')
            end

            api_params = {
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Updates one of password strength policies. Based on total length
        # configured, previous password hashes are stored, and users cannot choose a
        # new password that is already stored in the passwird history list, when
        # updating an user password, or setting new one through password recovery.
        # 
        # Keep in mind, while password history policy is disabled, the history is not
        # being stored. Enabling the policy will not have any history on existing
        # users, and it will only start to collect and enforce the policy on password
        # changes since the policy is enabled.
        #
        # @param [Integer] total Set the password history length per user. Value can be between 1 and 5000, or null to disable the limit.
        #
        # @return [Project]
        def update_password_history_policy(total:)
            api_path = '/project/policies/password-history'

            if total.nil?
              raise Appwrite::Exception.new('Missing required parameter: "total"')
            end

            api_params = {
                total: total,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Updating this policy allows you to control if password strength is checked
        # against personal data. When enabled, and user sets or changes their
        # password, the password must not contain user ID, name, email or phone
        # number.
        #
        # @param [] enabled Toggle password personal data policy. Set to true if you want to block passwords including user's personal data, or false to allow it. When changing this policy, existing passwords remain valid.
        #
        # @return [Project]
        def update_password_personal_data_policy(enabled:)
            api_path = '/project/policies/password-personal-data'

            if enabled.nil?
              raise Appwrite::Exception.new('Missing required parameter: "enabled"')
            end

            api_params = {
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Update the password strength requirements for users in the project.
        #
        # @param [Integer] min Minimum password length. Value must be between 8 and 256. Default is 8.
        # @param [] uppercase Whether passwords must include at least one uppercase letter.
        # @param [] lowercase Whether passwords must include at least one lowercase letter.
        # @param [] number Whether passwords must include at least one number.
        # @param [] symbols Whether passwords must include at least one symbol.
        #
        # @return [PolicyPasswordStrength]
        def update_password_strength_policy(min: nil, uppercase: nil, lowercase: nil, number: nil, symbols: nil)
            api_path = '/project/policies/password-strength'

            api_params = {
                min: min,
                uppercase: uppercase,
                lowercase: lowercase,
                number: number,
                symbols: symbols,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::PolicyPasswordStrength
            )

        end

        # Updating this policy allows you to control if email alert is sent upon
        # session creation. When enabled, and user signs into their account, they
        # will be sent an email notification. There is an exception, the first
        # session after a new sign up does not trigger an alert, even if the policy
        # is enabled.
        #
        # @param [] enabled Toggle session alert policy. Set to true if you want users to receive email notifications when a sessions are created for their users, or false to not send email alerts.
        #
        # @return [Project]
        def update_session_alert_policy(enabled:)
            api_path = '/project/policies/session-alert'

            if enabled.nil?
              raise Appwrite::Exception.new('Missing required parameter: "enabled"')
            end

            api_params = {
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Update maximum duration how long sessions created within a project should
        # stay active for.
        #
        # @param [Integer] duration Maximum session length in seconds. Minium allowed value is 5 second, and maximum is 1 year, which is 31536000 seconds.
        #
        # @return [Project]
        def update_session_duration_policy(duration:)
            api_path = '/project/policies/session-duration'

            if duration.nil?
              raise Appwrite::Exception.new('Missing required parameter: "duration"')
            end

            api_params = {
                duration: duration,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Updating this policy allows you to control if existing sessions should be
        # invalidated when a password of a user is changed. When enabled, and user
        # changes their password, they will be logged out of all their devices.
        #
        # @param [] enabled Toggle session invalidation policy. Set to true if you want password change to invalidate all sessions of an user, or false to keep sessions active.
        #
        # @return [Project]
        def update_session_invalidation_policy(enabled:)
            api_path = '/project/policies/session-invalidation'

            if enabled.nil?
              raise Appwrite::Exception.new('Missing required parameter: "enabled"')
            end

            api_params = {
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Update the maximum number of sessions allowed per user. When the limit is
        # hit, the oldest session will be deleted to make room for new one.
        #
        # @param [Integer] total Set the maximum number of sessions allowed per user. Value can be between 1 and 5000, or null to disable the limit.
        #
        # @return [Project]
        def update_session_limit_policy(total:)
            api_path = '/project/policies/session-limit'

            if total.nil?
              raise Appwrite::Exception.new('Missing required parameter: "total"')
            end

            api_params = {
                total: total,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Update the maximum number of users in the project. When the limit is hit or
        # amount of existing users already exceeded the limit, all users remain
        # active, but new user sign up will be prohibited.
        #
        # @param [Integer] total Set the maximum number of users allowed in the project. Value can be between 1 and 5000, or null to disable the limit.
        #
        # @return [Project]
        def update_user_limit_policy(total:)
            api_path = '/project/policies/user-limit'

            if total.nil?
              raise Appwrite::Exception.new('Missing required parameter: "total"')
            end

            api_params = {
                total: total,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Get a policy by its unique ID. This endpoint returns the current
        # configuration for the requested project policy.
        #
        # @param [ProjectPolicyId] policy_id Policy ID. Can be one of: password-dictionary, password-history, password-strength, password-personal-data, session-alert, session-duration, session-invalidation, session-limit, user-limit, membership-privacy, deny-aliased-email, deny-disposable-email, deny-free-email.
        #
        # @return [PolicyPasswordDictionary, PolicyPasswordHistory, PolicyPasswordStrength, PolicyPasswordPersonalData, PolicySessionAlert, PolicySessionDuration, PolicySessionInvalidation, PolicySessionLimit, PolicyUserLimit, PolicyMembershipPrivacy, PolicyDenyAliasedEmail, PolicyDenyDisposableEmail, PolicyDenyFreeEmail]
        def get_policy(policy_id:)
            api_path = '/project/policies/{policyId}'
                .gsub('{policyId}', policy_id)

            if policy_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "policyId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            response = @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

            unless response.is_a?(Hash)
                raise Exception, "Expected object response when hydrating a response model"
            end

            if response['$id'] == 'password-dictionary'

                return Models::PolicyPasswordDictionary.from(map: response)
            end

            if response['$id'] == 'password-history'

                return Models::PolicyPasswordHistory.from(map: response)
            end

            if response['$id'] == 'password-strength'

                return Models::PolicyPasswordStrength.from(map: response)
            end

            if response['$id'] == 'password-personal-data'

                return Models::PolicyPasswordPersonalData.from(map: response)
            end

            if response['$id'] == 'session-alert'

                return Models::PolicySessionAlert.from(map: response)
            end

            if response['$id'] == 'session-duration'

                return Models::PolicySessionDuration.from(map: response)
            end

            if response['$id'] == 'session-invalidation'

                return Models::PolicySessionInvalidation.from(map: response)
            end

            if response['$id'] == 'session-limit'

                return Models::PolicySessionLimit.from(map: response)
            end

            if response['$id'] == 'user-limit'

                return Models::PolicyUserLimit.from(map: response)
            end

            if response['$id'] == 'membership-privacy'

                return Models::PolicyMembershipPrivacy.from(map: response)
            end

            if response['$id'] == 'deny-aliased-email'

                return Models::PolicyDenyAliasedEmail.from(map: response)
            end

            if response['$id'] == 'deny-disposable-email'

                return Models::PolicyDenyDisposableEmail.from(map: response)
            end

            if response['$id'] == 'deny-free-email'

                return Models::PolicyDenyFreeEmail.from(map: response)
            end

            raise Exception, "Unable to match response to any expected response model"

        end

        # Update properties of a specific protocol. Use this endpoint to enable or
        # disable a protocol in your project. 
        #
        # @param [ProjectProtocolId] protocol_id Protocol name. Can be one of: rest, graphql, websocket
        # @param [] enabled Protocol status.
        #
        # @return [Project]
        def update_protocol(protocol_id:, enabled:)
            api_path = '/project/protocols/{protocolId}'
                .gsub('{protocolId}', protocol_id)

            if protocol_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "protocolId"')
            end

            if enabled.nil?
              raise Appwrite::Exception.new('Missing required parameter: "enabled"')
            end

            api_params = {
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Update properties of a specific service. Use this endpoint to enable or
        # disable a service in your project. 
        #
        # @param [ProjectServiceId] service_id Service name. Can be one of: account, avatars, databases, tablesdb, locale, health, project, storage, teams, users, vcs, sites, functions, proxy, graphql, migrations, messaging, advisor
        # @param [] enabled Service status.
        #
        # @return [Project]
        def update_service(service_id:, enabled:)
            api_path = '/project/services/{serviceId}'
                .gsub('{serviceId}', service_id)

            if service_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "serviceId"')
            end

            if enabled.nil?
              raise Appwrite::Exception.new('Missing required parameter: "enabled"')
            end

            api_params = {
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Update the SMTP configuration for your project. Use this endpoint to
        # configure your project's SMTP provider with your custom settings for
        # sending transactional emails.
        #
        # @param [String] host SMTP server hostname (domain)
        # @param [Integer] port SMTP server port
        # @param [String] username SMTP server username. Pass an empty string to clear a previously set value.
        # @param [String] password SMTP server password. Pass an empty string to clear a previously set value. This property is stored securely and cannot be read in future (write-only).
        # @param [String] sender_email Email address shown in inbox as the sender of the email. Pass an empty string to clear a previously set value.
        # @param [String] sender_name Name shown in inbox as the sender of the email. Pass an empty string to clear a previously set value.
        # @param [String] reply_to_email Email used when user replies to the email. Pass an empty string to clear a previously set value.
        # @param [String] reply_to_name Name used when user replies to the email. Pass an empty string to clear a previously set value.
        # @param [ProjectSMTPSecure] secure Configures if communication with SMTP server is encrypted. Allowed values are: tls, ssl. Leave empty for no encryption.
        # @param [] enabled Enable or disable custom SMTP. Custom SMTP is useful for branding purposes, but also allows use of custom email templates.
        #
        # @return [Project]
        def update_smtp(host: nil, port: nil, username: nil, password: nil, sender_email: nil, sender_name: nil, reply_to_email: nil, reply_to_name: nil, secure: nil, enabled: nil)
            api_path = '/project/smtp'

            api_params = {
                host: host,
                port: port,
                username: username,
                password: password,
                senderEmail: sender_email,
                senderName: sender_name,
                replyToEmail: reply_to_email,
                replyToName: reply_to_name,
                secure: secure,
                enabled: enabled,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Project
            )

        end

        # Send a test email to verify SMTP configuration. 
        #
        # @param [Array] emails Array of emails to send test email to. Maximum of 10 emails are allowed.
        #
        # @return []
        def create_smtp_test(emails:)
            api_path = '/project/smtp/tests'

            if emails.nil?
              raise Appwrite::Exception.new('Missing required parameter: "emails"')
            end

            api_params = {
                emails: emails,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

        end

        # Get a list of all custom email templates configured for the project. This
        # endpoint returns an array of all configured email templates and their
        # locales.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [EmailTemplateList]
        def list_email_templates(queries: nil, total: nil)
            api_path = '/project/templates/email'

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::EmailTemplateList
            )

        end

        # Update a custom email template for the specified locale and type. Use this
        # endpoint to modify the content of your email templates.
        #
        # @param [ProjectEmailTemplateId] template_id Custom email template type. Can be one of: verification, magicSession, recovery, invitation, mfaChallenge, sessionAlert, otpSession
        # @param [ProjectEmailTemplateLocale] locale Custom email template locale. If left empty, the fallback locale (en) will be used.
        # @param [String] subject Subject of the email template. Can be up to 255 characters.
        # @param [String] message Plain or HTML body of the email template message. Can be up to 10MB of content.
        # @param [String] sender_name Name of the email sender.
        # @param [String] sender_email Email of the sender. Pass an empty string to clear a previously set value.
        # @param [String] reply_to_email Reply to email. Pass an empty string to clear a previously set value.
        # @param [String] reply_to_name Reply to name.
        #
        # @return [EmailTemplate]
        def update_email_template(template_id:, locale: nil, subject: nil, message: nil, sender_name: nil, sender_email: nil, reply_to_email: nil, reply_to_name: nil)
            api_path = '/project/templates/email'

            if template_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "templateId"')
            end

            api_params = {
                templateId: template_id,
                locale: locale,
                subject: subject,
                message: message,
                senderName: sender_name,
                senderEmail: sender_email,
                replyToEmail: reply_to_email,
                replyToName: reply_to_name,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::EmailTemplate
            )

        end

        # Get a custom email template for the specified locale and type. This
        # endpoint returns the template content, subject, and other configuration
        # details.
        #
        # @param [ProjectEmailTemplateId] template_id Custom email template type. Can be one of: verification, magicSession, recovery, invitation, mfaChallenge, sessionAlert, otpSession
        # @param [ProjectEmailTemplateLocale] locale Custom email template locale. If left empty, the fallback locale (en) will be used.
        #
        # @return [EmailTemplate]
        def get_email_template(template_id:, locale: nil)
            api_path = '/project/templates/email/{templateId}'
                .gsub('{templateId}', template_id)

            if template_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "templateId"')
            end

            api_params = {
                locale: locale,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::EmailTemplate
            )

        end

        # Get a list of all project environment variables.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: key, resourceType, resourceId, secret
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [VariableList]
        def list_variables(queries: nil, total: nil)
            api_path = '/project/variables'

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VariableList
            )

        end

        # Create a new project environment variable. These variables can be accessed
        # by all functions and sites in the project.
        #
        # @param [String] variable_id Variable unique ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] key Variable key. Max length: 255 chars.
        # @param [String] value Variable value. Max length: 8192 chars.
        # @param [] secret Secret variables can be updated or deleted, but only projects can read them during build and runtime.
        #
        # @return [Variable]
        def create_variable(variable_id:, key:, value:, secret: nil)
            api_path = '/project/variables'

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
            end

            if key.nil?
              raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if value.nil?
              raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            api_params = {
                variableId: variable_id,
                key: key,
                value: value,
                secret: secret,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Variable
            )

        end

        # Get a variable by its unique ID. 
        #
        # @param [String] variable_id Variable unique ID.
        #
        # @return [Variable]
        def get_variable(variable_id:)
            api_path = '/project/variables/{variableId}'
                .gsub('{variableId}', variable_id)

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Variable
            )

        end

        # Update variable by its unique ID.
        #
        # @param [String] variable_id Variable unique ID.
        # @param [String] key Variable key. Max length: 255 chars.
        # @param [String] value Variable value. Max length: 8192 chars.
        # @param [] secret Secret variables can be updated or deleted, but only projects can read them during build and runtime.
        #
        # @return [Variable]
        def update_variable(variable_id:, key: nil, value: nil, secret: nil)
            api_path = '/project/variables/{variableId}'
                .gsub('{variableId}', variable_id)

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
            end

            api_params = {
                key: key,
                value: value,
                secret: secret,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Variable
            )

        end

        # Delete a variable by its unique ID. 
        #
        # @param [String] variable_id Variable unique ID.
        #
        # @return []
        def delete_variable(variable_id:)
            api_path = '/project/variables/{variableId}'
                .gsub('{variableId}', variable_id)

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

        end

    end 
end
