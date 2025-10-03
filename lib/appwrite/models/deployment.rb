#frozen_string_literal: true

module Appwrite
    module Models
        class Deployment
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :type
            attr_reader :resource_id
            attr_reader :resource_type
            attr_reader :entrypoint
            attr_reader :source_size
            attr_reader :build_size
            attr_reader :total_size
            attr_reader :build_id
            attr_reader :activate
            attr_reader :screenshot_light
            attr_reader :screenshot_dark
            attr_reader :status
            attr_reader :build_logs
            attr_reader :build_duration
            attr_reader :provider_repository_name
            attr_reader :provider_repository_owner
            attr_reader :provider_repository_url
            attr_reader :provider_commit_hash
            attr_reader :provider_commit_author_url
            attr_reader :provider_commit_author
            attr_reader :provider_commit_message
            attr_reader :provider_commit_url
            attr_reader :provider_branch
            attr_reader :provider_branch_url

            def initialize(
                id:,
                created_at:,
                updated_at:,
                type:,
                resource_id:,
                resource_type:,
                entrypoint:,
                source_size:,
                build_size:,
                total_size:,
                build_id:,
                activate:,
                screenshot_light:,
                screenshot_dark:,
                status:,
                build_logs:,
                build_duration:,
                provider_repository_name:,
                provider_repository_owner:,
                provider_repository_url:,
                provider_commit_hash:,
                provider_commit_author_url:,
                provider_commit_author:,
                provider_commit_message:,
                provider_commit_url:,
                provider_branch:,
                provider_branch_url:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @type = type
                @resource_id = resource_id
                @resource_type = resource_type
                @entrypoint = entrypoint
                @source_size = source_size
                @build_size = build_size
                @total_size = total_size
                @build_id = build_id
                @activate = activate
                @screenshot_light = screenshot_light
                @screenshot_dark = screenshot_dark
                @status = validate_status(status)
                @build_logs = build_logs
                @build_duration = build_duration
                @provider_repository_name = provider_repository_name
                @provider_repository_owner = provider_repository_owner
                @provider_repository_url = provider_repository_url
                @provider_commit_hash = provider_commit_hash
                @provider_commit_author_url = provider_commit_author_url
                @provider_commit_author = provider_commit_author
                @provider_commit_message = provider_commit_message
                @provider_commit_url = provider_commit_url
                @provider_branch = provider_branch
                @provider_branch_url = provider_branch_url
            end

            def self.from(map:)
                Deployment.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    type: map["type"],
                    resource_id: map["resourceId"],
                    resource_type: map["resourceType"],
                    entrypoint: map["entrypoint"],
                    source_size: map["sourceSize"],
                    build_size: map["buildSize"],
                    total_size: map["totalSize"],
                    build_id: map["buildId"],
                    activate: map["activate"],
                    screenshot_light: map["screenshotLight"],
                    screenshot_dark: map["screenshotDark"],
                    status: map["status"],
                    build_logs: map["buildLogs"],
                    build_duration: map["buildDuration"],
                    provider_repository_name: map["providerRepositoryName"],
                    provider_repository_owner: map["providerRepositoryOwner"],
                    provider_repository_url: map["providerRepositoryUrl"],
                    provider_commit_hash: map["providerCommitHash"],
                    provider_commit_author_url: map["providerCommitAuthorUrl"],
                    provider_commit_author: map["providerCommitAuthor"],
                    provider_commit_message: map["providerCommitMessage"],
                    provider_commit_url: map["providerCommitUrl"],
                    provider_branch: map["providerBranch"],
                    provider_branch_url: map["providerBranchUrl"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "type": @type,
                    "resourceId": @resource_id,
                    "resourceType": @resource_type,
                    "entrypoint": @entrypoint,
                    "sourceSize": @source_size,
                    "buildSize": @build_size,
                    "totalSize": @total_size,
                    "buildId": @build_id,
                    "activate": @activate,
                    "screenshotLight": @screenshot_light,
                    "screenshotDark": @screenshot_dark,
                    "status": @status,
                    "buildLogs": @build_logs,
                    "buildDuration": @build_duration,
                    "providerRepositoryName": @provider_repository_name,
                    "providerRepositoryOwner": @provider_repository_owner,
                    "providerRepositoryUrl": @provider_repository_url,
                    "providerCommitHash": @provider_commit_hash,
                    "providerCommitAuthorUrl": @provider_commit_author_url,
                    "providerCommitAuthor": @provider_commit_author,
                    "providerCommitMessage": @provider_commit_message,
                    "providerCommitUrl": @provider_commit_url,
                    "providerBranch": @provider_branch,
                    "providerBranchUrl": @provider_branch_url
                }
            end

            private

            def validate_status(status)
                valid_status = [
                    Appwrite::Enums::DeploymentStatus::WAITING,
                    Appwrite::Enums::DeploymentStatus::PROCESSING,
                    Appwrite::Enums::DeploymentStatus::BUILDING,
                    Appwrite::Enums::DeploymentStatus::READY,
                    Appwrite::Enums::DeploymentStatus::FAILED,
                ]

                unless valid_status.include?(status)
                    raise ArgumentError, "Invalid " + status + ". Must be one of: " + valid_status.join(', ')
                end

                status
            end

        end
    end
end
