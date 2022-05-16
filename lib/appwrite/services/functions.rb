#frozen_string_literal: true

module Appwrite
    class Functions < Service

        # Get a list of all the project's functions. You can use the query params to
        # filter your results.
        #
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Maximum number of functions to return in response. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this value to manage pagination. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor ID of the function used as the starting point for the query, excluding the function itself. Should be used for efficient pagination when working with large sets of data. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor_direction Direction of the cursor.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [FunctionList]
        def list(search: nil, limit: nil, offset: nil, cursor: nil, cursor_direction: nil, order_type: nil)
            path = '/functions'

            params = {
                search: search,
                limit: limit,
                offset: offset,
                cursor: cursor,
                cursorDirection: cursor_direction,
                orderType: order_type,
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
        # @param [string] function_id Function ID. Choose your own unique ID or pass the string &quot;unique()&quot; to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [string] name Function name. Max length: 128 chars.
        # @param [array] execute An array of strings with execution permissions. By default no user is granted with any execute permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions. Maximum of 100 scopes are allowed, each 64 characters long.
        # @param [string] runtime Execution runtime.
        # @param [object] vars Key-value JSON object that will be passed to the function as environment variables.
        # @param [array] events Events list. Maximum of 100 events are allowed.
        # @param [string] schedule Schedule CRON syntax.
        # @param [number] timeout Function maximum execution time in seconds.
        #
        # @return [Function]
        def create(function_id:, name:, execute:, runtime:, vars: nil, events: nil, schedule: nil, timeout: nil)
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

            path = '/functions'

            params = {
                functionId: function_id,
                name: name,
                execute: execute,
                runtime: runtime,
                vars: vars,
                events: events,
                schedule: schedule,
                timeout: timeout,
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
        # @param [string] function_id Function ID.
        #
        # @return [Function]
        def get(function_id:)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            path = '/functions/{functionId}'
                .gsub('{functionId}', function_id)

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
        # @param [string] function_id Function ID.
        # @param [string] name Function name. Max length: 128 chars.
        # @param [array] execute An array of strings with execution permissions. By default no user is granted with any execute permissions. [learn more about permissions](https://appwrite.io/docs/permissions) and get a full list of available permissions. Maximum of 100 scopes are allowed, each 64 characters long.
        # @param [object] vars Key-value JSON object that will be passed to the function as environment variables.
        # @param [array] events Events list. Maximum of 100 events are allowed.
        # @param [string] schedule Schedule CRON syntax.
        # @param [number] timeout Maximum execution time in seconds.
        #
        # @return [Function]
        def update(function_id:, name:, execute:, vars: nil, events: nil, schedule: nil, timeout: nil)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if execute.nil?
                raise Appwrite::Exception.new('Missing required parameter: "execute"')
            end

            path = '/functions/{functionId}'
                .gsub('{functionId}', function_id)

            params = {
                name: name,
                execute: execute,
                vars: vars,
                events: events,
                schedule: schedule,
                timeout: timeout,
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
        # @param [string] function_id Function ID.
        #
        # @return []
        def delete(function_id:)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            path = '/functions/{functionId}'
                .gsub('{functionId}', function_id)

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
        # @param [string] function_id Function ID.
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Maximum number of deployments to return in response. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this value to manage pagination. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor ID of the deployment used as the starting point for the query, excluding the deployment itself. Should be used for efficient pagination when working with large sets of data. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor_direction Direction of the cursor.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [DeploymentList]
        def list_deployments(function_id:, search: nil, limit: nil, offset: nil, cursor: nil, cursor_direction: nil, order_type: nil)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            path = '/functions/{functionId}/deployments'
                .gsub('{functionId}', function_id)

            params = {
                search: search,
                limit: limit,
                offset: offset,
                cursor: cursor,
                cursorDirection: cursor_direction,
                orderType: order_type,
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
        # @param [string] function_id Function ID.
        # @param [string] entrypoint Entrypoint File.
        # @param [file] code Gzip file with your code package. When used with the Appwrite CLI, pass the path to your code directory, and the CLI will automatically package your code. Use a path that is within the current directory.
        # @param [boolean] activate Automatically activate the deployment when it is finished building.
        #
        # @return [Deployment]
        def create_deployment(function_id:, entrypoint:, code:, activate:, on_progress: nil)
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

            path = '/functions/{functionId}/deployments'
                .gsub('{functionId}', function_id)

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
        # @param [string] function_id Function ID.
        # @param [string] deployment_id Deployment ID.
        #
        # @return [DeploymentList]
        def get_deployment(function_id:, deployment_id:)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if deployment_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
            end

            path = '/functions/{functionId}/deployments/{deploymentId}'
                .gsub('{functionId}', function_id)
                .gsub('{deploymentId}', deployment_id)

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
                response_type: Models::DeploymentList
            )
        end

        # Update the function code deployment ID using the unique function ID. Use
        # this endpoint to switch the code deployment that should be executed by the
        # execution endpoint.
        #
        # @param [string] function_id Function ID.
        # @param [string] deployment_id Deployment ID.
        #
        # @return [Function]
        def update_deployment(function_id:, deployment_id:)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if deployment_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
            end

            path = '/functions/{functionId}/deployments/{deploymentId}'
                .gsub('{functionId}', function_id)
                .gsub('{deploymentId}', deployment_id)

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
        # @param [string] function_id Function ID.
        # @param [string] deployment_id Deployment ID.
        #
        # @return []
        def delete_deployment(function_id:, deployment_id:)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if deployment_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
            end

            path = '/functions/{functionId}/deployments/{deploymentId}'
                .gsub('{functionId}', function_id)
                .gsub('{deploymentId}', deployment_id)

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
        # @param [string] function_id Function ID.
        # @param [string] deployment_id Deployment ID.
        # @param [string] build_id Build unique ID.
        #
        # @return []
        def retry_build(function_id:, deployment_id:, build_id:)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if deployment_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
            end

            if build_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "buildId"')
            end

            path = '/functions/{functionId}/deployments/{deploymentId}/builds/{buildId}'
                .gsub('{functionId}', function_id)
                .gsub('{deploymentId}', deployment_id)
                .gsub('{buildId}', build_id)

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
        # query params to filter your results. On admin mode, this endpoint will
        # return a list of all of the project's executions. [Learn more about
        # different API modes](/docs/admin).
        #
        # @param [string] function_id Function ID.
        # @param [number] limit Maximum number of executions to return in response. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Offset value. The default value is 0. Use this value to manage pagination. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [string] cursor ID of the execution used as the starting point for the query, excluding the execution itself. Should be used for efficient pagination when working with large sets of data. [learn more about pagination](https://appwrite.io/docs/pagination)
        # @param [string] cursor_direction Direction of the cursor.
        #
        # @return [ExecutionList]
        def list_executions(function_id:, limit: nil, offset: nil, search: nil, cursor: nil, cursor_direction: nil)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            path = '/functions/{functionId}/executions'
                .gsub('{functionId}', function_id)

            params = {
                limit: limit,
                offset: offset,
                search: search,
                cursor: cursor,
                cursorDirection: cursor_direction,
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
        # @param [string] function_id Function ID.
        # @param [string] data String of custom data to send to function.
        # @param [boolean] async Execute code asynchronously. Default value is true.
        #
        # @return [Execution]
        def create_execution(function_id:, data: nil, async: nil)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            path = '/functions/{functionId}/executions'
                .gsub('{functionId}', function_id)

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
        # @param [string] function_id Function ID.
        # @param [string] execution_id Execution ID.
        #
        # @return [Execution]
        def get_execution(function_id:, execution_id:)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if execution_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "executionId"')
            end

            path = '/functions/{functionId}/executions/{executionId}'
                .gsub('{functionId}', function_id)
                .gsub('{executionId}', execution_id)

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

    end 
end