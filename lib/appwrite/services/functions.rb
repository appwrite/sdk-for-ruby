#frozen_string_literal: true

module Appwrite
    class Functions < Service

        include Models
        # Get a list of all the project's functions. You can use the query params to
        # filter your results.
        #
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Results limit value. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Results offset. The default value is 0. Use this param to manage pagination.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [FunctionList]
        def list(search: nil, limit: nil, offset: nil, order_type: nil)
            path = '/functions'

            params = {
                search: search,
                limit: limit,
                offset: offset,
                orderType: order_type,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                params: params,
                headers: headers,
                response_type: FunctionList
            )
        end

        # Create a new function. You can pass a list of
        # [permissions](/docs/permissions) to allow different project users or team
        # with access to execute the function using the client API.
        #
        # @param [string] name Function name. Max length: 128 chars.
        # @param [array] execute An array of strings with execution permissions. By default no user is granted with any execute permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [string] runtime Execution runtime.
        # @param [object] vars Key-value JSON object.
        # @param [array] events Events list.
        # @param [string] schedule Schedule CRON syntax.
        # @param [number] timeout Function maximum execution time in seconds.
        #
        # @return [Function]
        def create(name:, execute:, runtime:, vars: nil, events: nil, schedule: nil, timeout: nil)
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
                params: params,
                headers: headers,
                response_type: Function
            )
        end

        # Get a function by its unique ID.
        #
        # @param [string] function_id Function unique ID.
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
                params: params,
                headers: headers,
                response_type: Function
            )
        end

        # Update function by its unique ID.
        #
        # @param [string] function_id Function unique ID.
        # @param [string] name Function name. Max length: 128 chars.
        # @param [array] execute An array of strings with execution permissions. By default no user is granted with any execute permissions. [learn more about permissions](/docs/permissions) and get a full list of available permissions.
        # @param [object] vars Key-value JSON object.
        # @param [array] events Events list.
        # @param [string] schedule Schedule CRON syntax.
        # @param [number] timeout Function maximum execution time in seconds.
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
                params: params,
                headers: headers,
                response_type: Function
            )
        end

        # Delete a function by its unique ID.
        #
        # @param [string] function_id Function unique ID.
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
                params: params,
                headers: headers,
            )
        end

        # Get a list of all the current user function execution logs. You can use the
        # query params to filter your results. On admin mode, this endpoint will
        # return a list of all of the project's executions. [Learn more about
        # different API modes](/docs/admin).
        #
        # @param [string] function_id Function unique ID.
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Results limit value. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Results offset. The default value is 0. Use this param to manage pagination.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [ExecutionList]
        def list_executions(function_id:, search: nil, limit: nil, offset: nil, order_type: nil)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            path = '/functions/{functionId}/executions'
                .gsub('{functionId}', function_id)

            params = {
                search: search,
                limit: limit,
                offset: offset,
                orderType: order_type,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                params: params,
                headers: headers,
                response_type: ExecutionList
            )
        end

        # Trigger a function execution. The returned object will return you the
        # current execution status. You can ping the `Get Execution` endpoint to get
        # updates on the current execution status. Once this endpoint is called, your
        # function execution process will start asynchronously.
        #
        # @param [string] function_id Function unique ID.
        # @param [string] data String of custom data to send to function.
        #
        # @return [Execution]
        def create_execution(function_id:, data: nil)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            path = '/functions/{functionId}/executions'
                .gsub('{functionId}', function_id)

            params = {
                data: data,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: path,
                params: params,
                headers: headers,
                response_type: Execution
            )
        end

        # Get a function execution log by its unique ID.
        #
        # @param [string] function_id Function unique ID.
        # @param [string] execution_id Execution unique ID.
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
                params: params,
                headers: headers,
                response_type: Execution
            )
        end

        # Update the function code tag ID using the unique function ID. Use this
        # endpoint to switch the code tag that should be executed by the execution
        # endpoint.
        #
        # @param [string] function_id Function unique ID.
        # @param [string] tag Tag unique ID.
        #
        # @return [Function]
        def update_tag(function_id:, tag:)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if tag.nil?
                raise Appwrite::Exception.new('Missing required parameter: "tag"')
            end

            path = '/functions/{functionId}/tag'
                .gsub('{functionId}', function_id)

            params = {
                tag: tag,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: path,
                params: params,
                headers: headers,
                response_type: Function
            )
        end

        # Get a list of all the project's code tags. You can use the query params to
        # filter your results.
        #
        # @param [string] function_id Function unique ID.
        # @param [string] search Search term to filter your list results. Max length: 256 chars.
        # @param [number] limit Results limit value. By default will return maximum 25 results. Maximum of 100 results allowed per request.
        # @param [number] offset Results offset. The default value is 0. Use this param to manage pagination.
        # @param [string] order_type Order result by ASC or DESC order.
        #
        # @return [TagList]
        def list_tags(function_id:, search: nil, limit: nil, offset: nil, order_type: nil)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            path = '/functions/{functionId}/tags'
                .gsub('{functionId}', function_id)

            params = {
                search: search,
                limit: limit,
                offset: offset,
                orderType: order_type,
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                params: params,
                headers: headers,
                response_type: TagList
            )
        end

        # Create a new function code tag. Use this endpoint to upload a new version
        # of your code function. To execute your newly uploaded code, you'll need to
        # update the function's tag to use your new tag UID.
        # 
        # This endpoint accepts a tar.gz file compressed with your code. Make sure to
        # include any dependencies your code has within the compressed file. You can
        # learn more about code packaging in the [Appwrite Cloud Functions
        # tutorial](/docs/functions).
        # 
        # Use the "command" param to set the entry point used to execute your code.
        #
        # @param [string] function_id Function unique ID.
        # @param [string] command Code execution command.
        # @param [File] code Gzip file with your code package. When used with the Appwrite CLI, pass the path to your code directory, and the CLI will automatically package your code. Use a path that is within the current directory.
        #
        # @return [Tag]
        def create_tag(function_id:, command:, code:)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if command.nil?
                raise Appwrite::Exception.new('Missing required parameter: "command"')
            end

            if code.nil?
                raise Appwrite::Exception.new('Missing required parameter: "code"')
            end

            path = '/functions/{functionId}/tags'
                .gsub('{functionId}', function_id)

            params = {
                command: command,
                code: code,
            }

            headers = {
                "content-type": 'multipart/form-data',
            }

            @client.call(
                method: 'POST',
                path: path,
                params: params,
                headers: headers,
                response_type: Tag
            )
        end

        # Get a code tag by its unique ID.
        #
        # @param [string] function_id Function unique ID.
        # @param [string] tag_id Tag unique ID.
        #
        # @return [Tag]
        def get_tag(function_id:, tag_id:)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if tag_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "tagId"')
            end

            path = '/functions/{functionId}/tags/{tagId}'
                .gsub('{functionId}', function_id)
                .gsub('{tagId}', tag_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: path,
                params: params,
                headers: headers,
                response_type: Tag
            )
        end

        # Delete a code tag by its unique ID.
        #
        # @param [string] function_id Function unique ID.
        # @param [string] tag_id Tag unique ID.
        #
        # @return []
        def delete_tag(function_id:, tag_id:)
            if function_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "functionId"')
            end

            if tag_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "tagId"')
            end

            path = '/functions/{functionId}/tags/{tagId}'
                .gsub('{functionId}', function_id)
                .gsub('{tagId}', tag_id)

            params = {
            }

            headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: path,
                params: params,
                headers: headers,
            )
        end

    end 
end