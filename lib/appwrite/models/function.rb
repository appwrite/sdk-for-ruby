#frozen_string_literal: true

module Appwrite
    module Models
        class Function
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :execute
            attr_reader :name
            attr_reader :enabled
            attr_reader :live
            attr_reader :logging
            attr_reader :runtime
            attr_reader :deployment
            attr_reader :scopes
            attr_reader :vars
            attr_reader :events
            attr_reader :schedule
            attr_reader :timeout
            attr_reader :entrypoint
            attr_reader :commands
            attr_reader :version
            attr_reader :installation_id
            attr_reader :provider_repository_id
            attr_reader :provider_branch
            attr_reader :provider_root_directory
            attr_reader :provider_silent_mode
            attr_reader :specification

            def initialize(
                id:,
                created_at:,
                updated_at:,
                execute:,
                name:,
                enabled:,
                live:,
                logging:,
                runtime:,
                deployment:,
                scopes:,
                vars:,
                events:,
                schedule:,
                timeout:,
                entrypoint:,
                commands:,
                version:,
                installation_id:,
                provider_repository_id:,
                provider_branch:,
                provider_root_directory:,
                provider_silent_mode:,
                specification:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @execute = execute
                @name = name
                @enabled = enabled
                @live = live
                @logging = logging
                @runtime = runtime
                @deployment = deployment
                @scopes = scopes
                @vars = vars
                @events = events
                @schedule = schedule
                @timeout = timeout
                @entrypoint = entrypoint
                @commands = commands
                @version = version
                @installation_id = installation_id
                @provider_repository_id = provider_repository_id
                @provider_branch = provider_branch
                @provider_root_directory = provider_root_directory
                @provider_silent_mode = provider_silent_mode
                @specification = specification
            end

            def self.from(map:)
                Function.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    execute: map["execute"],
                    name: map["name"],
                    enabled: map["enabled"],
                    live: map["live"],
                    logging: map["logging"],
                    runtime: map["runtime"],
                    deployment: map["deployment"],
                    scopes: map["scopes"],
                    vars: map["vars"].map { |it| Variable.from(map: it) },
                    events: map["events"],
                    schedule: map["schedule"],
                    timeout: map["timeout"],
                    entrypoint: map["entrypoint"],
                    commands: map["commands"],
                    version: map["version"],
                    installation_id: map["installationId"],
                    provider_repository_id: map["providerRepositoryId"],
                    provider_branch: map["providerBranch"],
                    provider_root_directory: map["providerRootDirectory"],
                    provider_silent_mode: map["providerSilentMode"],
                    specification: map["specification"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "execute": @execute,
                    "name": @name,
                    "enabled": @enabled,
                    "live": @live,
                    "logging": @logging,
                    "runtime": @runtime,
                    "deployment": @deployment,
                    "scopes": @scopes,
                    "vars": @vars.map { |it| it.to_map },
                    "events": @events,
                    "schedule": @schedule,
                    "timeout": @timeout,
                    "entrypoint": @entrypoint,
                    "commands": @commands,
                    "version": @version,
                    "installationId": @installation_id,
                    "providerRepositoryId": @provider_repository_id,
                    "providerBranch": @provider_branch,
                    "providerRootDirectory": @provider_root_directory,
                    "providerSilentMode": @provider_silent_mode,
                    "specification": @specification
                }
            end
        end
    end
end
