# frozen_string_literal: true

module Appwrite
    class Oauth2 < Service
        def initialize(client)
            @client = client
        end

        # Approve an OAuth2 grant after the user gives consent. Returns the
        # `redirectUrl` the end user should be sent to. The consent screen may
        # optionally pass enriched `authorization_details` to record the concrete
        # resources the user selected. You can pass Accept header of
        # `application/json` to receive a JSON response instead of a redirect.
        #
        # @param [String] grant_id Grant ID made during authorization, provided to consent screen in URL search params.
        # @param [String] authorization_details Enriched `authorization_details` the user consented to, replacing what the client requested. Each entry must use a `type` the project accepts. Optional; omit to keep the originally requested details.
        # @param [String] scope Space-separated scopes the user consented to. Must be a subset of the scopes originally requested; identity scopes such as `openid` are always retained. Optional; omit to keep the originally requested scopes.
        #
        # @return [Oauth2Approve]
        def approve(
            grant_id:,
            authorization_details: nil,
            scope: nil
        )
            api_path = '/oauth2/{project_id}/approve'
                .gsub('{project_id}', @client.get_config('project'))

            if grant_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "grantId"')
            end

            api_params = {
                grant_id: grant_id,
                authorization_details: authorization_details,
                scope: scope,
            }

            api_headers = {
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Oauth2Approve
            )
        end

        # Begin the OAuth2 authorization flow. When called without a session, the
        # user is redirected to the consent screen without grant ID. When called with
        # a session, the redirect URL includes param for grant ID. You can pass
        # Accept header of `application/json` to receive a JSON response instead of a
        # redirect.
        #
        # @param [String] client_id OAuth2 client ID. Either a registered app ID or an HTTPS client ID metadata document URL.
        # @param [String] redirect_uri Redirect URI where visitor will be redirected after authorization, whether successful or not.
        # @param [String] response_type OAuth2 / OIDC response type. One of `code` (Authorization Code Flow), `id_token` (Implicit Flow, OIDC login only), or `code id_token` (Hybrid Flow).
        # @param [String] scope Space-separated OAuth2 scopes. Can include project scopes, and built-in scopes: `openid`, `email`, `profile`, `phone`.
        # @param [String] state OAuth2 state. You receive this back in the redirect URI.
        # @param [String] nonce OIDC nonce parameter to prevent replay attacks. Required when response_type includes `id_token`.
        # @param [String] code_challenge PKCE code challenge. Required when OAuth2 app is public.
        # @param [String] code_challenge_method PKCE code challenge method. Required when OAuth2 app is public.
        # @param [String] prompt OIDC prompt parameter for customization of consent screen. Space-separated list of: none, login, consent, select_account.
        # @param [Integer] max_age OIDC max_age paraleter for customization of consent screen. Maximum allowable elapsed time in seconds since the user last authenticated. If exceeded, re-authentication is required.
        # @param [String] authorization_details Rich authorization request. JSON array of objects, each with a `type` and project-defined fields
        # @param [String] resource RFC 8707 resource indicator URI or URI list. Each value must be an absolute URI without a fragment.
        # @param [String] audience Compatibility alias for a single OAuth2 resource indicator URI.
        # @param [String] request_uri OAuth2 authorization request handle returned by the pushed authorization request endpoint.
        #
        # @return [Oauth2Authorize]
        def authorize(
            client_id: nil,
            redirect_uri: nil,
            response_type: nil,
            scope: nil,
            state: nil,
            nonce: nil,
            code_challenge: nil,
            code_challenge_method: nil,
            prompt: nil,
            max_age: nil,
            authorization_details: nil,
            resource: nil,
            audience: nil,
            request_uri: nil
        )
            api_path = '/oauth2/{project_id}/authorize'
                .gsub('{project_id}', @client.get_config('project'))

            api_params = {
                client_id: client_id,
                redirect_uri: redirect_uri,
                response_type: response_type,
                scope: scope,
                state: state,
                nonce: nonce,
                code_challenge: code_challenge,
                code_challenge_method: code_challenge_method,
                prompt: prompt,
                max_age: max_age,
                authorization_details: authorization_details,
                resource: resource,
                audience: audience,
                request_uri: request_uri,
            }

            api_headers = {
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Oauth2Authorize
            )
        end

        # Begin the OAuth2 authorization flow. When called without a session, the
        # user is redirected to the consent screen without grant ID. When called with
        # a session, the redirect URL includes param for grant ID. You can pass
        # Accept header of `application/json` to receive a JSON response instead of a
        # redirect.
        #
        # @param [String] client_id OAuth2 client ID. Either a registered app ID or an HTTPS client ID metadata document URL.
        # @param [String] redirect_uri Redirect URI where visitor will be redirected after authorization, whether successful or not.
        # @param [String] response_type OAuth2 / OIDC response type. One of `code` (Authorization Code Flow), `id_token` (Implicit Flow, OIDC login only), or `code id_token` (Hybrid Flow).
        # @param [String] scope Space-separated OAuth2 scopes. Can include project scopes, and built-in scopes: `openid`, `email`, `profile`, `phone`.
        # @param [String] state OAuth2 state. You receive this back in the redirect URI.
        # @param [String] nonce OIDC nonce parameter to prevent replay attacks. Required when response_type includes `id_token`.
        # @param [String] code_challenge PKCE code challenge. Required when OAuth2 app is public.
        # @param [String] code_challenge_method PKCE code challenge method. Required when OAuth2 app is public.
        # @param [String] prompt OIDC prompt parameter for customization of consent screen. Space-separated list of: none, login, consent, select_account.
        # @param [Integer] max_age OIDC max_age paraleter for customization of consent screen. Maximum allowable elapsed time in seconds since the user last authenticated. If exceeded, re-authentication is required.
        # @param [String] authorization_details Rich authorization request. JSON array of objects, each with a `type` and project-defined fields
        # @param [String] resource RFC 8707 resource indicator URI or URI list. Each value must be an absolute URI without a fragment.
        # @param [String] audience Compatibility alias for a single OAuth2 resource indicator URI.
        # @param [String] request_uri OAuth2 authorization request handle returned by the pushed authorization request endpoint.
        #
        # @return [Oauth2Authorize]
        def authorize_post(
            client_id: nil,
            redirect_uri: nil,
            response_type: nil,
            scope: nil,
            state: nil,
            nonce: nil,
            code_challenge: nil,
            code_challenge_method: nil,
            prompt: nil,
            max_age: nil,
            authorization_details: nil,
            resource: nil,
            audience: nil,
            request_uri: nil
        )
            api_path = '/oauth2/{project_id}/authorize'
                .gsub('{project_id}', @client.get_config('project'))

            api_params = {
                client_id: client_id,
                redirect_uri: redirect_uri,
                response_type: response_type,
                scope: scope,
                state: state,
                nonce: nonce,
                code_challenge: code_challenge,
                code_challenge_method: code_challenge_method,
                prompt: prompt,
                max_age: max_age,
                authorization_details: authorization_details,
                resource: resource,
                audience: audience,
                request_uri: request_uri,
            }

            api_headers = {
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Oauth2Authorize
            )
        end

        # Start the OAuth2 Device Authorization Grant. Returns the device code, user
        # code, verification URL, expiration, and polling interval.
        #
        # @param [String] client_id OAuth2 client ID. Either a registered app ID or an HTTPS client ID metadata document URL.
        # @param [String] scope Space-separated OAuth2 scopes. Can include project scopes, and built-in scopes: `openid`, `email`, `profile`.
        # @param [String] authorization_details Rich authorization request. JSON array of objects, each with a `type` and project-defined fields
        # @param [String] resource RFC 8707 resource indicator URI or URI list. Each value must be an absolute URI without a fragment.
        # @param [String] audience Compatibility alias for a single OAuth2 resource indicator URI.
        #
        # @return [Oauth2DeviceAuthorization]
        def create_device_authorization(
            client_id: nil,
            scope: nil,
            authorization_details: nil,
            resource: nil,
            audience: nil
        )
            api_path = '/oauth2/{project_id}/device_authorization'
                .gsub('{project_id}', @client.get_config('project'))

            api_params = {
                client_id: client_id,
                scope: scope,
                authorization_details: authorization_details,
                resource: resource,
                audience: audience,
            }

            api_headers = {
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Oauth2DeviceAuthorization
            )
        end

        # Exchange a device flow user code for an OAuth2 grant. The authenticated
        # user is bound to the pending grant. Pass the returned grant ID to the get
        # grant endpoint to render the consent screen, then to the approve or reject
        # endpoint to complete the flow.
        #
        # @param [String] user_code User code displayed on the device.
        #
        # @return [Oauth2Grant]
        def create_grant(
            user_code:
        )
            api_path = '/oauth2/{project_id}/grants'
                .gsub('{project_id}', @client.get_config('project'))

            if user_code.nil?
                raise Appwrite::Exception.new('Missing required parameter: "userCode"')
            end

            api_params = {
                user_code: user_code,
            }

            api_headers = {
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Oauth2Grant
            )
        end

        # Get an OAuth2 grant by its ID. Used by the consent screen to display the
        # details of the authorization the user is being asked to approve. A grant
        # can only be read by the user it belongs to, or by server SDK.
        #
        # @param [String] grant_id Grant ID made during authorization, provided to consent screen in URL search params.
        #
        # @return [Oauth2Grant]
        def get_grant(
            grant_id:
        )
            api_path = '/oauth2/{project_id}/grants/{grant_id}'
                .gsub('{project_id}', @client.get_config('project'))
                .gsub('{grant_id}', grant_id)

            if grant_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "grantId"')
            end

            api_params = {}

            api_headers = {
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Oauth2Grant
            )
        end

        # List the organizations the OAuth2 access token can access. Resolves the
        # token&#039;s `organization` authorization details, expanding the `*` wildcard
        # into the concrete set of organizations the user can see.
        #
        # @param [Integer] limit Maximum number of organizations to return. Between 1 and 5000.
        # @param [Integer] offset Number of organizations to skip before returning results. Used for pagination.
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [Oauth2OrganizationList]
        def list_organizations(
            limit: nil,
            offset: nil,
            search: nil
        )
            api_path = '/oauth2/{project_id}/organizations'
                .gsub('{project_id}', @client.get_config('project'))

            api_params = {
                limit: limit,
                offset: offset,
                search: search,
            }

            api_headers = {
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Oauth2OrganizationList
            )
        end

        # Store an OAuth2 authorization request server-side and receive a short-lived
        # request_uri handle for the authorize endpoint.
        #
        # @param [String] client_id OAuth2 client ID. Either a registered app ID or an HTTPS client ID metadata document URL.
        # @param [String] redirect_uri Redirect URI where visitor will be redirected after authorization, whether successful or not.
        # @param [String] response_type OAuth2 / OIDC response type.
        # @param [String] scope Space-separated OAuth2 scopes. Can include project scopes, and built-in scopes: `openid`, `email`, `profile`, `phone`.
        # @param [String] state OAuth2 state. You receive this back in the redirect URI.
        # @param [String] nonce OIDC nonce parameter to prevent replay attacks. Required when response_type includes `id_token`.
        # @param [String] code_challenge PKCE code challenge. Required when OAuth2 app is public.
        # @param [String] code_challenge_method PKCE code challenge method. Required when OAuth2 app is public.
        # @param [String] prompt OIDC prompt parameter for customization of consent screen. Space-separated list of: none, login, consent, select_account.
        # @param [Integer] max_age OIDC max_age parameter for customization of consent screen.
        # @param [String] authorization_details Rich authorization request. JSON array of objects, each with a `type` and project-defined fields
        # @param [String] resource RFC 8707 resource indicator URI or URI list. Each value must be an absolute URI without a fragment.
        # @param [String] audience Compatibility alias for a single OAuth2 resource indicator URI.
        #
        # @return [Oauth2PAR]
        def create_par(
            client_id:,
            redirect_uri:,
            response_type:,
            scope: nil,
            state: nil,
            nonce: nil,
            code_challenge: nil,
            code_challenge_method: nil,
            prompt: nil,
            max_age: nil,
            authorization_details: nil,
            resource: nil,
            audience: nil
        )
            api_path = '/oauth2/{project_id}/par'
                .gsub('{project_id}', @client.get_config('project'))

            if client_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "clientId"')
            end

            if redirect_uri.nil?
                raise Appwrite::Exception.new('Missing required parameter: "redirectUri"')
            end

            if response_type.nil?
                raise Appwrite::Exception.new('Missing required parameter: "responseType"')
            end

            api_params = {
                client_id: client_id,
                redirect_uri: redirect_uri,
                response_type: response_type,
                scope: scope,
                state: state,
                nonce: nonce,
                code_challenge: code_challenge,
                code_challenge_method: code_challenge_method,
                prompt: prompt,
                max_age: max_age,
                authorization_details: authorization_details,
                resource: resource,
                audience: audience,
            }

            api_headers = {
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Oauth2PAR
            )
        end

        # List the projects the OAuth2 access token can access. Resolves the token&#039;s
        # `project` authorization details, expanding the `*` wildcard into the
        # concrete set of projects the user can see.
        #
        # @param [Integer] limit Maximum number of projects to return. Between 1 and 5000.
        # @param [Integer] offset Number of projects to skip before returning results. Used for pagination.
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [Oauth2ProjectList]
        def list_projects(
            limit: nil,
            offset: nil,
            search: nil
        )
            api_path = '/oauth2/{project_id}/projects'
                .gsub('{project_id}', @client.get_config('project'))

            api_params = {
                limit: limit,
                offset: offset,
                search: search,
            }

            api_headers = {
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Oauth2ProjectList
            )
        end

        # Reject an OAuth2 grant when the user denies consent. Returns the
        # `redirectUrl` the end user should be sent to with an `access_denied` error.
        # You can pass Accept header of `application/json` to receive a JSON response
        # instead of a redirect.
        #
        # @param [String] grant_id Grant ID made during authorization, provided to consent screen in URL search params.
        #
        # @return [Oauth2Reject]
        def reject(
            grant_id:
        )
            api_path = '/oauth2/{project_id}/reject'
                .gsub('{project_id}', @client.get_config('project'))

            if grant_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "grantId"')
            end

            api_params = {
                grant_id: grant_id,
            }

            api_headers = {
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Oauth2Reject
            )
        end

        # Revoke an OAuth2 access token or refresh token.
        #
        # @param [String] token The access or refresh token to revoke.
        # @param [String] token_type_hint Type of token to revoke (access_token or refresh_token).
        # @param [String] client_id OAuth2 client ID. Either a registered app ID or an HTTPS client ID metadata document URL.
        # @param [String] client_secret OAuth2 client secret. Required for confidential apps; omitted for public apps.
        #
        # @return []
        def revoke(
            token:,
            token_type_hint: nil,
            client_id: nil,
            client_secret: nil
        )
            api_path = '/oauth2/{project_id}/revoke'
                .gsub('{project_id}', @client.get_config('project'))

            if token.nil?
                raise Appwrite::Exception.new('Missing required parameter: "token"')
            end

            api_params = {
                token: token,
                token_type_hint: token_type_hint,
                client_id: client_id,
                client_secret: client_secret,
            }

            api_headers = {
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Exchange an OAuth2 authorization code, refresh token, or device code for
        # access and refresh tokens.
        #
        # @param [String] grant_type OAuth2 grant type. Can be one of: `authorization_code`, `refresh_token`, `urn:ietf:params:oauth:grant-type:device_code`.
        # @param [String] code Authorization code to be exchanged for access and refresh tokens. Required for `authorization_code` grant type.
        # @param [String] refresh_token Refresh token to be exchanged for a new access and refresh tokens. Required for `refresh_token` grant type.
        # @param [String] device_code Device code obtained from the device authorization endpoint. Required for `urn:ietf:params:oauth:grant-type:device_code` grant type.
        # @param [String] client_id OAuth2 client ID. Either a registered app ID or an HTTPS client ID metadata document URL.
        # @param [String] client_secret OAuth2 client secret. Required for confidential apps.
        # @param [String] code_verifier PKCE code verifier. Required for public apps.
        # @param [String] redirect_uri Redirect URI. Required for `authorization_code` grant type.
        # @param [String] resource RFC 8707 resource indicator URI or URI list. Each value must be an absolute URI without a fragment.
        # @param [String] audience Compatibility alias for a single OAuth2 resource indicator URI.
        #
        # @return [Oauth2Token]
        def create_token(
            grant_type:,
            code: nil,
            refresh_token: nil,
            device_code: nil,
            client_id: nil,
            client_secret: nil,
            code_verifier: nil,
            redirect_uri: nil,
            resource: nil,
            audience: nil
        )
            api_path = '/oauth2/{project_id}/token'
                .gsub('{project_id}', @client.get_config('project'))

            if grant_type.nil?
                raise Appwrite::Exception.new('Missing required parameter: "grantType"')
            end

            api_params = {
                grant_type: grant_type,
                code: code,
                refresh_token: refresh_token,
                device_code: device_code,
                client_id: client_id,
                client_secret: client_secret,
                code_verifier: code_verifier,
                redirect_uri: redirect_uri,
                resource: resource,
                audience: audience,
            }

            api_headers = {
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
    end
end
