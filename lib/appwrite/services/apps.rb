#frozen_string_literal: true

module Appwrite
    class Apps < Service

        def initialize(client)
            @client = client
        end

        # List applications.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [AppsList]
        def list(queries: nil, total: nil)
            api_path = '/apps'

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AppsList
            )

        end

        # Create a new application.
        #
        # @param [String] app_id Application ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Application name.
        # @param [Array] redirect_uris Redirect URIs. Each must be an https URL, an http loopback URL (localhost, 127.0.0.1, [::1]), or a private-use scheme URI (e.g. com.example.app:/oauth), and must not contain a fragment.
        # @param [String] description Application description shown to users during OAuth2 consent.
        # @param [String] client_uri Application homepage URL shown to users during OAuth2 consent.
        # @param [String] logo_uri Application logo URL shown to users during OAuth2 consent.
        # @param [String] privacy_policy_url Application privacy policy URL shown to users during OAuth2 consent.
        # @param [String] terms_url Application terms of service URL shown to users during OAuth2 consent.
        # @param [Array] contacts Application support or security contact emails. Maximum of 100 contacts are allowed.
        # @param [String] tagline Application tagline shown to users during OAuth2 consent.
        # @param [Array] tags Application tags shown to users during OAuth2 consent. Maximum of 100 tags are allowed, each up to 64 characters long.
        # @param [Array] images Application image URLs shown to users during OAuth2 consent. Maximum of 100 images are allowed.
        # @param [String] support_url Application support URL shown to users during OAuth2 consent.
        # @param [String] data_deletion_url Application data deletion URL shown to users during OAuth2 consent.
        # @param [Array] post_logout_redirect_uris Post-logout redirect URIs for OpenID Connect RP-Initiated Logout. Each must be an https URL, an http loopback URL, or a private-use scheme URI, and must not contain a fragment. After ending the user session, the logout endpoint only redirects to URIs in this list.
        # @param [] enabled Is application enabled?
        # @param [String] type OAuth2 client type. Use `public` for SPAs, mobile, and native apps that cannot keep a `client_secret` — PKCE is then required at the token endpoint. Use `confidential` for server-side clients that present a `client_secret`. Defaults to `confidential`.
        # @param [] device_flow Allow this client to use the OAuth2 Device Authorization Grant (RFC 8628) for input-constrained devices such as TVs and CLIs. Defaults to false.
        # @param [String] team_id Team unique ID.
        #
        # @return [App]
        def create(app_id:, name:, redirect_uris:, description: nil, client_uri: nil, logo_uri: nil, privacy_policy_url: nil, terms_url: nil, contacts: nil, tagline: nil, tags: nil, images: nil, support_url: nil, data_deletion_url: nil, post_logout_redirect_uris: nil, enabled: nil, type: nil, device_flow: nil, team_id: nil)
            api_path = '/apps'

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if redirect_uris.nil?
              raise Appwrite::Exception.new('Missing required parameter: "redirectUris"')
            end

            api_params = {
                appId: app_id,
                name: name,
                description: description,
                clientUri: client_uri,
                logoUri: logo_uri,
                privacyPolicyUrl: privacy_policy_url,
                termsUrl: terms_url,
                contacts: contacts,
                tagline: tagline,
                tags: tags,
                images: images,
                supportUrl: support_url,
                dataDeletionUrl: data_deletion_url,
                redirectUris: redirect_uris,
                postLogoutRedirectUris: post_logout_redirect_uris,
                enabled: enabled,
                type: type,
                deviceFlow: device_flow,
                teamId: team_id,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::App
            )

        end

        # List scopes an application can request when installed on a team.
        #
        #
        # @return [AppScopeList]
        def list_installation_scopes()
            api_path = '/apps/scopes/installations'

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AppScopeList
            )

        end

        # List scopes an application can request during the OAuth2 flow.
        #
        #
        # @return [AppScopeList]
        def list_o_auth2_scopes()
            api_path = '/apps/scopes/oauth2'

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AppScopeList
            )

        end

        # Get an application by its unique ID.
        #
        # @param [String] app_id Application unique ID or HTTPS client ID metadata document URL.
        #
        # @return [App]
        def get(app_id:)
            api_path = '/apps/{appId}'
                .gsub('{appId}', app_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::App
            )

        end

        # Update an application by its unique ID.
        #
        # @param [String] app_id Application unique ID.
        # @param [String] name Application name.
        # @param [String] description Application description shown to users during OAuth2 consent.
        # @param [String] client_uri Application homepage URL shown to users during OAuth2 consent.
        # @param [String] logo_uri Application logo URL shown to users during OAuth2 consent.
        # @param [String] privacy_policy_url Application privacy policy URL shown to users during OAuth2 consent.
        # @param [String] terms_url Application terms of service URL shown to users during OAuth2 consent.
        # @param [Array] contacts Application support or security contact emails. Maximum of 100 contacts are allowed.
        # @param [String] tagline Application tagline shown to users during OAuth2 consent.
        # @param [Array] tags Application tags shown to users during OAuth2 consent. Maximum of 100 tags are allowed, each up to 64 characters long.
        # @param [Array] images Application image URLs shown to users during OAuth2 consent. Maximum of 100 images are allowed.
        # @param [String] support_url Application support URL shown to users during OAuth2 consent.
        # @param [String] data_deletion_url Application data deletion URL shown to users during OAuth2 consent.
        # @param [] enabled Is application enabled?
        # @param [Array] redirect_uris Redirect URIs. Each must be an https URL, an http loopback URL (localhost, 127.0.0.1, [::1]), or a private-use scheme URI (e.g. com.example.app:/oauth), and must not contain a fragment.
        # @param [Array] post_logout_redirect_uris Post-logout redirect URIs for OpenID Connect RP-Initiated Logout. Each must be an https URL, an http loopback URL, or a private-use scheme URI, and must not contain a fragment. After ending the user session, the logout endpoint only redirects to URIs in this list.
        # @param [String] type OAuth2 client type. Use `public` for SPAs, mobile, and native apps that cannot keep a `client_secret` — PKCE is then required at the token endpoint. Use `confidential` for server-side clients that present a `client_secret`. Defaults to `confidential`.
        # @param [] device_flow Allow this client to use the OAuth2 Device Authorization Grant (RFC 8628) for input-constrained devices such as TVs and CLIs. Defaults to false.
        # @param [Array] installation_scopes Scopes the application requests when installed on a team. Organization-level and project-level scopes only; use the list scopes endpoint with `type=installation` to discover available values. Maximum of 100 scopes are allowed.
        # @param [String] installation_redirect_url URL users are redirected to after creating or updating an installation of this application. Must be an https URL, an http loopback URL (localhost, 127.0.0.1, [::1]), or a private-use scheme URI, and must not contain a fragment. Leave empty for no redirect.
        #
        # @return [App]
        def update(app_id:, name:, description: nil, client_uri: nil, logo_uri: nil, privacy_policy_url: nil, terms_url: nil, contacts: nil, tagline: nil, tags: nil, images: nil, support_url: nil, data_deletion_url: nil, enabled: nil, redirect_uris: nil, post_logout_redirect_uris: nil, type: nil, device_flow: nil, installation_scopes: nil, installation_redirect_url: nil)
            api_path = '/apps/{appId}'
                .gsub('{appId}', app_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
                name: name,
                description: description,
                clientUri: client_uri,
                logoUri: logo_uri,
                privacyPolicyUrl: privacy_policy_url,
                termsUrl: terms_url,
                contacts: contacts,
                tagline: tagline,
                tags: tags,
                images: images,
                supportUrl: support_url,
                dataDeletionUrl: data_deletion_url,
                enabled: enabled,
                redirectUris: redirect_uris,
                postLogoutRedirectUris: post_logout_redirect_uris,
                type: type,
                deviceFlow: device_flow,
                installationScopes: installation_scopes,
                installationRedirectUrl: installation_redirect_url,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::App
            )

        end

        # Delete an application by its unique ID.
        #
        # @param [String] app_id Application unique ID.
        #
        # @return []
        def delete(app_id:)
            api_path = '/apps/{appId}'
                .gsub('{appId}', app_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

        end

        # List installations of an application. Requires an app key sent in the
        # `X-Appwrite-Key` header alongside the `X-Appwrite-App` header.
        #
        # @param [String] app_id Application unique ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [AppInstallationList]
        def list_installations(app_id:, queries: nil, total: nil)
            api_path = '/apps/{appId}/installations'
                .gsub('{appId}', app_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AppInstallationList
            )

        end

        # Get an installation of an application by its unique ID. Requires an app key
        # sent in the `X-Appwrite-Key` header alongside the `X-Appwrite-App` header.
        #
        # @param [String] app_id Application unique ID.
        # @param [String] installation_id Installation unique ID.
        #
        # @return [AppInstallation]
        def get_installation(app_id:, installation_id:)
            api_path = '/apps/{appId}/installations/{installationId}'
                .gsub('{appId}', app_id)
                .gsub('{installationId}', installation_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            if installation_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "installationId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AppInstallation
            )

        end

        # Create a token for an installation of an application. Requires an app key
        # sent in the `X-Appwrite-Key` header alongside the `X-Appwrite-App` header.
        # The returned token carries the scopes and authorization details granted to
        # the installation, and can be used as an `Authorization: Bearer` header
        # everywhere OAuth2 access tokens are accepted. Multiple tokens can be active
        # for the same installation at once; each token stays valid until it expires
        # or the installation is updated or deleted.
        #
        # @param [String] app_id Application unique ID.
        # @param [String] installation_id Installation unique ID.
        #
        # @return [Oauth2Token]
        def create_installation_token(app_id:, installation_id:)
            api_path = '/apps/{appId}/installations/{installationId}/tokens'
                .gsub('{appId}', app_id)
                .gsub('{installationId}', installation_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            if installation_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "installationId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Oauth2Token
            )

        end

        # List app keys for an application.
        #
        # @param [String] app_id Application unique ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [AppKeyList]
        def list_keys(app_id:, queries: nil, total: nil)
            api_path = '/apps/{appId}/keys'
                .gsub('{appId}', app_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AppKeyList
            )

        end

        # Create a new app key for an application. App keys carry no scopes; send one
        # in the `X-Appwrite-Key` header alongside the `X-Appwrite-App` header to
        # list the application's installations and create installation access tokens.
        #
        # @param [String] app_id Application unique ID.
        #
        # @return [AppKey]
        def create_key(app_id:)
            api_path = '/apps/{appId}/keys'
                .gsub('{appId}', app_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AppKey
            )

        end

        # Get an app key by its unique ID.
        #
        # @param [String] app_id Application unique ID.
        # @param [String] key_id App key unique ID.
        #
        # @return [AppKey]
        def get_key(app_id:, key_id:)
            api_path = '/apps/{appId}/keys/{keyId}'
                .gsub('{appId}', app_id)
                .gsub('{keyId}', key_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            if key_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "keyId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AppKey
            )

        end

        # Delete an app key by its unique ID.
        #
        # @param [String] app_id Application unique ID.
        # @param [String] key_id App key unique ID.
        #
        # @return []
        def delete_key(app_id:, key_id:)
            api_path = '/apps/{appId}/keys/{keyId}'
                .gsub('{appId}', app_id)
                .gsub('{keyId}', key_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            if key_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "keyId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

        end

        # Update the labels of an application. Labels are read-only for clients; only
        # a server SDK using a project API key can set them. Replaces the previous
        # labels.
        #
        # @param [String] app_id Application unique ID.
        # @param [Array] labels Array of application labels. Replaces the previous labels. Maximum of 1000 labels are allowed, each up to 36 alphanumeric characters long.
        #
        # @return [App]
        def update_labels(app_id:, labels:)
            api_path = '/apps/{appId}/labels'
                .gsub('{appId}', app_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            if labels.nil?
              raise Appwrite::Exception.new('Missing required parameter: "labels"')
            end

            api_params = {
                labels: labels,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::App
            )

        end

        # List client secrets for an application.
        #
        # @param [String] app_id Application unique ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [AppSecretList]
        def list_secrets(app_id:, queries: nil, total: nil)
            api_path = '/apps/{appId}/secrets'
                .gsub('{appId}', app_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            api_params = {
                queries: queries,
                total: total,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AppSecretList
            )

        end

        # Create a new client secret for an application.
        #
        # @param [String] app_id Application unique ID.
        #
        # @return [AppSecretPlaintext]
        def create_secret(app_id:)
            api_path = '/apps/{appId}/secrets'
                .gsub('{appId}', app_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AppSecretPlaintext
            )

        end

        # Get an application client secret by its unique ID.
        #
        # @param [String] app_id Application unique ID.
        # @param [String] secret_id Secret unique ID.
        #
        # @return [AppSecret]
        def get_secret(app_id:, secret_id:)
            api_path = '/apps/{appId}/secrets/{secretId}'
                .gsub('{appId}', app_id)
                .gsub('{secretId}', secret_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            if secret_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "secretId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::AppSecret
            )

        end

        # Delete an application client secret by its unique ID.
        #
        # @param [String] app_id Application unique ID.
        # @param [String] secret_id Secret unique ID.
        #
        # @return []
        def delete_secret(app_id:, secret_id:)
            api_path = '/apps/{appId}/secrets/{secretId}'
                .gsub('{appId}', app_id)
                .gsub('{secretId}', secret_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            if secret_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "secretId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

        end

        # Transfer an application to another team by its unique ID.
        #
        # @param [String] app_id Application unique ID.
        # @param [String] team_id Team ID of the team to transfer application to.
        #
        # @return [App]
        def update_team(app_id:, team_id:)
            api_path = '/apps/{appId}/team'
                .gsub('{appId}', app_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            if team_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "teamId"')
            end

            api_params = {
                teamId: team_id,
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::App
            )

        end

        # Revoke all tokens for an application by its unique ID.
        #
        # @param [String] app_id Application unique ID.
        #
        # @return []
        def delete_tokens(app_id:)
            api_path = '/apps/{appId}/tokens'
                .gsub('{appId}', app_id)

            if app_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "appId"')
            end

            api_params = {
            }
            
            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
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
