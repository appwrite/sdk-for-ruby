#frozen_string_literal: true

module Appwrite
    module Models
        class TemplateFunction
            attr_reader :icon
            attr_reader :id
            attr_reader :name
            attr_reader :tagline
            attr_reader :permissions
            attr_reader :events
            attr_reader :cron
            attr_reader :timeout
            attr_reader :use_cases
            attr_reader :runtimes
            attr_reader :instructions
            attr_reader :vcs_provider
            attr_reader :provider_repository_id
            attr_reader :provider_owner
            attr_reader :provider_version
            attr_reader :variables
            attr_reader :scopes

            def initialize(
                icon:,
                id:,
                name:,
                tagline:,
                permissions:,
                events:,
                cron:,
                timeout:,
                use_cases:,
                runtimes:,
                instructions:,
                vcs_provider:,
                provider_repository_id:,
                provider_owner:,
                provider_version:,
                variables:,
                scopes:
            )
                @icon = icon
                @id = id
                @name = name
                @tagline = tagline
                @permissions = permissions
                @events = events
                @cron = cron
                @timeout = timeout
                @use_cases = use_cases
                @runtimes = runtimes
                @instructions = instructions
                @vcs_provider = vcs_provider
                @provider_repository_id = provider_repository_id
                @provider_owner = provider_owner
                @provider_version = provider_version
                @variables = variables
                @scopes = scopes
            end

            def self.from(map:)
                TemplateFunction.new(
                    icon: map["icon"],
                    id: map["id"],
                    name: map["name"],
                    tagline: map["tagline"],
                    permissions: map["permissions"],
                    events: map["events"],
                    cron: map["cron"],
                    timeout: map["timeout"],
                    use_cases: map["useCases"],
                    runtimes: map["runtimes"].map { |it| TemplateRuntime.from(map: it) },
                    instructions: map["instructions"],
                    vcs_provider: map["vcsProvider"],
                    provider_repository_id: map["providerRepositoryId"],
                    provider_owner: map["providerOwner"],
                    provider_version: map["providerVersion"],
                    variables: map["variables"].map { |it| TemplateVariable.from(map: it) },
                    scopes: map["scopes"]
                )
            end

            def to_map
                {
                    "icon": @icon,
                    "id": @id,
                    "name": @name,
                    "tagline": @tagline,
                    "permissions": @permissions,
                    "events": @events,
                    "cron": @cron,
                    "timeout": @timeout,
                    "useCases": @use_cases,
                    "runtimes": @runtimes.map { |it| it.to_map },
                    "instructions": @instructions,
                    "vcsProvider": @vcs_provider,
                    "providerRepositoryId": @provider_repository_id,
                    "providerOwner": @provider_owner,
                    "providerVersion": @provider_version,
                    "variables": @variables.map { |it| it.to_map },
                    "scopes": @scopes
                }
            end
        end
    end
end
