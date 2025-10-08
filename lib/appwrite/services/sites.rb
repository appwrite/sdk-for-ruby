#frozen_string_literal: true

module Appwrite
    class Sites < Service

        def initialize(client)
            @client = client
        end

        # Get a list of all the project's sites. You can use the query params to
        # filter your results.
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, enabled, framework, deploymentId, buildCommand, installCommand, outputDirectory, installationId
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [SiteList]
        def list(queries: nil, search: nil)
            api_path = '/sites'

            api_params = {
                queries: queries,
                search: search,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::SiteList
            )
        end

        # Create a new site.
        #
        # @param [String] site_id Site ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can't start with a special char. Max length is 36 chars.
        # @param [String] name Site name. Max length: 128 chars.
        # @param [Framework] framework Sites framework.
        # @param [BuildRuntime] build_runtime Runtime to use during build step.
        # @param [] enabled Is site enabled? When set to 'disabled', users cannot access the site but Server SDKs with and API key can still access the site. No data is lost when this is toggled.
        # @param [] logging When disabled, request logs will exclude logs and errors, and site responses will be slightly faster.
        # @param [Integer] timeout Maximum request time in seconds.
        # @param [String] install_command Install Command.
        # @param [String] build_command Build Command.
        # @param [String] output_directory Output Directory for site.
        # @param [Adapter] adapter Framework adapter defining rendering strategy. Allowed values are: static, ssr
        # @param [String] installation_id Appwrite Installation ID for VCS (Version Control System) deployment.
        # @param [String] fallback_file Fallback file for single page application sites.
        # @param [String] provider_repository_id Repository ID of the repo linked to the site.
        # @param [String] provider_branch Production branch for the repo linked to the site.
        # @param [] provider_silent_mode Is the VCS (Version Control System) connection in silent mode for the repo linked to the site? In silent mode, comments will not be made on commits and pull requests.
        # @param [String] provider_root_directory Path to site code in the linked repo.
        # @param [String] specification Framework specification for the site and builds.
        #
        # @return [Site]
        def create(site_id:, name:, framework:, build_runtime:, enabled: nil, logging: nil, timeout: nil, install_command: nil, build_command: nil, output_directory: nil, adapter: nil, installation_id: nil, fallback_file: nil, provider_repository_id: nil, provider_branch: nil, provider_silent_mode: nil, provider_root_directory: nil, specification: nil)
            api_path = '/sites'

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if framework.nil?
              raise Appwrite::Exception.new('Missing required parameter: "framework"')
            end

            if build_runtime.nil?
              raise Appwrite::Exception.new('Missing required parameter: "buildRuntime"')
            end

            api_params = {
                siteId: site_id,
                name: name,
                framework: framework,
                enabled: enabled,
                logging: logging,
                timeout: timeout,
                installCommand: install_command,
                buildCommand: build_command,
                outputDirectory: output_directory,
                buildRuntime: build_runtime,
                adapter: adapter,
                installationId: installation_id,
                fallbackFile: fallback_file,
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
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Site
            )
        end

        # Get a list of all frameworks that are currently available on the server
        # instance.
        #
        #
        # @return [FrameworkList]
        def list_frameworks()
            api_path = '/sites/frameworks'

            api_params = {
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::FrameworkList
            )
        end

        # List allowed site specifications for this instance.
        #
        #
        # @return [SpecificationList]
        def list_specifications()
            api_path = '/sites/specifications'

            api_params = {
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::SpecificationList
            )
        end

        # Get a site by its unique ID.
        #
        # @param [String] site_id Site ID.
        #
        # @return [Site]
        def get(site_id:)
            api_path = '/sites/{siteId}'
                .gsub('{siteId}', site_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
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
                response_type: Models::Site
            )
        end

        # Update site by its unique ID.
        #
        # @param [String] site_id Site ID.
        # @param [String] name Site name. Max length: 128 chars.
        # @param [Framework] framework Sites framework.
        # @param [] enabled Is site enabled? When set to 'disabled', users cannot access the site but Server SDKs with and API key can still access the site. No data is lost when this is toggled.
        # @param [] logging When disabled, request logs will exclude logs and errors, and site responses will be slightly faster.
        # @param [Integer] timeout Maximum request time in seconds.
        # @param [String] install_command Install Command.
        # @param [String] build_command Build Command.
        # @param [String] output_directory Output Directory for site.
        # @param [BuildRuntime] build_runtime Runtime to use during build step.
        # @param [Adapter] adapter Framework adapter defining rendering strategy. Allowed values are: static, ssr
        # @param [String] fallback_file Fallback file for single page application sites.
        # @param [String] installation_id Appwrite Installation ID for VCS (Version Control System) deployment.
        # @param [String] provider_repository_id Repository ID of the repo linked to the site.
        # @param [String] provider_branch Production branch for the repo linked to the site.
        # @param [] provider_silent_mode Is the VCS (Version Control System) connection in silent mode for the repo linked to the site? In silent mode, comments will not be made on commits and pull requests.
        # @param [String] provider_root_directory Path to site code in the linked repo.
        # @param [String] specification Framework specification for the site and builds.
        #
        # @return [Site]
        def update(site_id:, name:, framework:, enabled: nil, logging: nil, timeout: nil, install_command: nil, build_command: nil, output_directory: nil, build_runtime: nil, adapter: nil, fallback_file: nil, installation_id: nil, provider_repository_id: nil, provider_branch: nil, provider_silent_mode: nil, provider_root_directory: nil, specification: nil)
            api_path = '/sites/{siteId}'
                .gsub('{siteId}', site_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

            if name.nil?
              raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if framework.nil?
              raise Appwrite::Exception.new('Missing required parameter: "framework"')
            end

            api_params = {
                name: name,
                framework: framework,
                enabled: enabled,
                logging: logging,
                timeout: timeout,
                installCommand: install_command,
                buildCommand: build_command,
                outputDirectory: output_directory,
                buildRuntime: build_runtime,
                adapter: adapter,
                fallbackFile: fallback_file,
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
                response_type: Models::Site
            )
        end

        # Delete a site by its unique ID.
        #
        # @param [String] site_id Site ID.
        #
        # @return []
        def delete(site_id:)
            api_path = '/sites/{siteId}'
                .gsub('{siteId}', site_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
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

        # Update the site active deployment. Use this endpoint to switch the code
        # deployment that should be used when visitor opens your site.
        #
        # @param [String] site_id Site ID.
        # @param [String] deployment_id Deployment ID.
        #
        # @return [Site]
        def update_site_deployment(site_id:, deployment_id:)
            api_path = '/sites/{siteId}/deployment'
                .gsub('{siteId}', site_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

            if deployment_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
            end

            api_params = {
                deploymentId: deployment_id,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Site
            )
        end

        # Get a list of all the site's code deployments. You can use the query params
        # to filter your results.
        #
        # @param [String] site_id Site ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: buildSize, sourceSize, totalSize, buildDuration, status, activate, type
        # @param [String] search Search term to filter your list results. Max length: 256 chars.
        #
        # @return [DeploymentList]
        def list_deployments(site_id:, queries: nil, search: nil)
            api_path = '/sites/{siteId}/deployments'
                .gsub('{siteId}', site_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

            api_params = {
                queries: queries,
                search: search,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::DeploymentList
            )
        end

        # Create a new site code deployment. Use this endpoint to upload a new
        # version of your site code. To activate your newly uploaded code, you'll
        # need to update the function's deployment to use your new deployment ID.
        #
        # @param [String] site_id Site ID.
        # @param [file] code Gzip file with your code package. When used with the Appwrite CLI, pass the path to your code directory, and the CLI will automatically package your code. Use a path that is within the current directory.
        # @param [] activate Automatically activate the deployment when it is finished building.
        # @param [String] install_command Install Commands.
        # @param [String] build_command Build Commands.
        # @param [String] output_directory Output Directory.
        #
        # @return [Deployment]
        def create_deployment(site_id:, code:, activate:, install_command: nil, build_command: nil, output_directory: nil, on_progress: nil)
            api_path = '/sites/{siteId}/deployments'
                .gsub('{siteId}', site_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

            if code.nil?
              raise Appwrite::Exception.new('Missing required parameter: "code"')
            end

            if activate.nil?
              raise Appwrite::Exception.new('Missing required parameter: "activate"')
            end

            api_params = {
                installCommand: install_command,
                buildCommand: build_command,
                outputDirectory: output_directory,
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

        # Create a new build for an existing site deployment. This endpoint allows
        # you to rebuild a deployment with the updated site configuration, including
        # its commands and output directory if they have been modified. The build
        # process will be queued and executed asynchronously. The original
        # deployment's code will be preserved and used for the new build.
        #
        # @param [String] site_id Site ID.
        # @param [String] deployment_id Deployment ID.
        #
        # @return [Deployment]
        def create_duplicate_deployment(site_id:, deployment_id:)
            api_path = '/sites/{siteId}/deployments/duplicate'
                .gsub('{siteId}', site_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

            if deployment_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
            end

            api_params = {
                deploymentId: deployment_id,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Deployment
            )
        end

        # Create a deployment based on a template.
        # 
        # Use this endpoint with combination of
        # [listTemplates](https://appwrite.io/docs/products/sites/templates) to find
        # the template details.
        #
        # @param [String] site_id Site ID.
        # @param [String] repository Repository name of the template.
        # @param [String] owner The name of the owner of the template.
        # @param [String] root_directory Path to site code in the template repo.
        # @param [String] version Version (tag) for the repo linked to the site template.
        # @param [] activate Automatically activate the deployment when it is finished building.
        #
        # @return [Deployment]
        def create_template_deployment(site_id:, repository:, owner:, root_directory:, version:, activate: nil)
            api_path = '/sites/{siteId}/deployments/template'
                .gsub('{siteId}', site_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

            if repository.nil?
              raise Appwrite::Exception.new('Missing required parameter: "repository"')
            end

            if owner.nil?
              raise Appwrite::Exception.new('Missing required parameter: "owner"')
            end

            if root_directory.nil?
              raise Appwrite::Exception.new('Missing required parameter: "rootDirectory"')
            end

            if version.nil?
              raise Appwrite::Exception.new('Missing required parameter: "version"')
            end

            api_params = {
                repository: repository,
                owner: owner,
                rootDirectory: root_directory,
                version: version,
                activate: activate,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Deployment
            )
        end

        # Create a deployment when a site is connected to VCS.
        # 
        # This endpoint lets you create deployment from a branch, commit, or a tag.
        #
        # @param [String] site_id Site ID.
        # @param [VCSDeploymentType] type Type of reference passed. Allowed values are: branch, commit
        # @param [String] reference VCS reference to create deployment from. Depending on type this can be: branch name, commit hash
        # @param [] activate Automatically activate the deployment when it is finished building.
        #
        # @return [Deployment]
        def create_vcs_deployment(site_id:, type:, reference:, activate: nil)
            api_path = '/sites/{siteId}/deployments/vcs'
                .gsub('{siteId}', site_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

            if type.nil?
              raise Appwrite::Exception.new('Missing required parameter: "type"')
            end

            if reference.nil?
              raise Appwrite::Exception.new('Missing required parameter: "reference"')
            end

            api_params = {
                type: type,
                reference: reference,
                activate: activate,
            }
            
            api_headers = {
                "content-type": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Deployment
            )
        end

        # Get a site deployment by its unique ID.
        #
        # @param [String] site_id Site ID.
        # @param [String] deployment_id Deployment ID.
        #
        # @return [Deployment]
        def get_deployment(site_id:, deployment_id:)
            api_path = '/sites/{siteId}/deployments/{deploymentId}'
                .gsub('{siteId}', site_id)
                .gsub('{deploymentId}', deployment_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

            if deployment_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
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
                response_type: Models::Deployment
            )
        end

        # Delete a site deployment by its unique ID.
        #
        # @param [String] site_id Site ID.
        # @param [String] deployment_id Deployment ID.
        #
        # @return []
        def delete_deployment(site_id:, deployment_id:)
            api_path = '/sites/{siteId}/deployments/{deploymentId}'
                .gsub('{siteId}', site_id)
                .gsub('{deploymentId}', deployment_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
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

        # Get a site deployment content by its unique ID. The endpoint response
        # return with a 'Content-Disposition: attachment' header that tells the
        # browser to start downloading the file to user downloads directory.
        #
        # @param [String] site_id Site ID.
        # @param [String] deployment_id Deployment ID.
        # @param [DeploymentDownloadType] type Deployment file to download. Can be: "source", "output".
        #
        # @return []
        def get_deployment_download(site_id:, deployment_id:, type: nil)
            api_path = '/sites/{siteId}/deployments/{deploymentId}/download'
                .gsub('{siteId}', site_id)
                .gsub('{deploymentId}', deployment_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

            if deployment_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "deploymentId"')
            end

            api_params = {
                type: type,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Cancel an ongoing site deployment build. If the build is already in
        # progress, it will be stopped and marked as canceled. If the build hasn't
        # started yet, it will be marked as canceled without executing. You cannot
        # cancel builds that have already completed (status 'ready') or failed. The
        # response includes the final build status and details.
        #
        # @param [String] site_id Site ID.
        # @param [String] deployment_id Deployment ID.
        #
        # @return [Deployment]
        def update_deployment_status(site_id:, deployment_id:)
            api_path = '/sites/{siteId}/deployments/{deploymentId}/status'
                .gsub('{siteId}', site_id)
                .gsub('{deploymentId}', deployment_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
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
                response_type: Models::Deployment
            )
        end

        # Get a list of all site logs. You can use the query params to filter your
        # results.
        #
        # @param [String] site_id Site ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: trigger, status, responseStatusCode, duration, requestMethod, requestPath, deploymentId
        #
        # @return [ExecutionList]
        def list_logs(site_id:, queries: nil)
            api_path = '/sites/{siteId}/logs'
                .gsub('{siteId}', site_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

            api_params = {
                queries: queries,
            }
            
            api_headers = {
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::ExecutionList
            )
        end

        # Get a site request log by its unique ID.
        #
        # @param [String] site_id Site ID.
        # @param [String] log_id Log ID.
        #
        # @return [Execution]
        def get_log(site_id:, log_id:)
            api_path = '/sites/{siteId}/logs/{logId}'
                .gsub('{siteId}', site_id)
                .gsub('{logId}', log_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

            if log_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "logId"')
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
                response_type: Models::Execution
            )
        end

        # Delete a site log by its unique ID.
        #
        # @param [String] site_id Site ID.
        # @param [String] log_id Log ID.
        #
        # @return []
        def delete_log(site_id:, log_id:)
            api_path = '/sites/{siteId}/logs/{logId}'
                .gsub('{siteId}', site_id)
                .gsub('{logId}', log_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

            if log_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "logId"')
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

        # Get a list of all variables of a specific site.
        #
        # @param [String] site_id Site unique ID.
        #
        # @return [VariableList]
        def list_variables(site_id:)
            api_path = '/sites/{siteId}/variables'
                .gsub('{siteId}', site_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
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
                response_type: Models::VariableList
            )
        end

        # Create a new site variable. These variables can be accessed during build
        # and runtime (server-side rendering) as environment variables.
        #
        # @param [String] site_id Site unique ID.
        # @param [String] key Variable key. Max length: 255 chars.
        # @param [String] value Variable value. Max length: 8192 chars.
        # @param [] secret Secret variables can be updated or deleted, but only sites can read them during build and runtime.
        #
        # @return [Variable]
        def create_variable(site_id:, key:, value:, secret: nil)
            api_path = '/sites/{siteId}/variables'
                .gsub('{siteId}', site_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
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
        # @param [String] site_id Site unique ID.
        # @param [String] variable_id Variable unique ID.
        #
        # @return [Variable]
        def get_variable(site_id:, variable_id:)
            api_path = '/sites/{siteId}/variables/{variableId}'
                .gsub('{siteId}', site_id)
                .gsub('{variableId}', variable_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
            end

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
        # @param [String] site_id Site unique ID.
        # @param [String] variable_id Variable unique ID.
        # @param [String] key Variable key. Max length: 255 chars.
        # @param [String] value Variable value. Max length: 8192 chars.
        # @param [] secret Secret variables can be updated or deleted, but only sites can read them during build and runtime.
        #
        # @return [Variable]
        def update_variable(site_id:, variable_id:, key:, value: nil, secret: nil)
            api_path = '/sites/{siteId}/variables/{variableId}'
                .gsub('{siteId}', site_id)
                .gsub('{variableId}', variable_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
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
        # @param [String] site_id Site unique ID.
        # @param [String] variable_id Variable unique ID.
        #
        # @return []
        def delete_variable(site_id:, variable_id:)
            api_path = '/sites/{siteId}/variables/{variableId}'
                .gsub('{siteId}', site_id)
                .gsub('{variableId}', variable_id)

            if site_id.nil?
              raise Appwrite::Exception.new('Missing required parameter: "siteId"')
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