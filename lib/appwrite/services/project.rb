#frozen_string_literal: true

module Appwrite
    class Project < Service

        def initialize(client)
            @client = client
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
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )

        end

        # Update the status of a specific protocol. Use this endpoint to enable or
        # disable a protocol in your project. 
        #
        # @param [ProtocolId] protocol_id Protocol name. Can be one of: rest, graphql, websocket
        # @param [] enabled Protocol status.
        #
        # @return [Project]
        def update_protocol_status(protocol_id:, enabled:)
            api_path = '/project/protocols/{protocolId}/status'
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

        # Update the status of a specific service. Use this endpoint to enable or
        # disable a service in your project. 
        #
        # @param [ServiceId] service_id Service name. Can be one of: account, avatars, databases, tablesdb, locale, health, project, storage, teams, users, vcs, sites, functions, proxy, graphql, migrations, messaging
        # @param [] enabled Service status.
        #
        # @return [Project]
        def update_service_status(service_id:, enabled:)
            api_path = '/project/services/{serviceId}/status'
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
        # @param [String] variable_id Variable ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
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
        # @param [String] variable_id Variable ID.
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
        # @param [String] variable_id Variable ID.
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
        # @param [String] variable_id Variable ID.
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
