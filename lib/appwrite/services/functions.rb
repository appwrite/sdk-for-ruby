#frozen_string_literal: true

module Appwrite
    class Functions < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all the project's functions. You can use the query params to
        # filter your results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, enabled, runtime, deployment, schedule, scheduleNext, schedulePrevious, timeout
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [FunctionList]
        def list(queries: nil, search: nil)
            path = '/functions'

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
                response_type: Models::FunctionList
            )
        end

        
        # Create a new function. You can pass a list of
        # [permissions](/docs/permissions) to allow different project users or team
        # with access to execute the function using the client API.
        #
        # @param [String] function_id Function ID. Choose your own unique ID or pass the string `ID.unique()` to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Function name. Max length: 128 chars.
        # @param [Array] execute An array of strings with execution roles. By default no user is granted with any execute permissions. [learn more about permissions](https://appwrite.io/docs/permissions). Maximum of 100 roles are allowed, each 64 characters long.
        # @param [String] runtime Execution runtime.
        # @param [Array] events Events list. Maximum of 100 events are allowed.
        # @param [String] schedule Schedule CRON syntax.
        # @param [Integer] timeout Function maximum execution time in seconds.
        # @param [] enabled Is function enabled?
        #
        # @return [Function]
        def create(function_id:, name:, execute:, runtime:, events: nil, schedule: nil, timeout: nil, enabled: nil)
            path = '/functions'

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if execute.nil?
              raise Appwrite::Exception.new('Missing required parameter: "execute"')
            end

            if runtime.nil?
              raise Appwrite::Exception.new('Missing required parameter: "runtime"')
            end

            params = {
                functionId: function_id,
                name: name,
                execute: execute,
                runtime: runtime,
                events: events,
                schedule: schedule,
                timeout: timeout,
                enabled: enabled,
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Function
            )
        end

        
        # Get a list of all runtimes that are currently active on your instance.
        #
        #
        # @return [RuntimeList]
        def list_runtimes()
            path = '/functions/runtimes'

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
                response_type: Models::RuntimeList
            )
        end

        
        # Get a function by its unique ID.
        #
        # @param [String] function_id Function ID.
        #
        # @return [Function]
        def get(function_id:)
            path = '/functions/{functionId}'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

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
                response_type: Models::Function
            )
        end

        
        # Update function by its unique ID.
        #
        # @param [String] function_id Function ID.
        # @param [String] name Function name. Max length: 128 chars.
        # @param [Array] execute An array of strings with execution roles. By default no user is granted with any execute permissions. [learn more about permissions](https://appwrite.io/docs/permissions). Maximum of 100 roles are allowed, each 64 characters long.
        # @param [Array] events Events list. Maximum of 100 events are allowed.
        # @param [String] schedule Schedule CRON syntax.
        # @param [Integer] timeout Maximum execution time in seconds.
        # @param [] enabled Is function enabled?
        #
        # @return [Function]
        def update(function_id:, name:, execute:, events: nil, schedule: nil, timeout: nil, enabled: nil)
            path = '/functions/{functionId}'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if execute.nil?
              raise Appwrite::Exception.new('Missing required parameter: "execute"')
            end

            params = {
                name: name,
                execute: execute,
                events: events,
                schedule: schedule,
                timeout: timeout,
                enabled: enabled,
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: path,
                headers: headers,
                params: params,
                response_type: Models::Function
            )
        end

        
        # Delete a function by its unique ID.
        #
        # @param [String] function_id Function ID.
        #
        # @return []
        def delete(function_id:)
            path = '/functions/{functionId}'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

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

        
        # Get a list of all the project's code deployments. You can use the query
        # params to filter your results.
        #
        # @param [String] function_id Function ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: entrypoint, size, buildId, activate
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [DeploymentList]
        def list_deployments(function_id:, queries: nil, search: nil)
            path = '/functions/{functionId}/deployments'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

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
        # tutorial](/docs/functions).
        # 
        # Use the "command" param to set the entry point used to execute your code.
        #
        # @param [String] function_id Function ID.
        # @param [String] entrypoint Entrypoint File.
        # @param [file] code Gzip file with your code package. When used with the Appwrite CLI, pass the path to your code directory, and the CLI will automatically package your code. Use a path that is within the current directory.
        # @param [] activate Automatically activate the deployment when it is finished building.
        #
        # @return [Deployment]
        def create_deployment(function_id:, entrypoint:, code:, activate:, on_progress: nil)
            path = '/functions/{functionId}/deployments'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if entrypoint.nil?
              raise Appwrite::Exception.new('Missing required parameter: "entrypoint"')
            end

            if code.nil?
              raise Appwrite::Exception.new('Missing required parameter: "code"')
            end

            if activate.nil?
              raise Appwrite::Exception.new('Missing required parameter: "activate"')
            end

            params = {
                entrypoint: entrypoint,
                code: code,
                activate: activate,
            }
            
            headers = {
                "content-type": 'multipart/form-data',
            }

            id_param_name = nil
            param_name = 'code'

            @client.chunked_upload(
                path: path,
                headers: headers,
                params: params,
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
            path = '/functions/{functionId}/deployments/{deploymentId}'
                .gsub('{functionId}', function_id)
                .gsub('{deploymentId}', deployment_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if deployment_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
            end

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
            path = '/functions/{functionId}/deployments/{deploymentId}'
                .gsub('{functionId}', function_id)
                .gsub('{deploymentId}', deployment_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if deployment_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
            end

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
            path = '/functions/{functionId}/deployments/{deploymentId}'
                .gsub('{functionId}', function_id)
                .gsub('{deploymentId}', deployment_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if deployment_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
            end

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

        
        # 
        #
        # @param [String] function_id Function ID.
        # @param [String] deployment_id Deployment ID.
        # @param [String] build_id Build unique ID.
        #
        # @return []
        def create_build(function_id:, deployment_id:, build_id:)
            path = '/functions/{functionId}/deployments/{deploymentId}/builds/{buildId}'
                .gsub('{functionId}', function_id)
                .gsub('{deploymentId}', deployment_id)
                .gsub('{buildId}', build_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if deployment_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
            end

            if build_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "buildId"')
            end

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
            )
        end

        
        # Get a list of all the current user function execution logs. You can use the
        # query params to filter your results.
        #
        # @param [String] function_id Function ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: trigger, status, statusCode, duration
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [ExecutionList]
        def list_executions(function_id:, queries: nil, search: nil)
            path = '/functions/{functionId}/executions'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

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
                response_type: Models::ExecutionList
            )
        end

        
        # Trigger a function execution. The returned object will return you the
        # current execution status. You can ping the `Get Execution` endpoint to get
        # updates on the current execution status. Once this endpoint is called, your
        # function execution process will start asynchronously.
        #
        # @param [String] function_id Function ID.
        # @param [String] data String of custom data to send to function.
        # @param [] async Execute code in the background. Default value is false.
        #
        # @return [Execution]
        def create_execution(function_id:, data: nil, async: nil)
            path = '/functions/{functionId}/executions'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            params = {
                data: data,
                async: async,
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
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
            path = '/functions/{functionId}/executions/{executionId}'
                .gsub('{functionId}', function_id)
                .gsub('{executionId}', execution_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if execution_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "executionId"')
            end

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
                response_type: Models::Execution
            )
        end

        
        # Get a list of all variables of a specific function.
        #
        # @param [String] function_id Function unique ID.
        #
        # @return [VariableList]
        def list_variables(function_id:)
            path = '/functions/{functionId}/variables'
                .gsub('{functionId}', function_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

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
                response_type: Models::VariableList
            )
        end

        
        # Create a new function variable. These variables can be accessed within
        # function in the `env` object under the request variable.
        #
        # @param [String] function_id Function unique ID.
        # @param [String] key Variable key. Max length: 255 chars.
        # @param [String] value Variable value. Max length: 8192 chars.
        #
        # @return [Variable]
        def create_variable(function_id:, key:, value:)
            path = '/functions/{functionId}/variables'
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

            params = {
                key: key,
                value: value,
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                headers: headers,
                params: params,
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
            path = '/functions/{functionId}/variables/{variableId}'
                .gsub('{functionId}', function_id)
                .gsub('{variableId}', variable_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
            end

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
            path = '/functions/{functionId}/variables/{variableId}'
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

            params = {
                key: key,
                value: value,
            }
            
            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PUT',
                path: path,
                headers: headers,
                params: params,
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
            path = '/functions/{functionId}/variables/{variableId}'
                .gsub('{functionId}', function_id)
                .gsub('{variableId}', variable_id)

            if function_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if variable_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "variableId"')
            end

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

        
    end 
end