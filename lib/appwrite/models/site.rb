#frozen_string_literal: true

module Appwrite
    module Models
        class Site
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :name
            attr_reader :enabled
            attr_reader :live
            attr_reader :logging
            attr_reader :framework
            attr_reader :deployment_id
            attr_reader :deployment_created_at
            attr_reader :deployment_screenshot_light
            attr_reader :deployment_screenshot_dark
            attr_reader :latest_deployment_id
            attr_reader :latest_deployment_created_at
            attr_reader :latest_deployment_status
            attr_reader :vars
            attr_reader :timeout
            attr_reader :install_command
            attr_reader :build_command
            attr_reader :output_directory
            attr_reader :installation_id
            attr_reader :provider_repository_id
            attr_reader :provider_branch
            attr_reader :provider_root_directory
            attr_reader :provider_silent_mode
            attr_reader :specification
            attr_reader :build_runtime
            attr_reader :adapter
            attr_reader :fallback_file

            def initialize(
                id:,
                created_at:,
                updated_at:,
                name:,
                enabled:,
                live:,
                logging:,
                framework:,
                deployment_id:,
                deployment_created_at:,
                deployment_screenshot_light:,
                deployment_screenshot_dark:,
                latest_deployment_id:,
                latest_deployment_created_at:,
                latest_deployment_status:,
                vars:,
                timeout:,
                install_command:,
                build_command:,
                output_directory:,
                installation_id:,
                provider_repository_id:,
                provider_branch:,
                provider_root_directory:,
                provider_silent_mode:,
                specification:,
                build_runtime:,
                adapter:,
                fallback_file:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @name = name
                @enabled = enabled
                @live = live
                @logging = logging
                @framework = framework
                @deployment_id = deployment_id
                @deployment_created_at = deployment_created_at
                @deployment_screenshot_light = deployment_screenshot_light
                @deployment_screenshot_dark = deployment_screenshot_dark
                @latest_deployment_id = latest_deployment_id
                @latest_deployment_created_at = latest_deployment_created_at
                @latest_deployment_status = latest_deployment_status
                @vars = vars
                @timeout = timeout
                @install_command = install_command
                @build_command = build_command
                @output_directory = output_directory
                @installation_id = installation_id
                @provider_repository_id = provider_repository_id
                @provider_branch = provider_branch
                @provider_root_directory = provider_root_directory
                @provider_silent_mode = provider_silent_mode
                @specification = specification
                @build_runtime = build_runtime
                @adapter = adapter
                @fallback_file = fallback_file
            end

            def self.from(map:)
                Site.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    name: map["name"],
                    enabled: map["enabled"],
                    live: map["live"],
                    logging: map["logging"],
                    framework: map["framework"],
                    deployment_id: map["deploymentId"],
                    deployment_created_at: map["deploymentCreatedAt"],
                    deployment_screenshot_light: map["deploymentScreenshotLight"],
                    deployment_screenshot_dark: map["deploymentScreenshotDark"],
                    latest_deployment_id: map["latestDeploymentId"],
                    latest_deployment_created_at: map["latestDeploymentCreatedAt"],
                    latest_deployment_status: map["latestDeploymentStatus"],
                    vars: map["vars"].map { |it| Variable.from(map: it) },
                    timeout: map["timeout"],
                    install_command: map["installCommand"],
                    build_command: map["buildCommand"],
                    output_directory: map["outputDirectory"],
                    installation_id: map["installationId"],
                    provider_repository_id: map["providerRepositoryId"],
                    provider_branch: map["providerBranch"],
                    provider_root_directory: map["providerRootDirectory"],
                    provider_silent_mode: map["providerSilentMode"],
                    specification: map["specification"],
                    build_runtime: map["buildRuntime"],
                    adapter: map["adapter"],
                    fallback_file: map["fallbackFile"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "name": @name,
                    "enabled": @enabled,
                    "live": @live,
                    "logging": @logging,
                    "framework": @framework,
                    "deploymentId": @deployment_id,
                    "deploymentCreatedAt": @deployment_created_at,
                    "deploymentScreenshotLight": @deployment_screenshot_light,
                    "deploymentScreenshotDark": @deployment_screenshot_dark,
                    "latestDeploymentId": @latest_deployment_id,
                    "latestDeploymentCreatedAt": @latest_deployment_created_at,
                    "latestDeploymentStatus": @latest_deployment_status,
                    "vars": @vars.map { |it| it.to_map },
                    "timeout": @timeout,
                    "installCommand": @install_command,
                    "buildCommand": @build_command,
                    "outputDirectory": @output_directory,
                    "installationId": @installation_id,
                    "providerRepositoryId": @provider_repository_id,
                    "providerBranch": @provider_branch,
                    "providerRootDirectory": @provider_root_directory,
                    "providerSilentMode": @provider_silent_mode,
                    "specification": @specification,
                    "buildRuntime": @build_runtime,
                    "adapter": @adapter,
                    "fallbackFile": @fallback_file
                }
            end
        end
    end
end
