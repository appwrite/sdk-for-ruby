#frozen_string_literal: true

module Appwrite
    module Models
        class Deployment
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :resource_id
            attr_reader :resource_type
            attr_reader :entrypoint
            attr_reader :size
            attr_reader :build_id
            attr_reader :activate
            attr_reader :status
            attr_reader :build_stdout
            attr_reader :build_stderr

            def initialize(
                id:,
                created_at:,
                updated_at:,
                resource_id:,
                resource_type:,
                entrypoint:,
                size:,
                build_id:,
                activate:,
                status:,
                build_stdout:,
                build_stderr:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @resource_id = resource_id
                @resource_type = resource_type
                @entrypoint = entrypoint
                @size = size
                @build_id = build_id
                @activate = activate
                @status = status
                @build_stdout = build_stdout
                @build_stderr = build_stderr
            end

            def self.from(map:)
                Deployment.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    resource_id: map["resourceId"],
                    resource_type: map["resourceType"],
                    entrypoint: map["entrypoint"],
                    size: map["size"],
                    build_id: map["buildId"],
                    activate: map["activate"],
                    status: map["status"],
                    build_stdout: map["buildStdout"],
                    build_stderr: map["buildStderr"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "resourceId": @resource_id,
                    "resourceType": @resource_type,
                    "entrypoint": @entrypoint,
                    "size": @size,
                    "buildId": @build_id,
                    "activate": @activate,
                    "status": @status,
                    "buildStdout": @build_stdout,
                    "buildStderr": @build_stderr
                }
            end
        end
    end
end