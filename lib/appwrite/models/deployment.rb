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
            attr_reader :size
            attr_reader :build_id
            attr_reader :activate
            attr_reader :status
            attr_reader :build_logs
            attr_reader :build_time
            attr_reader :provider_repository_name
            attr_reader :provider_repository_owner
            attr_reader :provider_repository_url
            attr_reader :provider_branch
            attr_reader :provider_commit_hash
            attr_reader :provider_commit_author_url
            attr_reader :provider_commit_author
            attr_reader :provider_commit_message
            attr_reader :provider_commit_url
            attr_reader :provider_branch_url

            def initialize(
                id:,
                created_at:,
                updated_at:,
                type:,
                resource_id:,
                resource_type:,
                entrypoint:,
                size:,
                build_id:,
                activate:,
                status:,
                build_logs:,
                build_time:,
                provider_repository_name:,
                provider_repository_owner:,
                provider_repository_url:,
                provider_branch:,
                provider_commit_hash:,
                provider_commit_author_url:,
                provider_commit_author:,
                provider_commit_message:,
                provider_commit_url:,
                provider_branch_url:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @type = type
                @resource_id = resource_id
                @resource_type = resource_type
                @entrypoint = entrypoint
                @size = size
                @build_id = build_id
                @activate = activate
                @status = status
                @build_logs = build_logs
                @build_time = build_time
                @provider_repository_name = provider_repository_name
                @provider_repository_owner = provider_repository_owner
                @provider_repository_url = provider_repository_url
                @provider_branch = provider_branch
                @provider_commit_hash = provider_commit_hash
                @provider_commit_author_url = provider_commit_author_url
                @provider_commit_author = provider_commit_author
                @provider_commit_message = provider_commit_message
                @provider_commit_url = provider_commit_url
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
                    size: map["size"],
                    build_id: map["buildId"],
                    activate: map["activate"],
                    status: map["status"],
                    build_logs: map["buildLogs"],
                    build_time: map["buildTime"],
                    provider_repository_name: map["providerRepositoryName"],
                    provider_repository_owner: map["providerRepositoryOwner"],
                    provider_repository_url: map["providerRepositoryUrl"],
                    provider_branch: map["providerBranch"],
                    provider_commit_hash: map["providerCommitHash"],
                    provider_commit_author_url: map["providerCommitAuthorUrl"],
                    provider_commit_author: map["providerCommitAuthor"],
                    provider_commit_message: map["providerCommitMessage"],
                    provider_commit_url: map["providerCommitUrl"],
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
                    "size": @size,
                    "buildId": @build_id,
                    "activate": @activate,
                    "status": @status,
                    "buildLogs": @build_logs,
                    "buildTime": @build_time,
                    "providerRepositoryName": @provider_repository_name,
                    "providerRepositoryOwner": @provider_repository_owner,
                    "providerRepositoryUrl": @provider_repository_url,
                    "providerBranch": @provider_branch,
                    "providerCommitHash": @provider_commit_hash,
                    "providerCommitAuthorUrl": @provider_commit_author_url,
                    "providerCommitAuthor": @provider_commit_author,
                    "providerCommitMessage": @provider_commit_message,
                    "providerCommitUrl": @provider_commit_url,
                    "providerBranchUrl": @provider_branch_url
                }
            end
        end
    end
end
