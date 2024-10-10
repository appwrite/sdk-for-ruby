#frozen_string_literal: true

module Appwrite
    class Functions < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all the project's functions. You can use the query params to
        # filter your results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, enabled, runtime, deployment, schedule, scheduleNext, schedulePrevious, timeout, entrypoint, commands, installationId
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [FunctionList]
        def list(queries: nil, search: nil)
            api_path = '/functions'

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
                response_type: Models::FunctionList
            )
        end

        
        # Create a new function. You can pass a list of
        # [permissions](https://appwrite.io/docs/permissions) to allow different
        # project users or team with access to execute the function using the client
        # API.
        #
        # @param [String] function_id Function ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Function name. Max length: 128 chars.
        # @param [Runtime] runtime Execution runtime.
        # @param [Array] execute An array of role strings with execution permissions. By default no user is granted with any execute permissions. [learn more about roles](https://appwrite.io/docs/permissions#permission-roles). Maximum of 100 roles are allowed, each 64 characters long.
        # @param [Array] events Events list. Maximum of 100 events are allowed.
        # @param [String] schedule Schedule CRON syntax.
        # @param [Integer] timeout Function maximum execution time in seconds.
        # @param [] enabled Is function enabled? When set to 'disabled', users cannot access the function but Server SDKs with and API key can still access the function. No data is lost when this is toggled.
        # @param [] logging Whether executions will be logged. When set to false, executions will not be logged, but will reduce resource used by your Appwrite project.
        # @param [String] entrypoint Entrypoint File. This path is relative to the "providerRootDirectory".
        # @param [String] commands Build Commands.
        # @param [Array] scopes List of scopes allowed for API key auto-generated for every execution. Maximum of 100 scopes are allowed.
        # @param [String] installation_id Appwrite Installation ID for VCS (Version Control System) deployment.
        # @param [String] provider_repository_id Repository ID of the repo linked to the function.
        # @param [String] provider_branch Production branch for the repo linked to the function.
        # @param [] provider_silent_mode Is the VCS (Version Control System) connection in silent mode for the repo linked to the function? In silent mode, comments will not be made on commits and pull requests.
        # @param [String] provider_root_directory Path to function code in the linked repo.
        # @param [String] template_repository Repository name of the template.
        # @param [String] template_owner The name of the owner of the template.
        # @param [String] template_root_directory Path to function code in the template repo.
        # @param [String] template_version Version (tag) for the repo linked to the function template.
        # @param [String] specification Runtime specification for the function and builds.
        #
        # @return [Function]
        def create(function_id:, name:, runtime:, execute: nil, events: nil, schedule: nil, timeout: nil, enabled: nil, logging: nil, entrypoint: nil, commands: nil, scopes: nil, installation_id: nil, provider_repository_id: nil, provider_branch: nil, provider_silent_mode: nil, provider_root_directory: nil, template_repository: nil, template_owner: nil, template_root_directory: nil, template_version: nil, specification: nil)
            api_path = '/functions'

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if runtime.nil?
              raise Appwrite::Exception.new('Missing required parameter: "runtime"')
            end

            api_params = {
              functionId: function_id,
              name: name,
              runtime: runtime,
              execute: execute,
              events: events,
              schedule: schedule,
              timeout: timeout,
              enabled: enabled,
              logging: logging,
              entrypoint: entrypoint,
              commands: commands,
              scopes: scopes,
              installationId: installation_id,
              providerRepositoryId: provider_repository_id,
              providerBranch: provider_branch,
              providerSilentMode: provider_silent_mode,
              providerRootDirectory: provider_root_directory,
              templateRepository: template_repository,
              templateOwner: template_owner,
              templateRootDirectory: template_root_directory,
              templateVersion: template_version,
              specification: specification,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Function
            )
        end

        
        # Get a list of all runtimes that are currently active on your instance.
        #
        #
        # @return [RuntimeList]
        def list_runtimes()
            api_path = '/functions/runtimes'

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
                response_type: Models::RuntimeList
            )
        end

        
        # List allowed function specifications for this instance.
        # 
        #
        #
        # @return [SpecificationList]
        def list_specifications()
            api_path = '/functions/specifications'

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
                response_type: Models::SpecificationList
            )
        end

        
        # Get a function by its unique ID.
        #
        # @param [String] function_id Function ID.
        #
        # @return [Function]
        def get(function_id:)
            api_path = '/functions/{functionId}'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
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
                response_type: Models::Function
            )
        end

        
        # Update function by its unique ID.
        #
        # @param [String] function_id Function ID.
        # @param [String] name Function name. Max length: 128 chars.
        # @param [Runtime] runtime Execution runtime.
        # @param [Array] execute An array of role strings with execution permissions. By default no user is granted with any execute permissions. [learn more about roles](https://appwrite.io/docs/permissions#permission-roles). Maximum of 100 roles are allowed, each 64 characters long.
        # @param [Array] events Events list. Maximum of 100 events are allowed.
        # @param [String] schedule Schedule CRON syntax.
        # @param [Integer] timeout Maximum execution time in seconds.
        # @param [] enabled Is function enabled? When set to 'disabled', users cannot access the function but Server SDKs with and API key can still access the function. No data is lost when this is toggled.
        # @param [] logging Whether executions will be logged. When set to false, executions will not be logged, but will reduce resource used by your Appwrite project.
        # @param [String] entrypoint Entrypoint File. This path is relative to the "providerRootDirectory".
        # @param [String] commands Build Commands.
        # @param [Array] scopes List of scopes allowed for API Key auto-generated for every execution. Maximum of 100 scopes are allowed.
        # @param [String] installation_id Appwrite Installation ID for VCS (Version Controle System) deployment.
        # @param [String] provider_repository_id Repository ID of the repo linked to the function
        # @param [String] provider_branch Production branch for the repo linked to the function
        # @param [] provider_silent_mode Is the VCS (Version Control System) connection in silent mode for the repo linked to the function? In silent mode, comments will not be made on commits and pull requests.
        # @param [String] provider_root_directory Path to function code in the linked repo.
        # @param [String] specification Runtime specification for the function and builds.
        #
        # @return [Function]
        def update(function_id:, name:, runtime: nil, execute: nil, events: nil, schedule: nil, timeout: nil, enabled: nil, logging: nil, entrypoint: nil, commands: nil, scopes: nil, installation_id: nil, provider_repository_id: nil, provider_branch: nil, provider_silent_mode: nil, provider_root_directory: nil, specification: nil)
            api_path = '/functions/{functionId}'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            api_params = {
              name: name,
              runtime: runtime,
              execute: execute,
              events: events,
              schedule: schedule,
              timeout: timeout,
              enabled: enabled,
              logging: logging,
              entrypoint: entrypoint,
              commands: commands,
              scopes: scopes,
              installationId: installation_id,
              providerRepositoryId: provider_repository_id,
              providerBranch: provider_branch,
              providerSilentMode: provider_silent_mode,
              providerRootDirectory: provider_root_directory,
              specification: specification,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Function
            )
        end

        
        # Delete a function by its unique ID.
        #
        # @param [String] function_id Function ID.
        #
        # @return []
        def delete(function_id:)
            api_path = '/functions/{functionId}'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
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

        
        # Get a list of all the project's code deployments. You can use the query
        # params to filter your results.
        #
        # @param [String] function_id Function ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: size, buildId, activate, entrypoint, commands, type, size
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [DeploymentList]
        def list_deployments(function_id:, queries: nil, search: nil)
            api_path = '/functions/{functionId}/deployments'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

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
                response_type: Models::DeploymentList
            )
        end

        
        # Create a new function code deployment. Use this endpoint to upload a new
        # version of your code function. To execute your newly uploaded code, you'll
        # need to update the function's deployment to use your new deployment UID.
        # 
        # This endpoint accepts a tar.gz file compressed with your code. Make sure to
        # include any dependencies your code has within the compressed file. You can
        # learn more about code packaging in the [Appwrite Cloud Functions
        # tutorial](https://appwrite.io/docs/functions).
        # 
        # Use the "command" param to set the entrypoint used to execute your code.
        #
        # @param [String] function_id Function ID.
        # @param [Payload] code Gzip file with your code package. When used with the Appwrite CLI, pass the path to your code directory, and the CLI will automatically package your code. Use a path that is within the current directory.
        # @param [] activate Automatically activate the deployment when it is finished building.
        # @param [String] entrypoint Entrypoint File.
        # @param [String] commands Build Commands.
        #
        # @return [Deployment]
        def create_deployment(function_id:, code:, activate:, entrypoint: nil, commands: nil, on_progress: nil)
            api_path = '/functions/{functionId}/deployments'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if code.nil?
              raise Appwrite::Exception.new('Missing required parameter: "code"')
            end

            if activate.nil?
              raise Appwrite::Exception.new('Missing required parameter: "activate"')
            end

            api_params = {
              entrypoint: entrypoint,
              commands: commands,
              code: code,
              activate: activate,
            }
            
            api_headers = {
                "content-type": 'multipart/form-data',
            }

            id_param_name = nil
            param_name = 'code'

            @client.chunked_upload(
                path: api_path,
                headers: api_headers,
                params: api_params,
                param_name: param_name,
                id_param_name: id_param_name,
                on_progress: on_progress,
                response_type: Models::Deployment
            )
        end

        
        # Get a code deployment by its unique ID.
        #
        # @param [String] function_id Function ID.
        # @param [String] deployment_id Deployment ID.
        #
        # @return [Deployment]
        def get_deployment(function_id:, deployment_id:)
            api_path = '/functions/{functionId}/deployments/{deploymentId}'
                .gsub('{functionId}', function_id)
                .gsub('{deploymentId}', deployment_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if deployment_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
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
                response_type: Models::Deployment
            )
        end

        
        # Update the function code deployment ID using the unique function ID. Use
        # this endpoint to switch the code deployment that should be executed by the
        # execution endpoint.
        #
        # @param [String] function_id Function ID.
        # @param [String] deployment_id Deployment ID.
        #
        # @return [Function]
        def update_deployment(function_id:, deployment_id:)
            api_path = '/functions/{functionId}/deployments/{deploymentId}'
                .gsub('{functionId}', function_id)
                .gsub('{deploymentId}', deployment_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if deployment_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
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
                response_type: Models::Function
            )
        end

        
        # Delete a code deployment by its unique ID.
        #
        # @param [String] function_id Function ID.
        # @param [String] deployment_id Deployment ID.
        #
        # @return []
        def delete_deployment(function_id:, deployment_id:)
            api_path = '/functions/{functionId}/deployments/{deploymentId}'
                .gsub('{functionId}', function_id)
                .gsub('{deploymentId}', deployment_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if deployment_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
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

        
        # 
        #
        # @param [String] function_id Function ID.
        # @param [String] deployment_id Deployment ID.
        # @param [String] build_id Build unique ID.
        #
        # @return []
        def create_build(function_id:, deployment_id:, build_id: nil)
            api_path = '/functions/{functionId}/deployments/{deploymentId}/build'
                .gsub('{functionId}', function_id)
                .gsub('{deploymentId}', deployment_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if deployment_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
            end

            api_params = {
              buildId: build_id,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        
        # 
        #
        # @param [String] function_id Function ID.
        # @param [String] deployment_id Deployment ID.
        #
        # @return [Build]
        def update_deployment_build(function_id:, deployment_id:)
            api_path = '/functions/{functionId}/deployments/{deploymentId}/build'
                .gsub('{functionId}', function_id)
                .gsub('{deploymentId}', deployment_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if deployment_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
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
                response_type: Models::Build
            )
        end

        
        # Get a Deployment's contents by its unique ID. This endpoint supports range
        # requests for partial or streaming file download.
        #
        # @param [String] function_id Function ID.
        # @param [String] deployment_id Deployment ID.
        #
        # @return []
        def get_deployment_download(function_id:, deployment_id:)
            api_path = '/functions/{functionId}/deployments/{deploymentId}/download'
                .gsub('{functionId}', function_id)
                .gsub('{deploymentId}', deployment_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if deployment_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
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
            )
        end

        
        # Get a list of all the current user function execution logs. You can use the
        # query params to filter your results.
        #
        # @param [String] function_id Function ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: trigger, status, responseStatusCode, duration, requestMethod, requestPath, deploymentId
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [ExecutionList]
        def list_executions(function_id:, queries: nil, search: nil)
            api_path = '/functions/{functionId}/executions'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

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
                response_type: Models::ExecutionList
            )
        end

        
        # Trigger a function execution. The returned object will return you the
        # current execution status. You can ping the `Get Execution` endpoint to get
        # updates on the current execution status. Once this endpoint is called, your
        # function execution process will start asynchronously.
        #
        # @param [String] function_id Function ID.
        # @param [Payload] body HTTP body of execution. Default value is empty string.
        # @param [] async Execute code in the background. Default value is false.
        # @param [String] xpath HTTP path of execution. Path can include query params. Default value is /
        # @param [ExecutionMethod] method HTTP method of execution. Default value is GET.
        # @param [Hash] headers HTTP headers of execution. Defaults to empty.
        # @param [String] scheduled_at Scheduled execution time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. DateTime value must be in future with precision in minutes.
        #
        # @return [Execution]
        def create_execution(function_id:, body: nil, async: nil, xpath: nil, method: nil, headers: nil, scheduled_at: nil, on_progress: nil)
            api_path = '/functions/{functionId}/executions'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            api_params = {
              body: body,
              async: async,
              path: xpath,
              method: method,
              headers: headers,
              scheduledAt: scheduled_at,
            }
            
            api_headers = {
                "content-type": 'multipart/form-data',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Execution
            )
        end

        
        # Get a function execution log by its unique ID.
        #
        # @param [String] function_id Function ID.
        # @param [String] execution_id Execution ID.
        #
        # @return [Execution]
        def get_execution(function_id:, execution_id:)
            api_path = '/functions/{functionId}/executions/{executionId}'
                .gsub('{functionId}', function_id)
                .gsub('{executionId}', execution_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if execution_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "executionId"')
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
                response_type: Models::Execution
            )
        end

        
        # Delete a function execution by its unique ID.
        # 
        #
        # @param [String] function_id Function ID.
        # @param [String] execution_id Execution ID.
        #
        # @return []
        def delete_execution(function_id:, execution_id:)
            api_path = '/functions/{functionId}/executions/{executionId}'
                .gsub('{functionId}', function_id)
                .gsub('{executionId}', execution_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if execution_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "executionId"')
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

        
        # Get a list of all variables of a specific function.
        #
        # @param [String] function_id Function unique ID.
        #
        # @return [VariableList]
        def list_variables(function_id:)
            api_path = '/functions/{functionId}/variables'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
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
                response_type: Models::VariableList
            )
        end

        
        # Create a new function environment variable. These variables can be accessed
        # in the function at runtime as environment variables.
        #
        # @param [String] function_id Function unique ID.
        # @param [String] key Variable key. Max length: 255 chars.
        # @param [String] value Variable value. Max length: 8192 chars.
        #
        # @return [Variable]
        def create_variable(function_id:, key:, value:)
            api_path = '/functions/{functionId}/variables'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if key.nil?
              raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            if value.nil?
              raise Appwrite::Exception.new('Missing required parameter: "value"')
            end

            api_params = {
              key: key,
              value: value,
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
        # @param [String] function_id Function unique ID.
        # @param [String] variable_id Variable unique ID.
        #
        # @return [Variable]
        def get_variable(function_id:, variable_id:)
            api_path = '/functions/{functionId}/variables/{variableId}'
                .gsub('{functionId}', function_id)
                .gsub('{variableId}', variable_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
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
                response_type: Models::Variable
            )
        end

        
        # Update variable by its unique ID.
        #
        # @param [String] function_id Function unique ID.
        # @param [String] variable_id Variable unique ID.
        # @param [String] key Variable key. Max length: 255 chars.
        # @param [String] value Variable value. Max length: 8192 chars.
        #
        # @return [Variable]
        def update_variable(function_id:, variable_id:, key:, value: nil)
            api_path = '/functions/{functionId}/variables/{variableId}'
                .gsub('{functionId}', function_id)
                .gsub('{variableId}', variable_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
            end

            if key.nil?
              raise Appwrite::Exception.new('Missing required parameter: "key"')
            end

            api_params = {
              key: key,
              value: value,
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
        # @param [String] function_id Function unique ID.
        # @param [String] variable_id Variable unique ID.
        #
        # @return []
        def delete_variable(function_id:, variable_id:)
            api_path = '/functions/{functionId}/variables/{variableId}'
                .gsub('{functionId}', function_id)
                .gsub('{variableId}', variable_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

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