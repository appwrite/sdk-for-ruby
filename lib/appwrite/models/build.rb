#frozen_string_literal: true

module Appwrite
    module Models
        class Build
            attr_reader :id
            attr_reader :deployment_id
            attr_reader :status
            attr_reader :stdout
            attr_reader :stderr
            attr_reader :start_time
            attr_reader :end_time
            attr_reader :duration
            attr_reader :size

            def initialize(
                id:,
                deployment_id:,
                status:,
                stdout:,
                stderr:,
                start_time:,
                end_time:,
                duration:,
                size:
            )
                @id = id
                @deployment_id = deployment_id
                @status = status
                @stdout = stdout
                @stderr = stderr
                @start_time = start_time
                @end_time = end_time
                @duration = duration
                @size = size
            end

            def self.from(map:)
                Build.new(
                    id: map["$id"],
                    deployment_id: map["deploymentId"],
                    status: map["status"],
                    stdout: map["stdout"],
                    stderr: map["stderr"],
                    start_time: map["startTime"],
                    end_time: map["endTime"],
                    duration: map["duration"],
                    size: map["size"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "deploymentId": @deployment_id,
                    "status": @status,
                    "stdout": @stdout,
                    "stderr": @stderr,
                    "startTime": @start_time,
                    "endTime": @end_time,
                    "duration": @duration,
                    "size": @size
                }
            end
        end
    end
end
