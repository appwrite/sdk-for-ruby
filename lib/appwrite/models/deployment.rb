#frozen_string_literal: true

module Appwrite
    module Models
        class Deployment
            attr_reader :id
            attr_reader :resource_id
            attr_reader :resource_type
            attr_reader :date_created
            attr_reader :entrypoint
            attr_reader :size
            attr_reader :build_id
            attr_reader :activate
            attr_reader :status
            attr_reader :build_stdout
            attr_reader :build_stderr

            def initialize(
                id:,
                resource_id:,
                resource_type:,
                date_created:,
                entrypoint:,
                size:,
                build_id:,
                activate:,
                status:,
                build_stdout:,
                build_stderr:
            )
                @id = id
                @resource_id = resource_id
                @resource_type = resource_type
                @date_created = date_created
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
                    resource_id: map["resourceId"],
                    resource_type: map["resourceType"],
                    date_created: map["dateCreated"],
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
                    "resourceId": @resource_id,
                    "resourceType": @resource_type,
                    "dateCreated": @date_created,
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